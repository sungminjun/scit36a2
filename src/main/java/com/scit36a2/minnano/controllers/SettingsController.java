package com.scit36a2.minnano.controllers;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit36a2.minnano.dao.SalesRepo;
import com.scit36a2.minnano.util.CVTExcelReader;
import com.scit36a2.minnano.util.FileService;
import com.scit36a2.minnano.vo.CardVeriTool;
import com.scit36a2.minnano.vo.Expense;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Seat;

// 관리페이지 기능 중 회원관련 기능을 제외한, 테이블 등록/관리, 메뉴 등록/관리, 지출 등록/관리
@Controller
public class SettingsController {

	@Autowired
	SalesRepo repo;

	private static final Logger logger = LoggerFactory.getLogger(SettingsController.class);
	private static final String UPLOADPATH = "D:/mnnpos/";

	@RequestMapping(value = "mgr", method = RequestMethod.GET)
	public String mgr(HttpSession session) {
		logger.info("welcome home");
		return "mgr/mgr";
	}

	// page move method above.
	//
	///////
	///////
	//
	// seat(table) manager methods below

	/**
	 * 해당 회사의 테이블 추가
	 *
	 * @author 최철규
	 */
	@RequestMapping(value = "addtable", method = RequestMethod.POST)
	@ResponseBody
	public String insertseat(Seat seat, HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		seat.setComp_seq(comp_seq);
		// System.out.println(seat);

		int result = repo.insertseat(seat);

		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * 해당 회사의 전체 테이블 목록 조회
	 * 
	 * @author 최철규
	 */
	@RequestMapping(value = "selectseat", method = RequestMethod.POST)
	@ResponseBody
	public List<Seat> selectseat(HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		List<Seat> seatList = new ArrayList<Seat>();
		seatList = repo.selectseat(comp_seq);
		// System.out.println("seatList : " + seatList);
		return seatList;
	}

	/**
	 * 테이블삭제(테이블이름입력받아서)
	 * 
	 * @author 최철규
	 */
	@RequestMapping(value = "deleteseat", method = RequestMethod.POST)
	@ResponseBody
	public String deleteseat(Seat seat, HttpSession session) {
		// 수정사항) 테이블 이름이 아닌, 테이블 seq를 받아서 삭제하도록 변경
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		seat.setComp_seq(comp_seq);
		int result = repo.deleteseat(seat);
//		System.out.println(result);
		if (result == 1) {
			return "success";
		} else {
			result = repo.stopseat(seat);
			if (result != 0) {
				return "success";
			}
		}
		return "fail";
	}

	/**
	 * 테이블수정
	 * 
	 * @author 최철규
	 */
	@RequestMapping(value = "updateseat", method = RequestMethod.POST)
	@ResponseBody
	public String updateseat(HttpSession session, Seat seat) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		seat.setComp_seq(comp_seq);
		int result = repo.updateseat(seat);
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	// seat(table) manager methods above
	//
	///////
	///////
	//
	// menu manager methods below

	// 메뉴등록
	/**
	 * 해당 점포의 메뉴를 등록
	 * 
	 * @author 최철규
	 */
	@RequestMapping(value = "insertMenu", method = RequestMethod.POST)
	@ResponseBody
	public String insertMenu(Menu menu, HttpSession session) {
//		수정사항 개별 var를 string으로 받던것을 vo로 묶어서 받도록 변경
		int comp_seq = (Integer) session.getAttribute("comp_seq");
//		System.out.println(menu);
		menu.setComp_seq(comp_seq);
		int result = repo.insertMenu(menu);
		// System.out.println("컨트롤러 result : " + result);

		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * 해당 점포의 메뉴 목록을 조회
	 * 
	 * @author 최철규
	 */
	@RequestMapping(value = "selectMenu", method = RequestMethod.POST)
	@ResponseBody
	public List<Menu> selectMenu(HttpSession session, Menu menu) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		// List<Menu> menuList = new ArrayList<Menu>();
		menu.setComp_seq(comp_seq);
		List<Menu> result = repo.selectMenu(menu);
		// System.out.println("menuList : " + result);
		return result;
	}

	/**
	 * 메뉴 삭제
	 * 
	 * @author 최철규
	 */
	@RequestMapping(value = "deleteMenu", method = RequestMethod.POST)
	@ResponseBody
	public String deleteMenu(Menu menu, HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		menu.setComp_seq(comp_seq);
		int result = repo.deleteMenu(menu);

		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * 메뉴 업데이트
	 * 
	 * @author 최철규, 전성민
	 */
	@RequestMapping(value = "updateMenu", method = RequestMethod.POST)
	@ResponseBody
	public String updateMenu(HttpSession session, Menu menu) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		menu.setComp_seq(comp_seq);
//		System.out.println(menu);
//		System.out.println(menu.getMenu_name());
//		System.out.println(menu.getMenu_name().getClass());

		int result = repo.updateMenu(menu);
		/*
		 * int Emp_auth_level = employee.getEmp_auth_level(); if (Emp_auth_level == 9) {
		 * int result = repo.updateMenu(menu_seq); return "success"; } else { return
		 * "false"; }
		 */
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	// menu manager methods above
	//
	///////
	///////
	//
	// expense manager methods below

	@RequestMapping(value = "insertExpense", method = RequestMethod.POST)
	public @ResponseBody String insertExpense(HttpSession session, Expense expense) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
//		System.out.println(expense);
		expense.setComp_seq(comp_seq);
		int result = repo.insertExpense(expense);

		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "selectExpense", method = RequestMethod.POST)
	public @ResponseBody List<Expense> selectExpense(HttpSession session, String month, HashMap<String, Object> map) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("month", month);
		map.put("comp_seq", comp_seq);
		List<Expense> expenseList = repo.selectExpense(map);
		return expenseList;
	}

	@RequestMapping(value = "deleteExpense", method = RequestMethod.POST)
	@ResponseBody
	public String deleteExpense(Expense expense) {
		int result = repo.deleteExpense(expense);
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "updateExpense", method = RequestMethod.POST)
	@ResponseBody
	public String updateExpense(Expense expense) {
		int result = repo.updateExpense(expense);
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	// expense manager methods above
	//
	///////
	// test for testcard

	@RequestMapping(value = "/cardverify", method = RequestMethod.GET)
	public String cardverify() {
		return "mgr/cvt";
	}

	// test for testcard // 결제타입 1이 카드이다.
	@RequestMapping(value = "/cvtupload", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> testcvtupload(HttpSession session, MultipartFile file, HashMap<String, Object> map) {
		// session에서 comp_seq와 경로를 설정
		int comp_seq = (int) session.getAttribute("comp_seq");
		String path = FileService.saveFile(file, UPLOADPATH);

		// CVTExcelReader 를 이용해서 업로드 받은 xls파일을 읽어들인다.
		CVTExcelReader excelReader = new CVTExcelReader();
		List<CardVeriTool> xlsList = excelReader.xls2cvtVO(UPLOADPATH + path);

		// DB에서 엑셀의 날짜와 동일한 날#{inqdate}의 회사#{comp_seq}데이터를 가져온다
		map.put("inqdate", xlsList.get(0).getCvt_date());
		map.put("comp_seq", comp_seq);
//		System.out.println("rcvmap: " + map);
		List<HashMap<String, Object>> pmtList = repo.selectCVTdata(map);

		// 두개의 list형 자료를 비교하기 시작
		DateFormat dateform = new SimpleDateFormat("HH:mm");
		final long ONE_MINUTE = 60000; // in millissec

		int sumXls = 0;
		int countXls = 0;
		int errCntXls = 0;
		int sumDb = 0;
		int countDb = 0;
		int errCntDb = 0;
		int eqCnt = 0;

		HashMap<Object, HashMap<String, Object>> xlserr = new HashMap<Object, HashMap<String, Object>>();
		HashMap<Object, HashMap<String, Object>> dberr = new HashMap<Object, HashMap<String, Object>>();

		for (CardVeriTool cvt : xlsList) {
			sumXls += cvt.getCvt_amount();
			countXls++;
			int temp_cvt_amount = cvt.getCvt_amount();
			String temp_cvt_time = cvt.getCvt_time().substring(0, 5);
			Date cvt_time_parsed = new Date();
			try {
				cvt_time_parsed = dateform.parse(temp_cvt_time);
			} catch (ParseException e) {
				System.out.println("parseException occurs @ cvtupload");
			}
			Date add1 = new Date(cvt_time_parsed.getTime() + (1 * ONE_MINUTE));
			String cvt_time_add1 = add1.getHours() + ":"
					+ (add1.getMinutes() < 10 ? "0" + add1.getMinutes() : add1.getMinutes());
			Date add2 = new Date(cvt_time_parsed.getTime() + (2 * ONE_MINUTE));
			String cvt_time_add2 = add2.getHours() + ":"
					+ (add2.getMinutes() < 10 ? "0" + add2.getMinutes() : add2.getMinutes());
			Date redu1 = new Date(cvt_time_parsed.getTime() - (1 * ONE_MINUTE));
			String cvt_time_redu1 = redu1.getHours() + ":"
					+ (redu1.getMinutes() < 10 ? "0" + redu1.getMinutes() : redu1.getMinutes());
			Date redu2 = new Date(cvt_time_parsed.getTime() - (2 * ONE_MINUTE));
			String cvt_time_redu2 = redu2.getHours() + ":"
					+ (redu2.getMinutes() < 10 ? "0" + redu2.getMinutes() : redu2.getMinutes());
//			Date test = new Date(cvt_time_parsed.getTime() - (10 * ONE_MINUTE));
//			String teststr = test.getHours() + ":" + (test.getMinutes() < 10 ? "0" + test.getMinutes() : test.getMinutes());
//			Date test2 = new Date(cvt_time_parsed.getTime() + (10 * ONE_MINUTE));
//			String test2str = test2.getHours() + ":" + (test2.getMinutes() < 10 ? "0" + test2.getMinutes() : test2.getMinutes());
//			System.out.println(temp_cvt_amount + ", cvt_time(hh:mm)" + temp_cvt_time);
			if (cvt.getGubun().equals("ok"))
				continue;
			for (HashMap<String, Object> pmt : pmtList) {
				if (pmt.get("ok") != null) {
				} else {
					int temp_pmt_amount = ((BigDecimal) pmt.get("PMT_AMOUNT")).intValue();
					String temp_pmt_time = ((String) pmt.get("PMT_TIME")).substring(0, 5);

					if (temp_cvt_amount == temp_pmt_amount && temp_cvt_time.equals(temp_pmt_time)) {
						cvt.setGubun("ok");
						pmt.put("ok", "ok");
						eqCnt++;
//					System.out.println("temp_cvt_amount:" + temp_cvt_amount + " == temp_pmt_amount:" + temp_pmt_amount + " and temp_cvt_time:" + temp_cvt_time + " == temp_pmt_time:" + temp_pmt_time);
					} else if (temp_cvt_amount == temp_pmt_amount && cvt_time_add1.equals(temp_pmt_time)) {
						cvt.setGubun("ok");
						pmt.put("ok", "ok");
						eqCnt++;
					} else if (temp_cvt_amount == temp_pmt_amount && cvt_time_add2.equals(temp_pmt_time)) {
						cvt.setGubun("ok");
						pmt.put("ok", "ok");
						eqCnt++;
					} else if (temp_cvt_amount == temp_pmt_amount && cvt_time_redu1.equals(temp_pmt_time)) {
						cvt.setGubun("ok");
						pmt.put("ok", "ok");
						eqCnt++;
					} else if (temp_cvt_amount == temp_pmt_amount && cvt_time_redu2.equals(temp_pmt_time)) {
						cvt.setGubun("ok");
						pmt.put("ok", "ok");
						eqCnt++;
					}
				}
				// pmt객체의 시간정보 hh24:mi:ss 와 cvt의 시간정보 hh24:mi:ss 를 비교해서
				// 1차 mi가 같으며 값도 같은경우 rownum ok로 수정
				// 2차 pmt_mi 가 cvt_mi+1 이 같은 경우 rownum ok로 수정
				// 3차 pmt_mi 가 cvt_mi+2 가 같은 경우 rownum ok로 수정하고
				// 4차 pmt_mi 가 cvt_mi-1 가 같은 경우 rownum ok로 수정하고
				// 5차 pmt_mi 가 cvt_mi-2 가 같은 경우 rownum ok로 수정하고
				// ok가 아니면 비정상으로 판단해서 출력시킨다.
			}
		}
		// 마지막에 for문 한번 더돌려서 pmt_rownum에서 ok인 것을 뽑아내고,
		// pmt_rownum에서 비정상(=숫자) 인것은 매출은 있으나, 카드결제에 없는것 (현금결제를 카드결제로 오입력)
		// xls에 정상표시가 없는 경우 > 카드결제를 현금결제로 등록한 것으로 정리하여 리스트를 보낸다.

		int idx = 0;
		for (CardVeriTool cvt : xlsList) {
//			System.out.println(cvt);
			if (!cvt.getGubun().equals("ok")) {
				errCntXls++;
				HashMap<String, Object> xlserrobj = new HashMap<String, Object>();
				xlserrobj.put("amount", cvt.getCvt_amount());
				xlserrobj.put("dtime", cvt.getCvt_date() + " " + cvt.getCvt_time());
				xlserr.put(idx++, xlserrobj);
			}
		}
//		System.out.println(xlserr);

		idx = 0;

		for (HashMap<String, Object> pmt : pmtList) {
//			System.out.println(pmt);
			sumDb += ((BigDecimal) pmt.get("PMT_AMOUNT")).intValue();
			countDb++;
			if (pmt.get("ok") == null) {
				errCntDb++;
				HashMap<String, Object> dberrobj = new HashMap<String, Object>();
				dberrobj.put("amount", ((BigDecimal) pmt.get("PMT_AMOUNT")).intValue());
				dberrobj.put("dtime", (String) pmt.get("PMT_TIME"));
				dberr.put(idx++, dberrobj);
			}
		}
//		System.out.println(dberr);

		// 비교를 마치고 자료를 삭제한다.
		System.out.print("cvt done, delete file: ");
		System.out.println(FileService.deleteFile(UPLOADPATH + path));

		// 자료를 돌려보내기 위해 map을 비우고 새로운 자료를 집어넣는다.
		map.clear();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> matome = new HashMap<String, Object>();
		matome.put("sumXls", sumXls);
		matome.put("countXls", countXls);
		matome.put("errCntXls", errCntXls);
		matome.put("sumDb", sumDb);
		matome.put("countDb", countDb);
		matome.put("errCntDb", errCntDb);
		matome.put("eqCnt", eqCnt);

		resultMap.put("matome", matome);
		resultMap.put("dberr", dberr);
		resultMap.put("xlserr", xlserr);

		return resultMap;
	}

}
