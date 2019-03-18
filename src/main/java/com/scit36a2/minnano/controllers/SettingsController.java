package com.scit36a2.minnano.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 관리페이지 기능 중 회원관련 기능을 제외한, 테이블 등록/관리, 메뉴 등록/관리, 지출 등록/관리
@Controller
public class SettingsController {

	private static final Logger logger = LoggerFactory.getLogger(SettingsController.class);

	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settings() {
		logger.info("welcome settings.");
		return "settings";
	}

}
