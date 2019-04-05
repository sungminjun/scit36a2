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

	// 이영창
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart() {
		return "report/chart";
	}

	// 이영창
	@RequestMapping(value = "/posMain", method = RequestMethod.GET)
	public String posMain() {
		return "pos/posMain";
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

	// 게시판 테스트 페이지로 이동
	@RequestMapping(value = "board_k", method = RequestMethod.GET)
	public String board_kyk() {

		return "board/board_k";
	}

	// 최철규
	// 메뉴화면이동
	@RequestMapping(value = "choitestmenu", method = RequestMethod.GET)
	public String choitestmenu() {
		return "backside/choitestmenu";
	}

	@RequestMapping(value = "/choipos", method = RequestMethod.GET)
	public String choipos() {
		return "backside/choiTestPOS";
	}

	@RequestMapping(value = "choiTest", method = RequestMethod.GET)
	public String insertseat(HttpSession session) {
		System.out.println((Integer) session.getAttribute("comp_seq"));
		return "backside/choiTest";
	}

	@RequestMapping(value = "choitestexpense", method = RequestMethod.GET)
	public String insertExpense() {
		return "backside/choitestexpense";
	}

	// POS기능 기본화면1 이동
	@RequestMapping(value = "/choiTestPOS1", method = RequestMethod.GET)
	public String pos() {
		return "backside/choiTestPOS1";
	}

	// POS기능 기본화면2 이동
	@RequestMapping(value = "choiTestPOS2", method = RequestMethod.GET)
	public String pos2() {
		return "backside/choiTestPOS2";
	}

	@RequestMapping(value = "choitestpayment", method = RequestMethod.GET)
	public String inPayment() {
		return "choitestpayment";
	}

	@RequestMapping(value = "/report_k", method = RequestMethod.GET)
	public String report_k() {
		return "report/report_k";
	}
}
