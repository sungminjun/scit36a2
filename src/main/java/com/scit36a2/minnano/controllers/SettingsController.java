package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
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

	@RequestMapping(value = "mgr", method = RequestMethod.GET)
	public String mgr(HttpSession session) {
		logger.info("welcome home");
		return "mgr/mgr";
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
		System.out.println("seatList : " + seatList);
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
	@RequestMapping(value = "choitestmenu", method = RequestMethod.GET)
	public String choitestmenu() {
		return "backside/choitestmenu";
	}

	// 메뉴등록
	@RequestMapping(value="insertMenu", method=RequestMethod.POST)
	@ResponseBody
	public String insertMenu(HttpSession session,int menu_sellFlag,String menu_name,int menu_price,String menu_category) {
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		Menu menu = new Menu();
		System.out.println("컨트롤러 comp_seq : " + comp_seq);
		menu.setComp_seq(comp_seq);
		menu.setMenu_sellFlag(menu_sellFlag);
		menu.setMenu_name(menu_name);
		menu.setMenu_price(menu_price);
		menu.setMenu_category(menu_category);
		int result = repo.insertMenu(menu);
		System.out.println("컨트롤러 result : " + result);
	
			return "success";
	
	}

	@RequestMapping(value = "selectMenu", method = RequestMethod.GET)
	@ResponseBody
	public List<Menu> selectMenu(HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		List<Menu> menuList = new ArrayList<Menu>(); 
		menuList = repo.selectMenu(comp_seq);
		System.out.println("menuList : " + menuList);
		return menuList;
	}
	
	@RequestMapping(value = "deleteMenu", method = RequestMethod.POST)
	@ResponseBody
	public String deleteMenu(int menu_seq, HttpSession session, Employee employee) {
		Menu menu = new Menu();
		int comp_seq = (Integer)session.getAttribute("comp_seq");
		menu.setComp_seq(comp_seq);
		menu.setMenu_seq(menu_seq);
		int result = repo.deleteMenu(menu);
		
		return "success";
	}

	@RequestMapping(value = "updateMenu", method = RequestMethod.POST)
	@ResponseBody
	public String updateMenu(HttpSession session, int menu_seq, Employee employee) {
		session.getAttribute("");
		
		/*	int Emp_auth_level = employee.getEmp_auth_level();
		if (Emp_auth_level == 9) {
			int result = repo.updateMenu(menu_seq);
			return "success";
		} else {
			return "false";
		}*/
		return null;
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
