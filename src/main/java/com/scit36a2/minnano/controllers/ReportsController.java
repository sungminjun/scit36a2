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

	//보고서 첫화면 리스트 불러오기(request param, default 값 설정)
	
	//손님based 통계
	
	//메뉴별 통계
	
	//카드/현금 수금확인
	
	//수지 보고서
}
