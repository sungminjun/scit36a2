package com.scit36a2.minnano.controllers;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit36a2.minnano.dao.ReportRepo;

// 보고서 기능
@Controller
public class ReportsController {

	@Autowired
	ReportRepo repo;
	
	// 보고서 페이지 이동
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report() {
		return "report/report";
	}

	// 종합보고서 이동
	@RequestMapping(value = "/synthesize", method = RequestMethod.GET)
	public String synthesize(HttpSession session) {
//		System.out.println(session.getAttribute("comp_seq"));
		return "report/synthesize";
	}

//	// 보고서 첫화면 리스트 불러오기(request param, default 값 설정, 기간을 받아 그걸 다시 sql문으로 보내는 동적 쿼리문)
//	@RequestMapping(value = "reportdefaultList", method = RequestMethod.POST)
//	public @ResponseBody ArrayList<HashMap<String, Object>> defaultlist(HttpSession session) {
//
//		int comp_seq = (Integer) session.getAttribute("comp_seq");
//		ArrayList<HashMap<String, Object>> reportList = repo.selectPaymentList(comp_seq);
//		System.out.println(reportList);
//		return reportList;
//	}

	/**
	 * 버튼에 대한 분기점이자 + 매출통계처리
	 *
	 * @author kyk, lhj
	 */
	@RequestMapping(value = "search_date", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> search_data(HttpSession session, String startDate, String endDate,
			String unit, String category) {
//		System.out.println(startDate + " " + endDate + " " + unit + " " + category);
		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		// 매출 통계 (daily, weekly, monthly)
		if (category.equals("sales")) {
			if (unit.equals("day")) {// 매일 매출 daily
				ArrayList<Object> search_Day = repo.searchDayPosReport(map);
//				System.out.println("search_day" + search_Day.toString());
				return search_Day;
			} else if (unit.equals("week")) {// 주별 매출 weekly
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
//				System.out.println(result.toString());
				return result;
			} else {// 월별 매출 monthly
				ArrayList<Object> search_Month = repo.selectMonthPosReport(map);
//				System.out.println(search_Month);
				return search_Month;
			}
		} else if (category.equals("customer")) {
			return guestReport(session, startDate, endDate, unit, category);
		} else if (category.equals("menu")) {
			return menuReport(session, startDate, endDate, unit, category);
		} else if (category.equals("card")) {
			return cardCheck(session, startDate, endDate, unit, category);
		} else if (category.equals("income")) {
			return income(session, startDate, endDate, unit, category);
		}
		return null;
	}

	/**
	 * 손님based 통계
	 *
	 * @author kyk, lhj
	 */
	@RequestMapping(value = "guestReport", method = RequestMethod.POST)
	public ArrayList<Object> guestReport(HttpSession session, String startDate, String endDate, String unit,
			String category) {
		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		if (unit.equals("day")) { // 일간, 손님기반통계
			ArrayList<Object> search_DayGuest = new ArrayList<Object>();
			search_DayGuest = repo.selectGuestDay(map);
//			System.out.println("매일고객: " + search_DayGuest.toString());
			return search_DayGuest;
		} else if (unit.equals("week")) { // 주간, 손님기반통계
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
//			System.out.println(result.toString());
			return result;
		} else { // 월간, 손님기반 통계
			ArrayList<Object> search_MonthGuest = repo.selectMonthGuestReport(map);
//			System.out.println(search_MonthGuest);
			return search_MonthGuest;
		}
	}

	/**
	 * 메뉴별 통계
	 *
	 * @author kyk, lhj
	 */
	@RequestMapping(value = "menuReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> menuReport(HttpSession session, String startDate, String endDate,
			String category, String unit) {
		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		ArrayList<Object> search_Menu = repo.selectMenu(map);
//		System.out.println(search_Menu);
		return search_Menu;
	}

	/**
	 * 카드, 현금 수금 통계
	 *
	 * @author kyk, lhj
	 */
	@RequestMapping(value = "cardCheck", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> cardCheck(HttpSession session, String startDate, String endDate,
			String category, String unit) {
		HashMap<String, Object> map = new HashMap<>();

		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		ArrayList<Object> card_Check = repo.selectCardPercent(map);
		System.out.println(card_Check);
		return card_Check;
	}

	/**
	 * 수지 통계
	 *
	 * @author kyk, lhj
	 */
	@RequestMapping(value = "income", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> income(HttpSession session, String startDate, String endDate,
			String category, String unit) {

		HashMap<String, Object> map = new HashMap<>();

		int comp_seq = (Integer) session.getAttribute("comp_seq");

		map.put("comp_seq", comp_seq);
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		ArrayList<HashMap<String, Object>> all_Payment = repo.selectAllPayment(map); // 일주일
		ArrayList<HashMap<String, Object>> all_Expense = repo.selectAllExpense(map); // 일주일 일-월 표시

		System.out.println(all_Expense);
		System.out.println(all_Payment);

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

	/**
	 * 종합보고서-매출 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "totalReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalReport(HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		ArrayList<Object> total_payment = repo.selectTotalReport(map);
//		System.out.println("total_payment" + total_payment.toString());
		return total_payment;
	}

	/**
	 * 종합보고서 메뉴-3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "totalMenuReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalMenuReport(HttpSession session) {

		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		ArrayList<Object> total_Menu_Report = repo.selectTotalMenuReport(map);
 		System.out.println("total_Menu_Report" + total_Menu_Report.toString());
		return total_Menu_Report;
	}

	/**
	 * 종합보고서-손님관련 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "totalGuestReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalGuestReport(HttpSession session) {

		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		ArrayList<Object> total_Guest_expence = repo.selectTotalGuestReport(map);
//		System.out.println("total_Guest_expence" + total_Guest_expence.toString());
		return total_Guest_expence;
	}

	/**
	 * 종합보고서-수지 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "totalIncomeReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalIncome(HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);

		ArrayList<HashMap<String, Object>> month_Payment = repo.selectMonthPayment(map); // 한달
		ArrayList<HashMap<String, Object>> month_Expense = repo.selectMonthExpense(map); // 한달
		System.out.println(month_Expense);
		System.out.println(month_Payment);
		ArrayList<Object> result = new ArrayList<Object>();

		for (int i = 0; i < month_Payment.size(); i++) {
			for (int j = 0; j < month_Expense.size(); j++) {
				if (i == j) {
					HashMap<String, Object> weekHashMap = month_Expense.get(j);
					HashMap<String, Object> dateHashMap = month_Payment.get(i);
					weekHashMap.forEach((k, v) -> dateHashMap.put(k, v));
					result.add(dateHashMap);
				}
			}
		}
		System.out.println(result.toString());

		ArrayList<Object> result2 = new ArrayList<Object>();
		result2.add(result.get(0));
		int three = 0;
		int three2 = 0;
		for (int i = 0; i < 3; i++) {
			Map<String, Object> a = (Map<String, Object>) result.get(i);
			three += ((BigDecimal) (a.get("ALLPAYMENT"))).intValue();
			three2 += ((BigDecimal) (a.get("EXPENSE_AMOUNT"))).intValue();
		}
		HashMap<String, Object> result3 = new HashMap<String, Object>();
		result3.put("ALLPAYMENT", three);
		result3.put("EXPENSE_AMOUNT", three2);
		result2.add(result3);
		for (int i = 0; i < 6; i++) {
			Map<String, Object> a = (Map<String, Object>) result.get(i);
			three += ((BigDecimal) (a.get("ALLPAYMENT"))).intValue();
			three2 += ((BigDecimal) (a.get("EXPENSE_AMOUNT"))).intValue();
		}
		HashMap<String, Object> result4 = new HashMap<String, Object>();
		result4.put("ALLPAYMENT", three);
		result4.put("EXPENSE_AMOUNT", three2);
		result2.add(result4);
		System.out.println(result2);
		return result2;
	}

	/**
	 * 종합보고서-카드 3개월치
	 *
	 * @author kyk
	 */
	@RequestMapping(value = "totalCardReport", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Object> totalCardReport(HttpSession session) {

		HashMap<String, Object> map = new HashMap<>();
		int comp_seq = (Integer) session.getAttribute("comp_seq");
		map.put("comp_seq", comp_seq);
		ArrayList<Object> total_Card_Report = repo.selectTotalCardReport(map);
		System.out.println("total_Card_Report" + total_Card_Report.toString());
		return total_Card_Report;
	}
}