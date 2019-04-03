package com.scit36a2.minnano.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	/**
	 * 로그인 페이지이동
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("welcome login.");
		return "member/login";
	}

	/**
	 * 로그인 기능의 처리
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Employee employee, Model model, HttpSession session) {
		Employee e = repo.selectOne(employee);

		String message = "";
		int comp_seq = e.getComp_seq();
		String emp_id = employee.getEmp_id();
		String emp_pw = employee.getEmp_pw();

		if (e != null) {
			if (emp_id.equals(e.getEmp_id()) && emp_pw.equals(e.getEmp_pw())) {

				session.setAttribute("emp_id", emp_id);
				session.setAttribute("comp_seq", comp_seq);

				return "redirect:/";
			} else {
				message = "로그인에 실패하셨습니다.";
			}
		}
		model.addAttribute("message", message);
		return "redirect:/";
	}

	/**
	 * 회원가입 페이지이동
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

	/**
	 * 회원가입 기능의 처리 (가게+employee 테이블에 다중 insert->vo를 이용하지 않고 map에 담아서 다중 파라미터)
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, Employee employee, Company company) {
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
			map.put("comp_seqs", seq);
		}
		map.put("comp_id", company.getComp_id());
		map.put("comp_name", company.getComp_name());
		map.put("comp_tel", company.getComp_tel());
		map.put("comp_address", company.getComp_address());
		map.put("comp_address2", company.getComp_address2());

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
			logger.info("회원가입 성공");
		} else {
			logger.info("회원가입 실패");
		}

		return "redirect:/";
	}

	//
	// not checked yet below

	/**
	 * 회원가입 페이지 기능 -사업자 등록번호 중복 체크
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "/checkComp_id", method = RequestMethod.POST)
	public @ResponseBody String checkComp_id(Company company) {

		String id = company.getComp_id();

		if (id.length() < 3 || id.length() > 10) {
			return "lengthFail";
		}

		Company c = repo.selectCompanyOneById(company);

		if (c != null)
			return "fail";
		else
			return "success";
	}

	// not checked yet above
	//

	/**
	 * id/pw찾기 페이지이동
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find() {
		return "member/find";
	}

	/**
	 * id찾기 기능
	 * 
	 * @author 전성민
	 */
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(int comp_id, String emp_name, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comp_id", comp_id);
		map.put("emp_name", emp_name);
		logger.info("map: " + map);
		Employee result = repo.findId(map);
		if (result != null) {
			logger.info(result.toString());
			model.addAttribute("findResult", result.getEmp_id());
		} else {
			model.addAttribute("findResult", "조건에 맞는 결과가 없습니다.");
		}
		return "member/find";
	}

	/**
	 * 로그아웃 기능의 처리
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// login, join, and find password
	// functions for not-logged-in users access above.
	//
	//////
	//////
	//
	// get/set infos for logged-in users access below.
	//

	/**
	 * mgr의 가게정보 조회(수정요청을 위한 데이터)
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "selectCompanyOne", method = RequestMethod.POST)
	public @ResponseBody Company selectCompanyOne(HttpSession session) {
		// 수정사항) session comp_seq를 끌어옴, 변수명 변경, param Company 제거
		// param 변경으로 인한 repo, DAO 수정
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		Company comp = repo.selectCompanyOne(comp_seq);
		return comp;
	}

	/**
	 * mgr의 가게정보 수정 처리
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "updateCompany", method = RequestMethod.POST)
	public String updateCompany(Company company, HttpSession session) {
		// 수정사항) session comp_seq사용
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		Company chkComp = repo.selectCompanyOne(comp_seq);
		System.out.println("company: " + company);
		System.out.println("chkComp: " + chkComp);

		// session의 comp_seq로 selectCompanyOne해서 사업자등록번호를 점검한다.
		int result = 0;
		if (chkComp != null) {
			if (!(company.getComp_id().equals(chkComp.getComp_id()))) {
				logger.info("회사정보 업데이트 에러");
			} else {
				company.setComp_seq(comp_seq);
				result = repo.updateCompany(company);
			}
		}

		// 추후 ajax에 맞게 조정하거나, 다른 방법 검토할 것..
		if (result == 1)
			return "redirect:/mgr";
		else
			return "redirect:/mgr";
	}

	/**
	 * mgr의 사장 회원정보 조회(수정요청을 위한 데이터)
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "selectOwner", method = RequestMethod.POST)
	public @ResponseBody Employee selectOwner(HttpSession session) {
		// 수정사항) session emp_id 가져옴, 변수명 변경, param Employee 제거
		Employee emp = new Employee();
		String emp_id = (String) session.getAttribute("emp_id");
		emp.setEmp_id(emp_id);
		Employee owner = repo.selectOne(emp);

		return owner;
	}

	/**
	 * mgr의 사장 회원정보 수정처리
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "updateOwner", method = RequestMethod.POST)
	public String updateOwner(Employee employee, String emp_new_pw, HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		String emp_id = (String) session.getAttribute("emp_id");

		// 세션의 emp_id와 보내온 객체 emplyoee가 같은 아이디인지 검증하고,
		// 입력받은 비밀번호가 같을때만 변경처리를 허가해야한다.
		Employee emp = new Employee();
		emp.setEmp_id(emp_id);
		Employee chkEmp = repo.selectOne(emp);
		int result = 0;
		if (chkEmp != null && chkEmp.getEmp_id().equals(emp_id) && employee.getEmp_pw().equals(chkEmp.getEmp_pw())) {
			// 만약 새로운 비밀번호를 입력받았다면, 비밀번호를 새로 설정한다.
			if (emp_new_pw != null && !emp_new_pw.equals("")) {
				employee.setEmp_pw(emp_new_pw);
			}
			employee.setComp_seq(comp_seq);
			result = repo.updateMember(employee);
		}
		logger.info("updateOnwer result: " + result);

		// 추후 ajax에 맞게 조정하거나, 다른 방법 검토할 것..
		if (result == 1)
			return "redirect:/mgr";
		else
			return "redirect:/mgr";
	}

	/**
	 * mgr의 직원정보 조회 요청
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "selectEmployeeList", method = RequestMethod.POST)
	public @ResponseBody List<Employee> employeeList(HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		List<Employee> employeeList = repo.employeeList(comp_seq);

		return employeeList;
	}

	/**
	 * mgr의 직원정보 수정을 위한 특정 직원정보 조회 요청
	 * 
	 * @author 전성민
	 */
	@RequestMapping(value = "selectEmployee", method = RequestMethod.POST)
	public @ResponseBody Employee selectEmployee(HttpSession session, Employee emp) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		emp.setComp_seq(comp_seq);
		emp = repo.selectEmployee(emp);

		return emp;
	}

	/**
	 * mgr의 직원정보 등록요청 처리
	 *	// 예시 ui단에 비밀번호 찾는 질문 입력란이 없는데....어떻게 하실것인지!
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "registMember", method = RequestMethod.POST)
	public String registMember(Employee employee, HttpSession session) {
		// employee.setEmp_auth_level(1); mapper에서 처리할까..
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		System.out.println("emp: " + employee);
		employee.setComp_seq(comp_seq);
		// 직원은 사장권한으로 로그인하면 그냥 다 보이게 할게요
		employee.setEmp_quiz("no_quiz");
		employee.setEmp_quiz_answer("no_quiz");
		int result = repo.joinMember(employee);

		// 추후 ajax에 맞게 조정하거나, 다른 방법 검토할 것..
		if (result == 1)	return "redirect:/mgr";
		else				return "redirect:/mgr";
	}
	
	/**
	 * mgr의 직원정보 수정요청 처리
	 * 
	 * @author 김유경
	 */
	@RequestMapping(value = "updateEmployee", method = RequestMethod.POST)
	public String updateEmployee(Employee employee, HttpSession session) {
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		employee.setComp_seq(comp_seq);
		int result = repo.updateMember(employee);
		
		// 추후 ajax에 맞게 조정하거나, 다른 방법 검토할 것..
		if (result == 1)	return "redirect:/mgr";
		else				return "redirect:/mgr";
	}


	//
	//
	//
	// will be removed below

	// 삭제예정 -- 해당 페이지 기능 mgr페이지로 통합됨
	@RequestMapping(value = "/registMember", method = RequestMethod.GET)
	public String registMember() {
		return "mgr/member";
	}

	// 삭제예정 -- find로 신설
	// 아이디/패스워드찾기
	@RequestMapping(value = "findLogin", method = RequestMethod.POST)
	public String find(Employee emp, Company com) {

		return "";
	}

	// 삭제예정 -- main 화면 삭제 검토중
	// 메인 화면으로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		logger.info("welcome login.");
		return "main";
	}

}
