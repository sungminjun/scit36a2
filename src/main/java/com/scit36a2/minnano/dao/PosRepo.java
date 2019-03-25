package com.scit36a2.minnano.dao;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Payment;
import com.scit36a2.minnano.vo.Sales_detail;
import com.scit36a2.minnano.vo.Sales_state;

@Repository
public class PosRepo {
	//이중 insert.....
	@Autowired
	SqlSession session;

	public int insertSasSad(HashMap map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertSasSad(map);
		
		return result;
	}

	public List<Sales_state> selectSas(int sales_state_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		List<Sales_state> result = mapper.selectSas(sales_state_seq);
		return result;
	}

	public List<Sales_detail> selectSad(int sales_detail_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		List<Sales_detail> result = mapper.selectSad(sales_detail_seq);
		return result;
	}

	
	public int sales_state_seq()	{
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.sales_state_seq();
		return result;
	}
	
	public int insertPayment(Payment payment) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertPayment(payment);
		return result;
	}

	
}
