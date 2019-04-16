package com.scit36a2.minnano.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit36a2.minnano.vo.Company;
import com.scit36a2.minnano.vo.Employee;

@Repository
public class MemberRepo {

	@Autowired
	SqlSession session;

	/*
	 * 회원 아이디로 회원 검색
	 * 
	 */
	public Employee selectOne(Employee employee) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		Employee e = dao.selectOne(employee);
		return e;
	}

	/*
	 * 알바생 등록 리스트 현황 불러오기
	 */
	public List<Employee> employeeList(int comp_seq) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		List<Employee> employeeList = dao.employeeList(comp_seq);
		return employeeList;

	}

	/**
	 * 사장님 정보 수정 요청 처리
	 * 
	 * @param employee
	 * @return
	 */
	public int updateMember(Employee employee) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		int result = dao.updateMember(employee);
		return result;

	}

	public int join(HashMap<String, Object> map) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		int result = dao.join(map);
		return result;
	}

	public int reqCompSeq() {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		int result = dao.reqCompSeq();
		return result;
	}

	/*
	 * 사업자 등록번호 중복체크
	 */

	public Company selectCompanyOne(int comp_seq) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		Company c = dao.selectCompanyOne(comp_seq);
		return c;
	}

	public Company selectCompanyOneById(Company company) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		Company c = dao.selectCompanyOneById(company);
		return c;
	}

	public int updateCompany(Company company) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		int result = dao.updateCompany(company);
		return result;
	}

	public int joinMember(Employee employee) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		int result = dao.joinMember(employee);
		return result;
	}

	public Employee findId(Map<String, Object> map) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		Employee e = dao.findId(map);
		return e;
	}

	public Employee selectEmployee(Employee emp) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		Employee result = dao.selectEmployee(emp);
		return result;
	}

	public ArrayList<Object> findPW(HashMap<String, Object> map) {
		MemberDAO dao = session.getMapper(MemberDAO.class);
		ArrayList<Object> list = dao.findPW(map);
		return list;
	}

}
