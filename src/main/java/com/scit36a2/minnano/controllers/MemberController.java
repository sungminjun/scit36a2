package com.scit36a2.minnano.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 로그인, 회원가입, id/pw찾기, 회원정보 수정, 회원사의 종업원id 등록등..
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("welcome login.");
		return "member/login";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		logger.info("welcome login.");
		return "member/main";
	}

	
}
