package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit36a2.minnano.dao.PosRepo;
import com.scit36a2.minnano.vo.Cashonhand;
import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;

@Controller
public class PosController {
	private static final Logger logger = LoggerFactory.getLogger(PosController.class);

	@Autowired
	PosRepo repo;

	@RequestMapping(value = "/pos", method = RequestMethod.GET)
	public String pos() {
		logger.info("welcome pos.");
		return "pos/pos";
	}

	/**
	 * 현재 주문상태에 있는 좌석을 요청
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "/seatsavailable", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> show(HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<Object> seats = repo.seatsavailable(comp_seq);
//		ObjectMapper objmap = new ObjectMapper();
//		String result = "";
//		System.out.println(seats);
//		try {
//			result = objmap.writeValueAsString(seats);
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		}
		return seats;
	}

	/**
	 * create order 임시방편으로처리
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "makeorder", method = RequestMethod.POST)
	public @ResponseBody String makeorder(HttpSession session, Sales_state sas, Sales_detail sad, String ppod,
			@RequestBody HashMap<String, Object> senddata_new) {
//		System.out.println(sas + ", " + sad + ", " + ppod + ", " + senddata_new);
		String result = "";
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		int seqno = repo.chksasseqs();
		sas.setSales_state_seq(seqno);
		sas.setComp_seq(comp_seq);
		sas.setSeat_seq(Integer.parseInt((String) senddata_new.get("seat_seq")));
		sas.setSales_visitors(Integer.parseInt((String) senddata_new.get("sales_visitors")));
		if (((String) senddata_new.get("sales_memo")) == null
				|| ((String) senddata_new.get("sales_memo")).length() == 0) {
			sas.setSales_memo("");
		} else {
			sas.setSales_memo((String) senddata_new.get("sales_memo"));
		}
		int resultSas = repo.insertSas(sas);
		int resultSad = 0;
		String ppods[] = ((String) senddata_new.get("ppod")).split("\\|");
		int chker = 0;
		for (int i = 0; i < ppods.length - 3; i += 4) {
			chker++;
			if (ppods[i].equals("-1")) {
				sad.setSales_discount(Integer.parseInt(ppods[i + 2]));
				sad.setMenu_seq(-1);
			} else {
				sad.setMenu_seq(Integer.parseInt(ppods[i]));
				sad.setSales_order(Integer.parseInt(ppods[i + 3]));
			}
			sad.setSales_state_seq(seqno);
			resultSad += repo.insertSad(sad);
		}
//		System.out.println("makeorder@ resultSas:" + resultSas + ", resultSad:" + resultSad + ", chker:" + chker);
		if (resultSas == 1 && resultSad == chker) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

	/**
	 * replace order : 주문을 수정할 때 다 밀어버리고 새로 등록 -- 임시방편으로
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "replaceorder", method = RequestMethod.POST)
	public @ResponseBody String replaceorder(HttpSession session, Sales_state sas, Sales_detail sad, String ppod,
			@RequestBody HashMap<String, Object> senddata_replace) {
		String result = "";
//		System.out.println(sas + ", " + sad + ", " + ppod + ", " + senddata_replace);
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		int sas_seq = Integer.parseInt((String) senddata_replace.get("sales_state_seq"));
		sas.setComp_seq(comp_seq);
		sas.setSales_state_seq(sas_seq);
		sas.setSeat_seq(Integer.parseInt((String) senddata_replace.get("seat_seq")));
//		sas.setSales_visitors((Integer) senddata_replace.get("sales_visitors"));
		if (((String) senddata_replace.get("sales_memo")) == null
				|| ((String) senddata_replace.get("sales_memo")).length() == 0) {
			sas.setSales_memo("");
		} else {
			sas.setSales_memo((String) senddata_replace.get("sales_memo"));
		}
//		System.out.println(sas);
		int resultSas = repo.updateSasmemo(sas);
		logger.info("replaceorder, resultSas: " + resultSas);
		int deleteOld = repo.deleteoldorder(sas_seq);
		logger.info("replaceorder, deleteOld: " + deleteOld);

		String ppods[] = ((String) senddata_replace.get("ppod")).split("\\|");
		int newodsize = ((String) senddata_replace.get("ppod")).length();
		logger.info("replaceorder, newodsize: " + newodsize);

		int resultreplaceorder = 0;
		int chker = 0;
		for (int i = 0; i < ppods.length - 3; i += 4) {
			chker++;
			if (ppods[i].equals("-1")) {
				int thisdiscount = Integer.parseInt(ppods[i + 2]);
				sad.setSales_discount(thisdiscount);
				sad.setMenu_seq(-1);
			} else {
				sad.setMenu_seq(Integer.parseInt(ppods[i]));
				sad.setSales_order(Integer.parseInt(ppods[i + 3]));
			}
			sad.setSales_state_seq(sas_seq);
			resultreplaceorder += repo.insertSad(sad);
		}

//		System.out.println("replace order@ resultreplaceorder:" + resultreplaceorder + ", chker:" + chker);
		if (resultreplaceorder == chker) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

	/**
	 * 이미 주문되어있는 내용을 호출(sas로 sad의 내용을 호출함)
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "alOrderList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Sales_detail> alOrderList(HttpSession session, int sas_seq) {
//		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<Sales_detail> sadList = repo.alOrderList(sas_seq);

		return sadList;
	}

	// order 관련 내용 (sales_state and sales_detail) above here
	// functions for order list and in-progress(ongoing) order details
	//
	//////
	//////
	//
	// payment 관련 내용처리
	//

	/**
	 * 현금/카드 단건(1건)결제 등록
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "makepayment", method = RequestMethod.POST)
	public @ResponseBody String makepayment(HttpSession session, Payment pmt) {
		String result = "";
		String emp_id = (String) session.getAttribute("emp_id");
		pmt.setPayment_clerk(emp_id);

		int sas_seq = pmt.getSales_state_seq();
		int sasupdateresult = repo.updatesasdone(sas_seq);
		int makepmtresult = repo.makepayment(pmt);
		logger.info("makepayment, sas_seq: " + sas_seq + ", sasupdateresult" + sasupdateresult + ", makepmtresult"
				+ makepmtresult);
		// if 문으로 result 판별해서 처리해야함

		return result;
	}

	/**
	 * 복합결제 등록
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "makepaymentcomplex", method = RequestMethod.POST)
	public @ResponseBody String makepaymentcomplex(HttpSession session, String pmtcmp, Payment pmt) {
		String result = "";
		String emp_id = (String) session.getAttribute("emp_id");
//		System.out.println(pmtcmp);
		String pmtcmps[] = pmtcmp.split("\\|");
		int sas_seq = Integer.parseInt(pmtcmps[0]);
		int chker = 0;

		int sasupdateresult = repo.updatesasdone(sas_seq);
		logger.info("makepaymentcomplex, chker: " + chker + ", sasupdateresult" + sasupdateresult);
		pmt.setSales_state_seq(sas_seq);
		pmt.setPayment_clerk(emp_id);

		int makepmtresult = 0;
		for (int i = 1; i < pmtcmps.length - 1; i += 2) {
			chker++;
			pmt.setPayment_type(Integer.parseInt(pmtcmps[i]));
			pmt.setPayment_amount(Integer.parseInt(pmtcmps[i + 1]));
			makepmtresult += repo.makepayment(pmt);

			pmt.setPayment_type(0);
			pmt.setPayment_type(0);
		}
		logger.info("makepaymentcomplex, makepmtresult: " + makepmtresult);

		return result;
	}

	/**
	 * 금일의 누적 매출을 조회함
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "cumulatepaymenttoday", method = RequestMethod.POST)
	@ResponseBody
	public Integer cumulatepaymenttoday(HttpSession session) {
		// predictCash
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		Integer result = repo.cumulatepaymenttoday(comp_seq);
		if (result == null) {
			result = 0;
		}
		return result;
	}

	/**
	 * 해당 일자의 매출을 조회한다.
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "selectpayments", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Payment> selectpayments(HttpSession session, @RequestBody HashMap<String, Object> map) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
//		System.out.println(map);
		ArrayList<Payment> result = repo.selectpayments(map);
		if (result == null) {
			return null;
		}
		return result;
	}

	//
	// payments 관련 내용 above here (결제=매출 등록, 조회, 누적매출 조회)
	//
	//////
	//////
	//
	// cashonhand 관련 내용 below here
	//

	/**
	 * 현금시재를 예상하는 메소드 (개시, 회수, 투입, 마감에 이용)
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "predicCash", method = RequestMethod.POST)
	@ResponseBody
	public Integer predicCash(HttpSession session) {
		// predictCash
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<Cashonhand> cohs = repo.predictCash(comp_seq);
		Integer predictPmt = 0;
		predictPmt = repo.predictPmtCash(comp_seq);

		Integer result = 0;
		if (cohs != null) {
//			System.out.println(cohs);
			for (Cashonhand c : cohs) {
				if (c.getCashonhand_type() == 1 || c.getCashonhand_type() == 3) {
					result += c.getCashonhand_cash();
				} else if (c.getCashonhand_type() == 2) {
					result -= c.getCashonhand_cash();
				}
			}
		}
		if (predictPmt != null) {
			result += predictPmt;
		}
		return result;
	}

	/**
	 * 현금시재를 조회하는 메소드
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "selectCashonhand", method = RequestMethod.POST)
	@ResponseBody
	public List<Cashonhand> selectCashonhand(HttpSession session, Cashonhand cashonhand) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		cashonhand.setComp_seq(comp_seq);
		List<Cashonhand> result = repo.selectCashonhand(cashonhand);
		return result;
	}

	/**
	 * 현금시재를 등록하는 메소드 (개시, 회수, 투입, 마감에 이용)
	 * 
	 * @author jsm, cck
	 */
	@RequestMapping(value = "insertCashonhand", method = RequestMethod.POST)
	@ResponseBody
	public String insertCashonhand(HttpSession session, Cashonhand coh) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		String emp_id = (String) session.getAttribute("emp_id");
		coh.setComp_seq(comp_seq);
		coh.setCashonhand_register(emp_id);
		int result = repo.insertCashonhand(coh);

		if (result == 1)
			return "success";
		else
			return "fail";
	}

	/**
	 * 원하는 타입의 현금시재 정보 하나를 선택
	 * 
	 * @author jsm
	 */
	@RequestMapping(value = "selectCashOne", method = RequestMethod.POST)
	@ResponseBody
	public List<Cashonhand> selectCashOne(HttpSession session, Cashonhand cashonhand) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		cashonhand.setComp_seq(comp_seq);
		List<Cashonhand> result = repo.selectCashOne(cashonhand);

		return result;
	}

	/**
	 * 현금시재 정보를 삭제
	 * 
	 * @author jsm
	 */
	@RequestMapping(value = "deleteCashonhand", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCashonhand(HttpSession session, Cashonhand cashonhand) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		cashonhand.setComp_seq(comp_seq);
//		System.out.println("cashonhand 컨트롤러 삭제 : " + cashonhand);
		int result = repo.deleteCashonhand(cashonhand);
//		System.out.println("result 컨트롤러 삭제  : " + result);
		return "success";
	}

	//
	// cashonhand 관련 내용 above here
	//
	//////
	//////
	//
	// table 관련(좌석관련) 관리method below here
	//

	/**
	 * 테이블을 이동시킨다.
	 * 
	 * @author jsm
	 */
	@RequestMapping(value = "movetable", method = RequestMethod.POST)
	@ResponseBody
	public int movetable(HttpSession session, @RequestBody HashMap<String, Integer> map) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		int result = 0;
		result = repo.movetable(map);
		logger.info("movetable, comp_seq: " + comp_seq + ", result: " + result);
		return result;
	}

	/**
	 * 테이블을 맞바꾼다.
	 * 
	 * @author jsm
	 */
	@RequestMapping(value = "swaptable", method = RequestMethod.POST)
	@ResponseBody
	public int swaptable(HttpSession session, @RequestBody HashMap<String, Integer> map) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		int result = 0;
		result = repo.swaptable(map);
		logger.info("swaptable, comp_seq: " + comp_seq + ", result: " + result);
		return result;
	}

	/**
	 * 테이블을 합친다.
	 * 
	 * @author jsm
	 */
	@RequestMapping(value = "mergetable", method = RequestMethod.POST)
	@ResponseBody
	public String mergetable(HttpSession session, @RequestBody HashMap<String, Integer> map, Sales_state sas) {
		// detail의 from_sasseq에 해당하는 자료의 sas_seq를 to로 옮긴다
		// from_sasseq state의 정보 중 객수와 메모는 to_sasseq로 옮겨붙인다.
		// from_sasseq state는 삭제한다.
		String result = "fail";

		sas.setSales_state_seq(map.get("from_sasseq"));
//		System.out.println(sas.getSales_state_seq());
		int mergeResult = repo.mergetable(map);
		int delResult = repo.deleteSas(sas);
//		System.out.println("merge : " + mergeResult + ", delR : " + delResult);
		if (mergeResult != 0 && delResult != 0) {
			result = "success";
		}
		return result;
	}

}