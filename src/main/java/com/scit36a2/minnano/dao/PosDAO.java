package com.scit36a2.minnano.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;

public interface PosDAO {

	public int insertSasSad(HashMap<String, Object> map);

	public int insertPayment(Payment payment);

	public ArrayList<HashMap<String,Object>> selectPOStwo(Menu menu);

	public int deleteSasSadPay(Sales_state sales_state);

	public List<Menu> selectPOS2(Sales_state sales_state_seq);
}
