package com.scit36a2.minnano.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Employee;
import com.scit36a2.minnano.vo.Expense;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Seat;



@Repository
public class SalesRepo {
	
	@Autowired
	SqlSession session;
	
	public int insertseat(Employee employee)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.insertseat(employee);
		
		return result;
	}
	public List<Seat> selectseat(Seat seat)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Seat> result = mapper.selectseat(seat);
		return result;
	}
	
	public int deleteseat(String seat_id)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.deleteseat(seat_id);
		
		return result;
	}
	public int updateseat(String seat_id)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateseat(seat_id);
		
		return result;
	}
	
	
	
	
	
	
	

	
	public int insertMenu(Menu menu) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.insertMenu(menu);
		
		return result;
	}
	
	public List<Menu> selectMenu(int menu_seq)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Menu> result = mapper.selectMenu(menu_seq);
		
		return result;
	}
	public int deleteMenu(int menu_seq)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.deleteMenu(menu_seq);
		
		return result;
	}
	public int updateMenu(int menu_seq) {
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateMenu(menu_seq);
		
		return result;
	}
	
	


	public int insertExpense(Expense expense)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.insertExpense(expense);
		
		return result;
	}
	
	public List<Expense> selectExpense(int expense_seq)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		List<Expense> result = mapper.selectExpense(expense_seq);
		
		return result;
	}
	
	
	
	public int deleteExpense(int expense_seq)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.deleteExpense(expense_seq);
		
		return result;
	}
	public int updateExpense(int expense_seq)	{
		SalesDAO mapper = session.getMapper(SalesDAO.class);
		int result = mapper.updateExpense(expense_seq);
		
		return result;
	}

	
}
