package com.scit36a2.minnano.controllers;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

	// 보고서 첫화면 리스트 불러오기(request param, default 값 설정, 기간을 받아 그걸 다시 sql문으로 보내는 동적 쿼리문)
	@RequestMapping(value = "reportdefaultList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, Object>> defaultlist(HttpSession session) {

		int comp_seq = (Integer) session.getAttribute("comp_seq");
		ArrayList<HashMap<String, Object>> reportList = repo.selectPaymentList(comp_seq);
		System.out.println(reportList);
		return reportList;
	}

	// 날짜로 검색한 매출 통계 리스트 불러오기
	@RequestMapping(value = "search_date", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> search_data(HttpSession session, String startDate, String endDate,
			String unit, String category) {

		System.out.println(startDate + " " + endDate + " " + unit + " " + category);
		HashMap<String, Object> map = new HashMap<>();

		int comp_seq = (Integer) session.getAttribute("comp_seq");

		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		if(category.equals("sales")) {
		if (unit.equals("day")) {
			ArrayList<Object> search_Day = repo.searchDayPosReport(map); // 매일 매출
			System.out.println("search_day" + search_Day.toString());
			return search_Day;

		} else if (unit.equals("week")) {// 주별 매출
			ArrayList<HashMap<String, Object>> search_date = repo.selectWeekPosReport(map); // 일주일
			ArrayList<HashMap<String, Object>> search_week = repo.selectWeekDay(map); // 일주일 일-월 표시

			ArrayList<Object> result = new ArrayList<Object>();

			for (int i = 0; i < search_date.size(); i++) {
				for (int j = 0; j < search_week.size(); j++) {
					if (i == j) {
						HashMap<String, Object> weekHashMap = search_week.get(j);
						HashMap<String, Object> dateHashMap = search_date.get(i);

						weekHashMap.forEach((k, v) -> dateHashMap.put(k, v));

						result.add(dateHashMap);

					}
				}
			}

			System.out.println(result.toString());

			return result;

		} else {// 달 별 매출
			ArrayList<Object> search_Month = repo.selectMonthPosReport(map);
			System.out.println(search_Month);
			return search_Month;

		}}else if(category.equals("customer")){
			guestReport(session,startDate,endDate,unit,category);
			
		}else if(category.equals("menu")) {
			menuReport(session, startDate,endDate,unit,category);
		}else if(category.equals("card")) {
			cardCheck(session, startDate,endDate,unit,category);
			
		}else if(category.equals("income")) {
			income(session,startDate,endDate,unit,category);
			
		}
		return null;
	}

	// 손님based 통계
	@RequestMapping(value = "guestReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> guestReport(HttpSession session,String startDate,String endDate,String unit,String category) {
		
		HashMap<String, Object> map = new HashMap<>();

		int comp_seq = (Integer) session.getAttribute("comp_seq");

		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		
		if(unit.equals("day")) {
			ArrayList<Object> search_DayGuest = new ArrayList<Object>();
			search_DayGuest = repo.selectGuestDay(map);
			System.out.println("매일고객: "+search_DayGuest.toString());
			return search_DayGuest;
			
		}else if(unit.equals("week")){
			ArrayList<HashMap<String, Object>> search_week = repo.selectWeekGuestReport(map); // 일주일
			ArrayList<HashMap<String, Object>> search_weekDay = repo.selectGuestWeekDay(map); // 일주일 일-월 표시

			ArrayList<Object> result = new ArrayList<Object>();

			for (int i = 0; i < search_week.size(); i++) {
				for (int j = 0; j < search_weekDay.size(); j++) {
					if (i == j) {
						HashMap<String, Object> weekHashMap = search_weekDay.get(j);
						HashMap<String, Object> dateHashMap = search_week.get(i);

						weekHashMap.forEach((k, v) -> dateHashMap.put(k, v));
				
						
						result.add(dateHashMap);
					}
				}
			}
			System.out.println(result.toString());

			return result;

		}else {
			ArrayList<Object> search_MonthGuest = repo.selectMonthGuestReport(map);
			System.out.println(search_MonthGuest);
			return search_MonthGuest;
		}
		
	}

	// 메뉴별 통계
	@RequestMapping(value = "menuReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> menuReport(HttpSession session,String startDate,String endDate,String category,String unit) {
		
		
		HashMap<String, Object> map = new HashMap<>();

		int comp_seq = (Integer) session.getAttribute("comp_seq");

		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		ArrayList<Object> search_Menu = repo.selectMenu(map);
		System.out.println(search_Menu);
		
		return search_Menu;
	}

	// 카드/현금 수금확인
	@RequestMapping(value="cardCheck",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Object> cardCheck(HttpSession session,String startDate,String endDate,String category,String unit) {
		HashMap<String, Object> map = new HashMap<>();

		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		ArrayList<Object> card_Check = repo.selectCardPercent(map);
		System.out.println(card_Check);
		
		return card_Check;
		
	}

	// 수지 보고서
	@RequestMapping(value="income",method=RequestMethod.POST)
	public @ResponseBody ArrayList<Object> income (HttpSession session,String startDate,String endDate,String category,String unit){
		
		HashMap<String, Object> map = new HashMap<>();

		int comp_seq = (Integer) session.getAttribute("comp_seq");

		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		ArrayList<HashMap<String, Object>> all_Payment = repo.selectAllPayment(map); // 일주일
		ArrayList<HashMap<String, Object>> all_Expense = repo.selectAllExpense(map); // 일주일 일-월 표시

		ArrayList<Object> result = new ArrayList<Object>();

		for (int i = 0; i < all_Payment.size(); i++) {
			for (int j = 0; j < all_Expense.size(); j++) {
				if (i == j) {
					HashMap<String, Object> weekHashMap = all_Expense.get(j);
					HashMap<String, Object> dateHashMap = all_Payment.get(i);

					weekHashMap.forEach((k, v) -> dateHashMap.put(k, v));
			
					
					result.add(dateHashMap);
				}
			}
		}
		System.out.println(result.toString());

		return result;
		
	}
}


