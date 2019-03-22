package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
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

import com.scit36a2.minnano.dao.SalesRepo;
import com.scit36a2.minnano.vo.Employee;
import com.scit36a2.minnano.vo.Expense;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Seat;

// 관리페이지 기능 중 회원관련 기능을 제외한, 테이블 등록/관리, 메뉴 등록/관리, 지출 등록/관리
@Controller
public class SettingsController {
	@Autowired
	SalesRepo repo;

	private static final Logger logger = LoggerFactory.getLogger(SettingsController.class);

	@RequestMapping(value = "choiTest", method = RequestMethod.GET)
	public String insertseat(HttpSession session) {
		System.out.println((Integer) session.getAttribute("comp_seq"));
		return "choiTest";
	}

	@RequestMapping(value = "addtable", method = RequestMethod.POST)
	@ResponseBody
	public String insertseat(String seat_id, HttpSession session) {

		// int emp_auth_level = employee.getEmp_auth_level();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		
		Seat seat = new Seat();
		seat.setComp_seq(comp_seq);
		seat.setSeat_id(seat_id);
		// if (emp_auth_level == 9) {
		int result = repo.insertseat(seat);
		if (result == 1) {
			System.out.println(seat);
			return "success";
		} else {
			return "fail";
		}
	}

	
	@RequestMapping(value = "selectseat", method = RequestMethod.GET)
	@ResponseBody
	public List<Seat> selectseat(HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		List<Seat> seatList = new ArrayList<Seat>(); 
		seatList = repo.selectseat(comp_seq);
		System.out.println(seatList);
		return seatList;
	}

	// 테이블삭제(테이블이름입력받아서)
	@RequestMapping(value = "deleteseat", method = RequestMethod.POST)
	@ResponseBody
	public String deleteseat(int seat_seq,HttpSession session) {
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		Seat seat = new Seat();
		seat.setComp_seq(comp_seq);
		seat.setSeat_seq(seat_seq);
		int result = repo.deleteseat(seat);
		if (result==1) {
			System.out.println("O");
		}	else	{
			System.out.println("X");
		}
		
		return "success";

	}

	// 테이블수정
	@RequestMapping(value = "updateseat", method = RequestMethod.POST)
	@ResponseBody
	public String updateseat(HttpSession session,int seat_seq) {
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		Seat seat = new Seat();
		seat.setComp_seq(comp_seq);
		seat.setSeat_seq(seat_seq);
		int result = repo.updateseat(seat);
			return "success";
	}

	// 메뉴화면이동
	@RequestMapping(value = "insertMenu", method = RequestMethod.GET)
	public String insertMenu() {
		return "menu";
	}

	// 메뉴등록
	@RequestMapping(value = "insertMenu", method = RequestMethod.POST)
	@ResponseBody
	public String insertMenu(Menu menu, HttpSession session, Employee employee, Model model) {
		String msg = "메뉴등록불가";
		String loginId = (String) session.getAttribute("loginId");
		employee.setEmp_id(loginId);
		int emp_auth_level = employee.getEmp_auth_level();
		if (emp_auth_level == 9) { // 사장일경우
			int result = repo.insertMenu(menu);
			return "success";
		} else {
			model.addAttribute("msg", msg);
			return "seat";
		}

	}

	@RequestMapping(value = "selectMenu", method = RequestMethod.GET)
	@ResponseBody
	public List<Menu> selectMenu(Menu menu, int menu_seq) {
		List<Menu> menuList = repo.selectMenu(menu_seq);
		return menuList;
	}

	@RequestMapping(value = "deleteMenu", method = RequestMethod.POST)
	@ResponseBody
	public String deleteMenu(int menu_seq, HttpSession session, Employee employee) {
		int Emp_auth_level = employee.getEmp_auth_level();
		if (Emp_auth_level == 9) {
			int result = repo.deleteMenu(menu_seq);
			return "success";
		} else {
			return "false";
		}
	}

	@RequestMapping(value = "updateMenu", method = RequestMethod.POST)
	@ResponseBody
	public String updateMenu(HttpSession session, int menu_seq, Employee employee) {
		int Emp_auth_level = employee.getEmp_auth_level();
		if (Emp_auth_level == 9) {
			int result = repo.updateMenu(menu_seq);
			return "success";
		} else {
			return "false";
		}

	}

	// 지출화면이동
	@RequestMapping(value = "insertExpense", method = RequestMethod.GET)
	public String insertExpense() {

		return "Expense";// 지출화면 jsp 확인
	}

	@RequestMapping(value = "insertExpense", method = RequestMethod.POST)
	@ResponseBody
	public String insertExpense(HttpSession session, Expense expense) {
		int result = repo.insertExpense(expense);
		if (result == 1)
			return "success";
		else
			return "fail";
	}

	@RequestMapping(value = "selectExpense", method = RequestMethod.POST)
	public List<Expense> selectExpense(HttpSession session, int expense_seq) {

		List<Expense> expenseList = repo.selectExpense(expense_seq);
		return expenseList;
	}

	@RequestMapping(value = "deleteExpense", method = RequestMethod.POST)
	@ResponseBody
	public String deleteExpense(int expense_seq) {
		int result = repo.deleteExpense(expense_seq);
		if (result == 1)
			return "success";
		else
			return "fail";
	}

	@RequestMapping(value = "updateExpense", method = RequestMethod.POST)
	@ResponseBody
	public String updateExpense(int expense_seq) {
		int result = repo.updateExpense(expense_seq);
		if (result == 1)
			return "success";
		else
			return "fail";
	}

}
