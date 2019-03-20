package com.scit36a2.minnano.controllers;

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
	
	
	
	//로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("welcome login.");
		return "member/login";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		
		return "member/join";
	}
	
	//회원가입 처리 요청(가게+employee 테이블에 다중 insert->vo를 이용하지 않고 map에 담아서 다중 파라미터)
	@RequestMapping(value="joinMain",method=RequestMethod.POST)
	public String joinMain(Model model,Employee employee,Company company){
		
		return "member/join";
	}
	
	//사업자 등록번호 중복 체크
	@RequestMapping(value="checkComp_id",method=RequestMethod.POST)
	public @ResponseBody Integer checkComp_id(Employee employee) {
		Employee e=repo.selectOne(employee);
		
		if(e!=null) return 1;
		else return 0;
	}
	
	//로그인
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Employee employee,Model model,HttpSession session) {
		Employee e=repo.selectOne(employee);
		
		String message="";
		int comp_seq=employee.getComp_seq();
		String loginId=employee.getEmp_id();
		String loginPw=employee.getEmp_pw();
		
		if(e!=null) {
				if(loginPw.equals(e.getEmp_pw())) {
					
				session.setAttribute("loginId",loginId);
				session.setAttribute("comp_seq",comp_seq);
				
				return "redirect:/";
				}
			}else {
				message="로그인에 실패하셨습니다";
						
		}
		model.addAttribute("message",message);
		return "member/login";
	}
	
	//로그아웃 처리
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}

	//회원정보 수정
	
	//아이디/패스워드찾기
	
	//멤버 추가 요청(employee)
	
	//메인 화면으로 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		logger.info("welcome login.");
		return "main";
	}

	
}
