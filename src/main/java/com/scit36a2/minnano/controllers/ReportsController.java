package com.scit36a2.minnano.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
	public @ResponseBody ArrayList<HashMap<String,Object>>defaultlist(HttpSession session) {
		
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<HashMap<String,Object>> reportList = repo.selectPaymentList(comp_seq);
		System.out.println(reportList);
		return reportList;
	}
	//날짜로 검색한 매출 통계 리스트 불러오기
	@RequestMapping(value="search_date",method=RequestMethod.POST)
	public @ResponseBody ArrayList<HashMap<String,Object>>search_data(HttpSession session,String startDate,String endDate){
		//String[] weekDay = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };  
		//스타드 year 랑 앤드 year 비교
		
		String dayYY = startDate.substring(0,4);
		Calendar cal=Calendar.getInstance();

		int year = Integer.parseInt(dayYY);

		
		HashMap<String, Object> map = new HashMap<>();
		cal.set(Calendar.YEAR, Integer.parseInt(startDate.substring(0, 4)));
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		
		
		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate",endDate);
		
		ArrayList<HashMap<String,Object>>search_date=repo.selectPosReport(map);
		
		System.out.println(search_date.toString());
		
		/*for (HashMap<String, Object> hashMap : search_date) {
			
			
			int DAYTIME = Integer.parseInt((String) hashMap.get("DAYTIME"));
			cal.set(Calendar.YEAR,year);
			cal.set(Calendar.WEEK_OF_YEAR,DAYTIME);
			
			int daynum=cal.get(Calendar.DAY_OF_WEEK);
			
			String monday = weekDay[daynum-1];
			System.out.println(daynum);
			System.out.println(monday);
			//int day2 = cal.get(cal.DATE)-1;
			
			//System.out.println(today);
			//System.out.println(day2);
			
			
			//hashMap.put("day", day2);
			//hashMap.put("weekDay", today);
		}
		
		/*System.out.println(search_date.toString());*/
		
		return search_date;
		
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
