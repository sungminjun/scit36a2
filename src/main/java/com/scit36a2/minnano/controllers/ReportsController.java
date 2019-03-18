package com.scit36a2.minnano.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 보고서 기능
@Controller
public class ReportsController {

	private static final Logger logger = LoggerFactory.getLogger(ReportsController.class);

	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public String reports() {
		logger.info("welcome reports.");
		return "reports";
	}

}
