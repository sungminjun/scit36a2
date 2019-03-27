package com.scit36a2.minnano.dao;


import java.util.HashMap;
import java.util.List;

import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;

public interface PosDAO {

	public int insertSasSad(HashMap<String, Object> map);

	public List<Sales_state> selectSas(int sales_state_seq);

	public List<Sales_detail> selectSad(int sales_detail_seq);

	public int insertPayment(Payment payment);

	

}
