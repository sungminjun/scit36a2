package com.scit36a2.minnano.dao;

import com.scit36a2.minnano.vo.Company;
import com.scit36a2.minnano.vo.Employee;

public interface MemberDAO {

	//회원가입
	public int insertMember(Employee employee);
	public int insertCompany(Company company);
	
	//사업자등록번호 확인,로그인
	public Employee selectOne(Employee employee);
	


}
