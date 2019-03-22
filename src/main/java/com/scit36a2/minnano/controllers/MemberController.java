package com.scit36a2.minnano.controllers;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
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

import com.scit36a2.minnano.dao.MemberRepo;
import com.scit36a2.minnano.vo.Company;
import com.scit36a2.minnano.vo.Employee;

// 로그인, 회원가입, id/pw찾기, 회원정보 수정, 회원사의 종업원id 등록등..
@Controller
public class MemberController {

	@Autowired
	MemberRepo repo;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login_k", method = RequestMethod.GET)
	public String login() {
		logger.info("welcome login.");
		return "member/login_k";
	}

	// 회원가입 페이지로 이동
	@RequestMapping(value = "/join_k", method = RequestMethod.GET)
	public String join() {

		return "member/join_k";
	}

	// 회원가입 처리 요청(가게+employee 테이블에 다중 insert->vo를 이용하지 않고 map에 담아서 다중 파라미터)
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String joinMain(Model model,Employee employee,Company company){
		HashMap<String, Object> map = new HashMap<>();
		
		
//		Class c = Employee.class;
//		Method[] m = c.getMethods();
//		for(int i=0; i<m.length; i++) {
//		    if("get".equals(m[i].getName().substring(0,3))) {
//		        String str = "none";
//				try {
//					str = String.valueOf(m[i].invoke(employee));
//				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
//					e.printStackTrace();
//				}
//		        System.out.println(str);
//		    }
//		}
//		
		
		int seq = 0;
		seq = repo.reqCompSeq();
		if (seq != 0) {
			map.put("comp_seqs",seq);
		}
		map.put("comp_id",company.getComp_id());
		map.put("comp_name",company.getComp_name());
		map.put("comp_tel",company.getComp_tel());
		map.put("comp_address",company.getComp_address());
		map.put("comp_address2",company.getComp_address2());
		
		map.put("emp_seq", employee.getEmp_seq());
		map.put("emp_id", employee.getEmp_id());
		map.put("emp_pw", employee.getEmp_pw());
		employee.setEmp_auth_level(9); // client가 회원권한 level을 조작할수가 있어서, 가입시 client단에서는 들어오지 않고, 여기에서 권한9를 준다.
		map.put("emp_auth_level", employee.getEmp_auth_level());
		map.put("emp_name", employee.getEmp_name());
		map.put("emp_tel", employee.getEmp_tel());
		map.put("emp_quiz", employee.getEmp_quiz());
		map.put("emp_quiz_answer", employee.getEmp_quiz_answer());
		
		int result = repo.join(map);
		if (result == 2) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		return "member/login_k";
	}
	//사업자 
	// 사업자 등록번호 중복 체크
	@RequestMapping(value = "/checkComp_id", method = RequestMethod.POST)
	public @ResponseBody String checkComp_id(Company company) {
		
		
		String id = company.getComp_id();
		
		if(id.length() < 3 || id.length() >10) {
			return "lengthFail";
		}
		
		Company c =  repo.selectCompanyOne(company);
		
		if (c != null)
			return "fail";
		else
			return "success";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Employee employee, Model model, HttpSession session) {
		Employee e = repo.selectOne(employee);
		System.out.println(e);
		String message = "";
		int comp_seq = e.getComp_seq();
		String emp_id = employee.getEmp_id();
		String emp_pw = employee.getEmp_pw();

		if (e != null) {
			if (emp_id.equals(e.getEmp_id())&&emp_pw.equals(e.getEmp_pw())) {

				session.setAttribute("emp_id", emp_id);
				session.setAttribute("comp_seq", comp_seq);

				return "redirect:/kyk";
			} else {
				message = "로그인에 실패하셨습니다.";
			}
		} else {
			message = "로그인에 실패하셨습니다";
			
		}
		model.addAttribute("message", message);
		return "member/login_k";
	}

	// 로그아웃 처리
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}

	// employee관리 화면으로 이동
	@RequestMapping(value = "/registMember", method = RequestMethod.GET)
	public String registMember() {

		return "mgr/member";
	}

	// 사장 회원정보 수정 요청
	@RequestMapping(value = "selectOwner", method = RequestMethod.POST)
	public @ResponseBody Employee selectOwner(Employee employee, HttpSession session) {

		Employee ownerList = repo.selectOne(employee);

		return ownerList;
	}

	// 사장 회원정보 수정 처리
	@RequestMapping(value = "updateOwner", method = RequestMethod.POST)
	public @ResponseBody String updateOwner(Employee employee, HttpSession session) {

		String ownerId = (String) session.getAttribute("ownerId");
		employee.setEmp_id(ownerId);
		int result = repo.updateOwner(employee);

		if (result == 1)
			return "success";
		else
			return "fail";
	}

	// 가게 정보 수정 요청
	@RequestMapping(value = "selectCompanyOne", method = RequestMethod.POST)
	public @ResponseBody String selectCompanyOne(HttpSession session) {

		return null;
	}

	// 가게 정보 수정 처리
	@RequestMapping(value = "updateCompany", method = RequestMethod.POST)
	public @ResponseBody String updateCompany(Company company, HttpSession session) {

		return "success";
	}

	// 등록된 employee 조회 요청
	@RequestMapping(value = "selectEmployeeList", method = RequestMethod.POST)
	public @ResponseBody List<Employee> employeeList(Model model) {
		List<Employee> employeeList = repo.employeeList();

		return employeeList;
	}

	// 멤버 추가 요청(employee)

	// 직원 회원정보 수정 처리
	@RequestMapping(value = "updateEmployee", method = RequestMethod.POST)
	public @ResponseBody String updateEmployee(Employee employee, HttpSession session) {

		return "success";
	}

	// 아이디/패스워드 찾기 화면
	@RequestMapping(value = "findLogin", method = RequestMethod.GET)
	public String findLogin() {
		return "member/find";
	}

	// 아이디/패스워드찾기
	@RequestMapping(value = "findLogin", method = RequestMethod.POST)
	public String find() {

		return "";
	}

	// 메인 화면으로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		logger.info("welcome login.");
		return "main";
	}

}
