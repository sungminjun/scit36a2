
package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Cashonhand;
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

	public ArrayList<HashMap<String, Object>> selectPOSone(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> result = mapper.selectPOSone(comp_seq);
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectPOStwo(int comp_seq) {
		PosDAO dao = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> result = dao.selectPOStwo(comp_seq);
		return result;
	}

	public int deleteSasSadPay(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.deleteSasSadPay(comp_seq);
		return result;
	}

	public int updatePOStwo(Sales_state sales_state) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.updatePOStwo(sales_state);
		return result;

	}

	public ArrayList<HashMap<String, Object>> selectPaymentList(int comp_seq) {
		PosDAO dao = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectPaymentList(comp_seq);
		return list;
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

	public int insertCashonhand(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertCashonhand(cashonhand);
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

	public List<Cashonhand> selectCashonhand(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		List<Cashonhand> result = mapper.selectCashonhand(cashonhand);
		return result;
	}

	public List<Cashonhand> selectCashOne(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		List<Cashonhand> result = mapper.selectCashOne(cashonhand);
		return result;
	}

	public int deleteCashonhand(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.deleteCashonhand(cashonhand);
		return result;
	}

	public ArrayList<Cashonhand> predictCash(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<Cashonhand> result = mapper.predictCash(comp_seq);
		return result;
	}

	public Integer predictPmtCash(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.predictPmtCash(comp_seq);
		return result;
	}


	public ArrayList<HashMap<String, Object>> selectWeekPosReport(HashMap<String, Object> map) {
		PosDAO dao=session.getMapper(PosDAO.class);
		ArrayList<HashMap<String,Object>>list=dao.selectWeekPosReport(map);
		return list;
	}



	public ArrayList<HashMap<String, Object>> selectWeekDay(HashMap<String, Object> map) {
		PosDAO dao=session.getMapper(PosDAO.class);
		ArrayList<HashMap<String,Object>>list=dao.selectWeekDay(map);
		return list;
	}



	public ArrayList<Object> searchDayPosReport(HashMap<String, Object> map) {
		PosDAO dao=session.getMapper(PosDAO.class);
		ArrayList<Object>list=dao.searchDayPosReport(map);
		return list;
	}



	public ArrayList<Object> selectMonthPosReport(HashMap<String, Object> map) {
		PosDAO dao=session.getMapper(PosDAO.class);
		ArrayList<Object>list=dao.selectMonthPosReport(map);
		return list;
  }
  
  public ArrayList<HashMap<String, Object>> selectPosReport(HashMap<String, Object> map) {
		PosDAO dao = session.getMapper(PosDAO.class);
		ArrayList<HashMap<String, Object>> list = dao.selectPosReport(map);
		return list;
	}

	public Integer cumulatepaymenttoday(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.cumulatepaymenttoday(comp_seq);
		return result;
	}

	public int swaptable(HashMap<String, Integer> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.swaptable(map);
		return result;
	}

	public int movetable(HashMap<String, Integer> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.movetable(map);
		return result;
	}

	public int mergetable(HashMap<String, Integer> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.mergetable(map);
		return result;
	}

	public int deleteSas(Sales_state sas) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.deleteSas(sas);
		return result;
	}

}
