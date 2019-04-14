package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.scit36a2.minnano.vo.Cashonhand;
import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;

public interface PosDAO {

	//
	// 여기부터 order 관련

	public ArrayList<HashMap<String, Object>> seatsavailable(int comp_seq);

	public int chksasseqs();

	public int insertSas(Sales_state sas);

	public int insertSad(Sales_detail sad);

	public int deleteoldorder(int sas_seq);

	public ArrayList<Sales_detail> alOrderList(int sas_seq);

	//
	// 여기부터 payment 관리

	public int updatesasdone(int sas_seq);

	public int makepayment(Payment pmt);

	public Integer cumulatepaymenttoday(int comp_seq);

	public ArrayList<Payment> selectpayments(HashMap<String, Object> map);

	//
	// 여기부터 현금시재 cashonhand 관리

	public ArrayList<Cashonhand> predictCash(int comp_seq);

	public Integer predictPmtCash(int comp_seq);

	public List<Cashonhand> selectCashonhand(Cashonhand cashonhand);

	public int insertCashonhand(Cashonhand cashonhand);

	public List<Cashonhand> selectCashOne(Cashonhand cashonhand);

	public int deleteCashonhand(Cashonhand cashonhand);

	//
	// 여기부터 테이블 seats 관리

	public Integer movetable(HashMap<String, Integer> map);

	public Integer swaptable(HashMap<String, Integer> map);

	public Integer mergetable(HashMap<String, Integer> map);

	public Integer deleteSas(Sales_state sas);

}
