
package com.scit36a2.minnano.dao;
import java.util.ArrayList;
import java.util.HashMap;
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
	
	public ArrayList<HashMap<String,Object>> selectPOSone(int comp_seq)	{
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String,Object>> result = mapper.selectPOSone(comp_seq);
		return result;
	}
	
	public ArrayList<HashMap<String, Object>>selectPOStwo(int comp_seq) {
		PosDAO dao = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String,Object>> result = dao.selectPOStwo(comp_seq);
		return result;
	}
	
	public int deleteSasSadPay(int comp_seq)	{
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.deleteSasSadPay(comp_seq);
		return result;
	}
	
	public int updatePOStwo(Sales_state sales_state)	{
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.updatePOStwo(sales_state);
		return result;
		
	}

	public ArrayList<HashMap<String, Object>> selectPaymentList(int comp_seq) {
		// TODO Auto-generated method stub
		return null;
	}



	public ArrayList<HashMap<String, Object>> seatsavailable(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> result = mapper.seatsavailable(comp_seq);
		return result;
	}

	public int chksasseqs() {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.chksasseqs();
		return result;
	}



	public int insertSas(Sales_state sas) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertSas(sas);
		return result;
	}



	public int insertSad(Sales_detail sad) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertSad(sad);
		return result;
	}



	public ArrayList<Sales_detail> alOrderList(int sas_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<Sales_detail> result = mapper.alOrderList(sas_seq);
		return result;
	}



	public int deleteoldorder(int sas_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.deleteoldorder(sas_seq);
		return result;
	}



	public int updatesasdone(int sas_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.updatesasdone(sas_seq);
		return result;
	}



	public int makepayment(Payment pmt) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.makepayment(pmt);
		return result;
	}
	

	
}
