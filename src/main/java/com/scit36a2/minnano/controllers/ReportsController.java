package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit36a2.minnano.dao.PosRepo;
import com.scit36a2.minnano.vo.Cashonhand;



// 보고서 기능
@Controller
public class ReportsController {
	
	@Autowired
	PosRepo repo;

	private static final Logger logger = LoggerFactory.getLogger(ReportsController.class);
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report() {
		return "report/report";
	}

	//보고서 첫화면 리스트 불러오기(request param, default 값 설정, 기간을 받아 그걸 다시 sql문으로 보내는 동적 쿼리문)
	@RequestMapping(value="reportdefaultList",method=RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String,Object>>reportlist(HttpSession session) {
		
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<HashMap<String,Object>> reportList = repo.selectPaymentList(comp_seq);
		
		return reportList;
	}
	//손님based 통계
	@RequestMapping(value="guestReport",method=RequestMethod.POST)
	public @ResponseBody String guestReport() {
		
		return "guestReport";
	}
	
	//메뉴별 통계
	@RequestMapping(value="menuReport",method=RequestMethod.POST)
	public @ResponseBody String menuReport() {
		
		return "menuReport";
	}
	
	//카드/현금 수금확인
	
	//수지 보고서
}
