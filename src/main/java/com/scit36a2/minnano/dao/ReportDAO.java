package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ReportDAO {

//	public ArrayList<HashMap<String, Object>> selectPaymentList(int comp_seq);

	// 매출관련 통계
	public ArrayList<Object> searchDayPosReport(HashMap<String, Object> map);
	public ArrayList<HashMap<String, Object>> selectWeekPosReport(HashMap<String, Object> map);
	public ArrayList<HashMap<String, Object>> selectWeekDay(HashMap<String, Object> map);
	public ArrayList<Object> selectMonthPosReport(HashMap<String, Object> map);

	// 손님기반 통계
	public ArrayList<Object> selectCustomerDay(HashMap<String, Object> map);
	public ArrayList<HashMap<String, Object>> selectCustomerWeekReport(HashMap<String, Object> map);
	public ArrayList<HashMap<String, Object>> selectGuestWeekDay(HashMap<String, Object> map);
	public ArrayList<Object> selectMonthGuestReport(HashMap<String, Object> map);

	// 메뉴기반 통계
	public ArrayList<Object> selectMenu(HashMap<String, Object> map);

	// 현금/카드 매출비율
	public ArrayList<Object> selectCardPercent(HashMap<String, Object> map);

	// 수지보고
	public ArrayList<HashMap<String, Object>> selectAllPayment(HashMap<String, Object> map);
	public ArrayList<HashMap<String, Object>> selectAllExpense(HashMap<String, Object> map);

}
