package com.scit36a2.minnano.dao;

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
	 * 회원가입 처리
	 */
	public int insertMember(Employee employee) {
		MemberDAO dao=session.getMapper(MemberDAO.class);
		
		int result=0;
		
		try {
		result=dao.insertMember(employee);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	/*
	 * 사업자 등록번호 중복체크
	 */
	public Employee selectOne(Employee employee) {
		MemberDAO dao=session.getMapper(MemberDAO.class);
		Employee e=dao.selectOne(employee);
		return e;
	}
	public int insertCompany(Company company) {
		
		MemberDAO dao=session.getMapper(MemberDAO.class);
		
		int result=0;
		
		try {
		result=dao.insertCompany(company);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	

}
