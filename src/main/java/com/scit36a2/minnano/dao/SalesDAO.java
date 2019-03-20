package com.scit36a2.minnano.dao;

import java.util.List;

import com.scit36a2.minnano.vo.Employee;
import com.scit36a2.minnano.vo.Expense;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Seat;

public interface SalesDAO {
	public int insertseat(Employee employee);
	public List<Seat> selectseat(Seat seat);
	public int deleteseat(String seat_id);
	public int updateseat(String seat_id);
	
	public int insertMenu(Menu menu);//메뉴등록
	public List<Menu> selectMenu(int menu_seq);//메뉴조회
	public int deleteMenu(int menu_seq);//메뉴삭제
	public int updateMenu(int menu_seq);//메뉴수정
	

	public int insertExpense(Expense expense);//지출유형입력에 따른 지출내역등록
	public List<Expense> selectExpense(int expense_seq);
	public int deleteExpense(int expense_seq);
	public int updateExpense(int expense_seq);

}
