package com.scit36a2.minnano.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Expense;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Seat;

@Repository
public class SalesRepo {

	@Autowired
	SqlSession session;

	public int insertseat(Seat seat) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.insertseat(seat);
		return result;
	}

	public List<Seat> selectseat(int comp_seq) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Seat> result = mapper.selectseat(comp_seq);
		return result;
	}

	public int deleteseat(Seat seat) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.deleteseat(seat);

		return result;
	}

	public int updateseat(Seat seat) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateseat(seat);

		return result;
	}

	public int insertMenu(Menu menu) {
		int result =0;
		try {
			SalesDAO mapper = session.getMapper(SalesDAO.class);
			result= mapper.insertMenu(menu);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public List<Menu> selectMenu(int comp_seq) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Menu> result = mapper.selectMenu(comp_seq);

		return result;
	}

	public int deleteMenu(Menu menu) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.deleteMenu(menu);

		return result;
	}

	public int updateMenu(int menu_seq) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateMenu(menu_seq);

		return result;
	}

	public int insertExpense(Expense expense) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.insertExpense(expense);

		return result;
	}

	public List<Expense> selectExpense(int comp_seq) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Expense> result = mapper.selectExpense(comp_seq);

		return result;
	}

	public int deleteExpense(Expense expense) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.deleteExpense(expense);

		return result;
	}

	public int updateExpense(Expense expense) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateExpense(expense);

		return result;
	}

}
