
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

	@Autowired
	SqlSession session;

	//
	// 여기부터 주문관련

	public ArrayList<Object> seatsavailable(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<Object> result = mapper.seatsavailable(comp_seq);
		return result;
	}

	// for makeorder
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
	///

	// replaceorder
	public int deleteoldorder(int sas_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.deleteoldorder(sas_seq);
		return result;
	}
	///

	public ArrayList<Sales_detail> alOrderList(int sas_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<Sales_detail> result = mapper.alOrderList(sas_seq);
		return result;
	}

	//
	// 여기부터 매출 payment 관리

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

	public Integer cumulatepaymenttoday(int comp_seq) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.cumulatepaymenttoday(comp_seq);
		return result;
	}

	public ArrayList<Payment> selectpayments(HashMap<String, Object> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		ArrayList<Payment> result = mapper.selectpayments(map);
		return result;
	}

	//
	// 여기부터 현금시재 cashonhand 관리

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

	public List<Cashonhand> selectCashonhand(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		List<Cashonhand> result = mapper.selectCashonhand(cashonhand);
		return result;
	}

	public int insertCashonhand(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.insertCashonhand(cashonhand);
		return result;
	}

	public List<Cashonhand> selectCashOne(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		List<Cashonhand> result = mapper.selectCashOne(cashonhand);
		return result;
	}

	// 약간 예외지만, mgr단에서 delete를 요청한다 (마감취소용)
	public int deleteCashonhand(Cashonhand cashonhand) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.deleteCashonhand(cashonhand);
		return result;
	}

	//
	// 여기부터 테이블 seats 관리

	public int movetable(HashMap<String, Integer> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.movetable(map);
		return result;
	}

	public int swaptable(HashMap<String, Integer> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.swaptable(map);
		return result;
	}

	public int mergetable(HashMap<String, Integer> map) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.mergetable(map);
		return result;
	}

	// merge 할때 삭제가 필요하다.
	public int deleteSas(Sales_state sas) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		Integer result = mapper.deleteSas(sas);
		return result;
	}

	public int updateSasmemo(Sales_state sas) {
		PosDAO mapper = session.getMapper(PosDAO.class);
		int result = mapper.updateSasmemo(sas);
		return result;
	}

}