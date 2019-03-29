package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Cashonhand;
import com.scit36a2.minnano.vo.Menu;
import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;

@Repository
public class PosRepo {
	// 이중 insert.....
	@Autowired
	SqlSession session;

	public int insertSasSad(HashMap<String, Object> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertSasSad(map);

		return result;
	}

	public int insertPayment(Payment payment) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertPayment(payment);
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectPOStwo(Menu menu) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> result = mapper.selectPOStwo(menu);
		System.out.println("Repo result : " + result);
		return result;
	}

	public int deleteSasSadPay(Sales_state sales_state) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.deleteSasSadPay(sales_state);
		return result;
	}

	public List<Menu> selectPOS2(Sales_state sales_state_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		List<Menu> result = mapper.selectPOS2(sales_state_seq);
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectPaymentList(int comp_seq) {
		PosDAO dao = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectPaymentList(comp_seq);
		System.out.println(list.toString());
		return list;
	}

	public ArrayList<HashMap<String, Object>> seatsavailable(int comp_seq) {
		PosDAO dao = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.seatsavailable(comp_seq);

		return null;
	}

}
