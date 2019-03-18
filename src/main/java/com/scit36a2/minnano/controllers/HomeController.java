package com.scit36a2.minnano.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// �솃�쑝濡� �씠�룞
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("welcome home.");
		return "devhome";
	}

	@RequestMapping(value = "/jsm", method = RequestMethod.GET)
	public String jsm() {
		return "jsm";
	}

	
	@RequestMapping(value = "/leehojung", method = RequestMethod.GET)
	public String leehojung() {
		System.out.println("test");
		return "leehojung";
	}
}
