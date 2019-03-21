package com.scit36a2.minnano.dao;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
}
