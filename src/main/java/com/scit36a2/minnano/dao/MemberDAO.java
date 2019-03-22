package com.scit36a2.minnano.dao;

import java.util.HashMap;
import java.util.List;

import com.scit36a2.minnano.vo.Company;
import com.scit36a2.minnano.vo.Employee;

public interface MemberDAO {

	
	//로그인
	public Employee selectOne(Employee employee);
	//현재 등록된 전체 직원 목록 불러오기
	public List<Employee> selectAll(Employee employee);
	//사장님 정보수정 처리
	public int updateOwner(Employee employee);
	// 회원가입전 회사 seq 받아오기
	public int reqCompSeq();
	// 회원가입
	public int join(HashMap<String, Object> map);
	//사업자등록번호 중복확인
	public Company selectCompanyOne(Company company);
	
}
