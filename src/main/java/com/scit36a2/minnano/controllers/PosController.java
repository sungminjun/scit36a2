package com.scit36a2.minnano.controllers;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit36a2.minnano.dao.PosRepo;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;




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
		//logger.info("welcome pos.");
		return "backside/choiTestPOS";
	}

	//주문전표(+테이블할당)
	@RequestMapping(value="insertSasSad",method=RequestMethod.POST)
	@ResponseBody
	public String insertSasSad(HttpSession session,Sales_state sales_state,Sales_detail sales_detail,Menu menu)	{
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		System.out.println("comp_seq" + comp_seq);
		
		menu.setComp_seq(comp_seq);
		//System.out.println("menu" + menu);
		//////////////////////////////////
		HashMap<String,Object> map = new HashMap<>();
		
		map.put("sales_state_seq",sales_state.getSales_state_seq());
		
		
		
		map.put("comp_seq",sales_state.getComp_seq());
		map.put("seat_seq",sales_state.getSeat_seq());
		//map.put("sales_start",sales_state.getSales_start());
		//map.put("sales_end",sales_state.getSales_end());
		map.put("sales_visitors",sales_state.getSales_visitors());
		map.put("sales_memo",sales_state.getSales_memo());
		
		map.put("sales_detail_seq",sales_detail.getSales_detail_seq());
		map.put("sales_state_seq",sales_detail.getSales_state_seq());
		map.put("menu_seq",sales_detail.getMenu_seq());
		map.put("sales_order",sales_detail.getSales_order());
		map.put("sales_discount",sales_detail.getSales_discount());
		
		
		System.out.println("map" + map);
		int result = repo.insertSasSad(map);
		System.out.println("result1111" + result);
		if (result >= 1) {
			System.out.println("O" + result);
		}	else	{
			System.out.println("X" + result);
		}
		System.out.println("result33333" + result);		
		return "success";
	}
	
	@RequestMapping(value="selectSas")
	@ResponseBody
	public List<Sales_state> selectSas(int sales_state_seq)	{
		List<Sales_state> select_Sales_stateList = repo.selectSas(sales_state_seq);
		return select_Sales_stateList;
	}
	
	@RequestMapping(value="selectSad")
	@ResponseBody
	public List<Sales_detail> selectSad(int sales_detail_seq)	{
		List<Sales_detail> select_Sales_detailList = repo.selectSad(sales_detail_seq);
		return select_Sales_detailList;
	}
	
	
	
	
	@RequestMapping(value="choitestpayment",method=RequestMethod.GET)
	public String inPayment()	{
		return "choitestpayment";
	}
	@RequestMapping(value="inPay",method=RequestMethod.POST)
	@ResponseBody
	public String insertPayment(HttpSession session,Payment payment)	{
		String payment_clerk = (String)session.getAttribute("emp_id");
		payment.setPayment_clerk(payment_clerk);
		int result = repo.insertPayment(payment);
		
		return "success";
	}
	
	
	

	
	
}
