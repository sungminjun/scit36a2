package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
		logger.info("welcome pos.");
		return "pos/pos";
	}
	
	@RequestMapping(value = "/showSeatsAvailable", method = RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String, Object>> show(HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<HashMap<String, Object>> result = repo.seatsavailable(comp_seq);
		System.out.println(result);
		return result;
	}
	
	

	// 주문전표(+테이블할당)
	@RequestMapping(value = "insertSasSad", method = RequestMethod.POST)
	@ResponseBody
	public String insertSasSad(HttpSession session, Sales_state sales_state, Sales_detail sales_detail, Menu menu) {

		int comp_seq = (Integer) session.getAttribute("comp_seq");
		System.out.println("comp_seq" + comp_seq);

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

		System.out.println("map : " + map);
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

	@RequestMapping(value = "selectAll", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> selectPOStwo(Menu menu, HttpSession session, Sales_state sales_state,
			Sales_detail sales_detail) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		menu.setComp_seq(comp_seq);
		ArrayList<HashMap<String, Object>> selectPOStwoMap = repo.selectPOStwo(menu);

		System.out.println("selectPOStwo : " + selectPOStwoMap);
		return selectPOStwoMap;
	}

	@RequestMapping(value = "selectPOS2", method = RequestMethod.POST)
	@ResponseBody
	public List<Menu> selectPOS2(HttpSession session, Sales_state sales_state_seq) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		// List<Menu> menuList = new ArrayList<Menu>();
		sales_state_seq.setComp_seq(comp_seq);
		List<Menu> result = repo.selectPOS2(sales_state_seq);
		System.out.println("menuList : " + result);
		return result;
	}

	@RequestMapping(value = "deleteSasSadPay", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSasSadPay(Sales_state sales_state, HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		System.out.println("삭제 컨트롤러 comp_seq : " + comp_seq);
		sales_state.setComp_seq(comp_seq);
		System.out.println("삭제 컨트롤러 sales_state : " + sales_state);
		int result = repo.deleteSasSadPay(sales_state);
		System.out.println("삭제 컨트롤러 result : " + result);
		return "success";
	}

	@RequestMapping(value = "inPay", method = RequestMethod.POST)
	@ResponseBody
	public String insertPayment(HttpSession session, Payment payment) {
		String payment_clerk = (String) session.getAttribute("emp_id");
		payment.setPayment_clerk(payment_clerk);
		int result = repo.insertPayment(payment);

		return "success";
	}

}
