package com.scit36a2.minnano.controllers;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.scit36a2.minnano.dao.PosRepo;

// POS기능 - 메인화면에서 일어나는 기능들 
// 영업개시(시재관리), 테이블 조회, 판매전표 조회, 
// 테이블 이동(=판매조회 전표에 저장된 데이터 수정), 영업마감...
// POS 기능 - 주문화면에서 일어나는 기능들
// 테이블 번호와 
// 
@Controller
public class PosController {

	//@Autowired
	//PosRepo repo;
	
	private static final Logger logger = LoggerFactory.getLogger(PosController.class);

	@RequestMapping(value = "/pos", method = RequestMethod.GET)
	public String pos() {
		logger.info("welcome pos.");
		return "pos";
	}
	
/*	@RequestMapping(value="start")
	public String start(HttpSession session)	{
		session.setAttribute("StartTime", StartTime);
		
		String result = repo.start();
		
		return "success";
	}*/
	
	
	
	
	
}
