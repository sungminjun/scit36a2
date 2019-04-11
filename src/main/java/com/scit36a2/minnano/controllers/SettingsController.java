package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
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

import com.scit36a2.minnano.dao.SalesRepo;
import com.scit36a2.minnano.vo.Expense;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Seat;

// 관리페이지 기능 중 회원관련 기능을 제외한, 테이블 등록/관리, 메뉴 등록/관리, 지출 등록/관리
@Controller
public class SettingsController {

	@Autowired
	SalesRepo repo;

	private static final Logger logger = LoggerFactory.getLogger(SettingsController.class);

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
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
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
		System.out.println(menu);
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
		System.out.println(menu);
		System.out.println(menu.getMenu_name());
		System.out.println(menu.getMenu_name().getClass());

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
		System.out.println(expense);
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

	// 삭제예정 -- mgr으로 통합
	// 지출화면이동
//	@RequestMapping(value = "insertExpense", method = RequestMethod.GET)
//	public String insertExpense() {
//		return "Expense";// 지출화면 jsp 확인
//	}

}
