package com.scit36a2.minnano.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.scit36a2.minnano.util.CVTExcelReader;
import com.scit36a2.minnano.util.FileService;
import com.scit36a2.minnano.vo.CardVeriTool;

// 홈으로 이동
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("welcome home.");
		return "main";
	}
	
}
