package com.scit36a2.minnano.dao;
import java.util.ArrayList;
import java.util.HashMap;

import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_state;

public interface PosDAO {

	public int insertSasSad(HashMap<String, Object> map);

	public int insertPayment(Payment payment);

	public int deleteSasSadPay(int comp_seq);

	public ArrayList<HashMap<String,Object>> selectPOSone(int comp_seq);

	public ArrayList<HashMap<String, Object>> selectPOStwo(int comp_seq);

	public int updatePOStwo(Sales_state sales_state);

	public ArrayList<HashMap<String, Object>> seatsavailable(int comp_seq);
	

	public ArrayList<HashMap<String, Object>> selectPosReport(HashMap<String, Object> map);

	
	public ArrayList<HashMap<String, Object>> selectPaymentList(int comp_seq);
}

