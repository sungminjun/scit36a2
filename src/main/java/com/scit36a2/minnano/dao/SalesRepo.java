package com.scit36a2.minnano.dao;

import java.util.HashMap;
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
		int result = 0;
		try {
			SalesDAO mapper = session.getMapper(SalesDAO.class);
			result = mapper.deleteseat(seat);
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("err on deleteseat");
		}
		return result;
	}

	public int stopseat(Seat seat) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.stopseat(seat);
		return result;
	}

	public int updateseat(Seat seat) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateseat(seat);

		return result;
	}

	public int insertMenu(Menu menu) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.insertMenu(menu);

		return result;
	}

	public List<Menu> selectMenu(Menu menu) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Menu> result = mapper.selectMenu(menu);

		return result;
	}

	public int deleteMenu(Menu menu) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.deleteMenu(menu);

		return result;
	}

	public int updateMenu(Menu menu) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateMenu(menu);

		return result;
	}

	public int insertExpense(Expense expense) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.insertExpense(expense);

		return result;
	}

	public List<Expense> selectExpense(HashMap<String, Object> map) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Expense> result = mapper.selectExpense(map);

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

	public List<HashMap<String, Object>> selectCVTdata(HashMap<String, Object> map) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<HashMap<String, Object>> result = mapper.selectCVTdata(map);

		return result;
	}

}
