package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit36a2.minnano.dao.PosRepo;
import com.scit36a2.minnano.vo.Cashonhand;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;
import com.scit36a2.minnano.vo.Seat;

// POS기능 - 메인화면에서 일어나는 기능들 
// 영업개시(시재관리), 테이블 조회, 판매전표 조회, 
// 테이블 이동(=판매조회 전표에 저장된 데이터 수정), 영업마감...
// POS 기능 - 주문화면에서 일어나는 기능들
// 테이블 번호와 
// 
@Controller
public class PosController {

	@Autowired
	PosRepo repo;

	private static final Logger logger = LoggerFactory.getLogger(PosController.class);

	@RequestMapping(value = "/pos", method = RequestMethod.GET)
	public String pos() {
		logger.info("welcome pos.");
		return "pos/pos";
	}
	
	// req list for Order-in-progress
	@RequestMapping(value = "/seatsavailable", method = RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String, Object>> show(HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<HashMap<String, Object>> result = repo.seatsavailable(comp_seq);
		System.out.println(result);
		return result;
	}
	
	// create sales_state and sub-sales_details
	@RequestMapping(value = "insertSasSad", method = RequestMethod.POST)
	@ResponseBody
	public String insertSasSad(HttpSession session, Sales_state sales_state, Sales_detail sales_detail, Menu menu) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		System.out.println("comp_seq" + comp_seq);

		// sas 
		// seq(자동생성), comp(session), sales_start(sysdate), sales_end(sysdate+1) 
		// seat_seq(ajax), sales_visitors(ajax), sales_memo(ajax)
		// sad
		// seq(생성), sas_seq(부여)
		// menu_seq(ajax), sales_order(ajax), sales_discount(ajax)
		
		menu.setComp_seq(comp_seq);

		System.out.println("menu" + menu);
		//////////////////////////////////
		HashMap<String, Object> map = new HashMap<>();

		map.put("menu", menu);
		map.put("sales_state_seq", sales_state);
		map.put("sales_detail", sales_detail);

		map.put("sales_state_seq", sales_state.getSales_state_seq());
		map.put("comp_seq", sales_state.getComp_seq());
		map.put("seat_seq", sales_state.getSeat_seq());
		map.put("sales_start", sales_state.getSales_start());
		map.put("sales_end", sales_state.getSales_end());
		map.put("sales_visitors", sales_state.getSales_visitors());
		map.put("sales_memo", sales_state.getSales_memo());
		map.put("sales_detail_seq", sales_detail.getSales_detail_seq());
		map.put("sales_state_seq", sales_detail.getSales_state_seq());
		map.put("menu_seq", sales_detail.getMenu_seq());
		map.put("sales_order", sales_detail.getSales_order());
		map.put("sales_discount", sales_detail.getSales_discount());

		int result = repo.insertSasSad(map);
		System.out.println("result1 : " + result);
		if (result != 0) {
			System.out.println("O : " + result);
		} else {
			System.out.println("X : " + result);
		}
		System.out.println("result3 : " + result);
		return "success";
	}
	
	
	@RequestMapping(value="selectPOSone",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String,Object>>selectPOSone(HttpSession session,Seat seat,Sales_state sales_state, Sales_detail sales_detail) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
	
	ArrayList<HashMap<String,Object>>result = repo.selectPOSone(comp_seq);
		
		
		System.out.println("selectPOSone1 result : " + result);
		
		return result;
	}
	
	@RequestMapping(value="selectPOStwo",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String,Object>>selectPOStwo(HttpSession session,Menu menu,Sales_state sales_state,Sales_detail sales_detail)	{
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<HashMap<String,Object>> result = repo.selectPOStwo(comp_seq);
		System.out.println("selectPOStwo2 result" + result);
		return result;
	}
	
	@RequestMapping(value = "deleteSasSadPay", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSasSadPay(Sales_state sales_state, HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		System.out.println("삭제 컨트롤러 comp_seq : " + comp_seq);
		sales_state.setComp_seq(comp_seq);
				
		System.out.println("삭제 컨트롤러 sales_state : " + comp_seq);
		int result = repo.deleteSasSadPay(comp_seq);
		System.out.println("삭제 컨트롤러 result : " + result);
		return "success";
	}
	
	@RequestMapping(value="updatePOStwo", method=RequestMethod.POST)
	@ResponseBody
	public int updatePOStwo(HttpSession session,int sales_state_seq,Sales_state sales_state)	{
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		sales_state.setComp_seq(comp_seq);
		//sales_state.setSales_state_seq(sales_state_seq);
		System.out.println("sales_state컨트롤러 : " + sales_state);
		int result = repo.updatePOStwo(sales_state);
		System.out.println("result 컨트롤러 : " + result);
		return result;
	}
	
	
	

	
	@RequestMapping(value="choiTestCashonHand",method=RequestMethod.GET)
	public String choiTestCashonHand()	{
		
		return "backside/choiTestCashonHand";
	}
	
	@RequestMapping(value="insertCashonhand" , method=RequestMethod.POST)
	@ResponseBody
	public String insertCashonhand(HttpSession session,Cashonhand cashonhand)	{
		
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		System.out.println("comp_seq 컨트롤러 : " + comp_seq);
		cashonhand.setComp_seq(comp_seq);
		
		System.out.println("cashonhand 컨트롤러 : " + cashonhand);
		int result = repo.insertCashonhand(cashonhand);
		
		
		
		System.out.println("result 컨트롤러 : " + result);
		
		
		
		
		return "success";
	}

	@RequestMapping(value="selectCashonhand", method=RequestMethod.POST)
	@ResponseBody
	public List<Cashonhand> selectCashonhand(HttpSession session, Cashonhand cashonhand)	{
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		cashonhand.setComp_seq(comp_seq);
		List<Cashonhand> result = repo.selectCashonhand(cashonhand);
		return result;
	}
	@RequestMapping(value="selectCashOne",method=RequestMethod.POST)
	@ResponseBody
	public List<Cashonhand> selectCashOne(HttpSession session,Cashonhand cashonhand)	{
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		cashonhand.setComp_seq(comp_seq);
		List<Cashonhand> result = repo.selectCashOne(cashonhand);
		
		
		return result;
	}
	
	
	
	
	@RequestMapping(value="deleteCashonhand", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCashonhand(HttpSession session, Cashonhand cashonhand , int cashonhand_seq)	{
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		cashonhand.setComp_seq(comp_seq);
		cashonhand.setCashonhand_seq(cashonhand_seq);
		System.out.println("cashonhand 컨트롤러 삭제 : " + cashonhand);
		int result = repo.deleteCashonhand(cashonhand);
		System.out.println("result 컨트롤러 삭제  : " + result);
		System.out.println(cashonhand_seq);
		return "success";
		
	}
	
	@RequestMapping(value="predicCash",method=RequestMethod.POST)
	@ResponseBody
	public String predicCash(HttpSession session)	{
		// predictCash
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		ArrayList<Cashonhand> cohs = repo.predictCash(comp_seq);
		int predictPmtCash = repo.predictPmtCash(comp_seq);
				
	    int result = 0;
		for (Cashonhand c : cohs) {
			if ( c.getCashonhand_type() == 1 || c.getCashonhand_type() == 3 ) {
				result += c.getCashonhand_cash();
			} else if (c.getCashonhand_type() == 2) {
				result -= c.getCashonhand_cash();
			}
		}
		result += predictPmtCash;
		
		System.out.println(result);
				
		
		return "success";
	}
	
	
}
