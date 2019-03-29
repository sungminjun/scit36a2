package com.scit36a2.minnano.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestPageController {

	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public String basic() {
		return "frontside/basic";
	}

	@RequestMapping(value = "/explist", method = RequestMethod.GET)
	public @ResponseBody String explist() {
		return "explist by ajax from controller";
	}

	// 김유경
	@RequestMapping(value = "/kyk", method = RequestMethod.GET)
	public String kykhome() {
		return "backside/kyk";
	}

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login_k", method = RequestMethod.GET)
	public String login_kyk() {
		return "member/login_k";
	}

	// 회원가입 페이지로 이동
	@RequestMapping(value = "/join_k", method = RequestMethod.GET)
	public String join_kyk() {
		return "member/join_k";
	}
	
	//게시판 테스트 페이지로 이동
	@RequestMapping(value="board_k",method=RequestMethod.GET)
	public String board_kyk() {
		
		return "board/board_k";
	}

	// 최철규
	// 메뉴화면이동
	@RequestMapping(value = "choitestmenu", method = RequestMethod.GET)
	public String choitestmenu() {
		return "backside/choitestmenu";
	}

	@RequestMapping(value = "choiTest", method = RequestMethod.GET)
	public String insertseat(HttpSession session) {
		System.out.println((Integer) session.getAttribute("comp_seq"));
		return "backside/choiTest";
	}

}
