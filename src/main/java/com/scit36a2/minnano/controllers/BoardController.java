package com.scit36a2.minnano.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 커뮤니티 기능
@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board() {
		logger.info("welcome board.");
		return "board/board";
	}

}
