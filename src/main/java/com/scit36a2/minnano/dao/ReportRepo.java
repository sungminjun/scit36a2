
package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportRepo {
	@Autowired
	SqlSession session;

//	public ArrayList<HashMap<String, Object>> selectPaymentList(int comp_seq) {
//		ReportDAO dao = session.getMapper(ReportDAO.class);
//		ArrayList<HashMap<String, Object>> list = dao.selectPaymentList(comp_seq);
//		return list;
//	}

	// sales(payment) - daily 일간매출
	public ArrayList<Object> searchDayPosReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.searchDayPosReport(map);
		return list;
	}

	// sales(payment) - weekly 주간매출
	public ArrayList<HashMap<String, Object>> selectWeekPosReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectWeekPosReport(map);
		return list;
	}

	// sales(payment) - index for weekly 주간매출용 인덱스
	public ArrayList<HashMap<String, Object>> selectWeekDay(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectWeekDay(map);
		return list;
	}

	// sales(payment) - monthly 월간매출
	public ArrayList<Object> selectMonthPosReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectMonthPosReport(map);
		return list;
	}

	// sales(payment) by
	public ArrayList<Object> selectGuestDay(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectCustomerDay(map);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectWeekGuestReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectCustomerWeekReport(map);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectGuestWeekDay(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectGuestWeekDay(map);
		return list;
	}

	public ArrayList<Object> selectMonthGuestReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectMonthGuestReport(map);
		return list;
	}

	public ArrayList<Object> selectMenu(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectMenu(map);
		return list;
	}

	public ArrayList<Object> selectCardPercent(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectCardPercent(map);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectAllPayment(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectAllPayment(map);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectAllExpense(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectAllExpense(map);
		return list;
	}

	public ArrayList<Object> selectTotalReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectTotalReport(map);
		return list;
	}

	public ArrayList<Object> selectTotalMenuReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectTotalMenuReport(map);
		return list;
	}

	public ArrayList<Object> selectTotalGuestReport(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<Object> list = dao.selectTotalGuestReport(map);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectMonthPayment(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectMonthPayment(map);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectMonthExpense(HashMap<String, Object> map) {
		ReportDAO dao = session.getMapper(ReportDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectMonthExpense(map);
		return list;
	}

}