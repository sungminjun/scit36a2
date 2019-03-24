package com.scit36a2.minnano.dao;

import java.util.List;

import com.scit36a2.minnano.vo.Expense;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Seat;

public interface SalesDAO {
	public int insertseat(Seat seat);
	public List<Seat> selectseat(int comp_seq);
	public int deleteseat(Seat seat);
	public int updateseat(Seat seat);
	
	public int insertMenu(Menu menu);//메뉴등록
	public List<Menu> selectMenu(int comp_seq);//메뉴조회
	public int deleteMenu(Menu menu);//메뉴삭제
	public int updateMenu(Menu menu);//메뉴수정
	

	public int insertExpense(Expense expense);//지출유형입력에 따른 지출내역등록
	public List<Expense> selectExpense(int expense_seq);
	public int deleteExpense(int expense_seq);
	public int updateExpense(int expense_seq);

}
