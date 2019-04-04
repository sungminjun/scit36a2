package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.scit36a2.minnano.vo.Cashonhand;
import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;

public interface PosDAO {

	public int insertSasSad(HashMap<String, Object> map);

	public int insertPayment(Payment payment);

	public int deleteSasSadPay(int comp_seq);

	public ArrayList<HashMap<String, Object>> selectPOSone(int comp_seq);

	public ArrayList<HashMap<String, Object>> selectPOStwo(int comp_seq);

	public int updatePOStwo(Sales_state sales_state);

	public ArrayList<HashMap<String, Object>> seatsavailable(int comp_seq);

	public int chksasseqs();

	public int insertSas(Sales_state sas);

	public int insertSad(Sales_detail sad);

	public ArrayList<Sales_detail> alOrderList(int sas_seq);

	public int deleteoldorder(int sas_seq);

	public int updatesasdone(int sas_seq);

	public int makepayment(Payment pmt);

	public int insertCashonhand(Cashonhand cashonhand);

	public List<Cashonhand> selectCashonhand(Cashonhand cashonhand);

	public List<Cashonhand> selectCashOne(Cashonhand cashonhand);

	public int deleteCashonhand(Cashonhand cashonhand);

	public ArrayList<Cashonhand> predictCash(int comp_seq);

	public Integer predictPmtCash(int comp_seq);

	public ArrayList<HashMap<String, Object>> selectWeekPosReport(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> selectPaymentList(int comp_seq);

	public ArrayList<HashMap<String, Object>> selectWeekDay(HashMap<String, Object> map);

	public ArrayList<Object> searchDayPosReport(HashMap<String, Object> map);

	public ArrayList<Object> selectMonthPosReport(HashMap<String, Object> map);

	public Integer cumulatepaymenttoday(int comp_seq);

	public Integer swaptable(HashMap<String, Integer> map);

	public Integer movetable(HashMap<String, Integer> map);

	public Integer mergetable(HashMap<String, Integer> map);

	public Integer deleteSas(Sales_state sas);
}
