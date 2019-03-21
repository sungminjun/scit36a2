package com.scit36a2.minnano.controllers;


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

	
	//테이블화면이동
	@RequestMapping(value="insertseat", method=RequestMethod.GET)
	public String insertseat()	{
		return "mgr/seat";
	}
		
	//테이블등록
	@RequestMapping(value = "/insertseat", method = RequestMethod.POST)
	@ResponseBody
	public String insertseat(Seat seat,HttpSession session,Employee employee,Model model) {
			
		String loginId = (String)session.getAttribute("loginId");
		employee.setEmp_id(loginId);
		
		int emp_auth_level = employee.getEmp_auth_level();
		if (emp_auth_level == 9) {	//사장일경우
			int result = repo.insertseat(employee);
			return "success";
		}	else	{
			
			return "fail";
		}
		
	}
	
/*@RequestMapping(value="selectseat", method=RequestMethod.GET)
	@ResponseBody
	public List<Seat> selectseat(HttpSession session)	{
		String loginId = (String)session.getAttribute("loginId");
		
		
		List<Seat> seatList = repo.selectseat(comp_seq);
			return seatList;
	}*/
	
	//테이블삭제(테이블이름입력받아서)
	@RequestMapping(value="deleteseat", method=RequestMethod.POST)
	@ResponseBody
	public String deleteseat(Seat seat, HttpSession session,String seat_id,Employee employee) {
			
		int Emp_auth_level = employee.getEmp_auth_level();
		if (Emp_auth_level == 9) {
			int result = repo.deleteseat(seat_id);
			return "success";
		}	else	{
			return "fail";
		}
		
	}
	//테이블수정
	@RequestMapping(value="updateseat",method=RequestMethod.POST)
	@ResponseBody
	public String updateseat(Seat seat, HttpSession session,String seat_id,Employee employee) {
		
		int Emp_auth_level = employee.getEmp_auth_level();
		if (Emp_auth_level == 9) {
			int result = repo.updateseat(seat_id);
			return "success";
		}	else	{
			return "false";
		}
	}
	
	//메뉴화면이동
	@RequestMapping(value="insertMenu", method=RequestMethod.GET)
	public String insertMenu()	{
		return "menu";
	}
	//메뉴등록
	@RequestMapping(value="insertMenu", method=RequestMethod.POST)
	@ResponseBody
	public String insertMenu(Menu menu,HttpSession session,Employee employee,Model model)	{
		String msg = "메뉴등록불가";
		String loginId = (String)session.getAttribute("loginId");
		employee.setEmp_id(loginId);
		int emp_auth_level = employee.getEmp_auth_level();
		if (emp_auth_level == 9) {	//사장일경우
			int result = repo.insertMenu(menu);
			return "success";
		}	else	{
			model.addAttribute("msg",msg);
			return "seat";
		}
		
		}
	
	@RequestMapping(value="selectMenu", method=RequestMethod.GET)
	@ResponseBody
	public List<Menu> selectMenu(Menu menu, int menu_seq)	{
		List<Menu> menuList = repo.selectMenu(menu_seq);
		return menuList;
	}
		
	
	@RequestMapping(value="deleteMenu", method=RequestMethod.POST)
	@ResponseBody
	public String deleteMenu(int menu_seq,HttpSession session,Employee employee)	{
		int Emp_auth_level = employee.getEmp_auth_level();
		if (Emp_auth_level==9) {
			int result = repo.deleteMenu(menu_seq);
			return "success";
		}	else	{
			return "false";
		}
	}
	@RequestMapping(value="updateMenu", method=RequestMethod.POST)
	@ResponseBody
	public String updateMenu(HttpSession session, int menu_seq,Employee employee)	{
		int Emp_auth_level = employee.getEmp_auth_level();
		if (Emp_auth_level==9) {
			int result = repo.updateMenu(menu_seq);
			return "success";
		}	else	{
			return "false";
		}
		
	}
	
	//지출화면이동
	@RequestMapping(value="insertExpense", method=RequestMethod.GET)
	public String insertExpense()	{
			
		
		return "Expense";//지출화면 jsp 확인
	}
	
	
	@RequestMapping(value="insertExpense", method=RequestMethod.POST)
	@ResponseBody
	public String insertExpense(HttpSession session,Expense expense)	{
		int result = repo.insertExpense(expense);
		if(result == 1) return "success";
		else 			return "fail";
	}
	@RequestMapping(value="selectExpense", method=RequestMethod.POST)
	public List<Expense> selectExpense(HttpSession session,int expense_seq)	{
			
		List<Expense> expenseList = repo.selectExpense(expense_seq);
		return expenseList;
	}
	
	@RequestMapping(value="deleteExpense", method=RequestMethod.POST)
	@ResponseBody
	public String deleteExpense(int expense_seq)	{
		int result = repo.deleteExpense(expense_seq);
		if(result == 1) return "success";
		else 			return "fail";
	}
	@RequestMapping(value="updateExpense", method=RequestMethod.POST)
	@ResponseBody
	public String updateExpense(int expense_seq)	{
		int result = repo.updateExpense(expense_seq);
		if(result == 1) return "success";
		else 			return "fail";
	}
	
}
