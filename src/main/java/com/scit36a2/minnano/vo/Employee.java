package com.scit36a2.minnano.vo;

public class Employee {
	private int emp_seq; // emp_seq number NOT NULL,
	private int comp_seq; // comp_seq number NOT NULL,
	private String emp_id; // emp_id varchar2(20) NOT NULL UNIQUE,
	private String emp_pw; // emp_pw varchar2(30) NOT NULL,
	private int emp_auth_level; // emp_auth_level number(1) NOT NULL,
	private String emp_name; // emp_name varchar2(30) NOT NULL,
	private String emp_tel; // emp_tel varchar2(20),
	private String emp_quiz; // emp_quiz varchar2(100) NOT NULL,
	private String emp_quiz_answer; // emp_quiz_answer varchar2(100) NOT NULL,

	public Employee() {
	}

	public Employee(int emp_seq, int comp_seq, String emp_id, String emp_pw, int emp_auth_level, String emp_name,
			String emp_tel, String emp_quiz, String emp_quiz_answer) {
		this.emp_seq = emp_seq;
		this.comp_seq = comp_seq;
		this.emp_id = emp_id;
		this.emp_pw = emp_pw;
		this.emp_auth_level = emp_auth_level;
		this.emp_name = emp_name;
		this.emp_tel = emp_tel;
		this.emp_quiz = emp_quiz;
		this.emp_quiz_answer = emp_quiz_answer;
	}

	public int getEmp_seq() {
		return emp_seq;
	}

	public void setEmp_seq(int emp_seq) {
		this.emp_seq = emp_seq;
	}

	public int getComp_seq() {
		return comp_seq;
	}

	public void setComp_seq(int comp_seq) {
		this.comp_seq = comp_seq;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_pw() {
		return emp_pw;
	}

	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}

	public int getEmp_auth_level() {
		return emp_auth_level;
	}

	public void setEmp_auth_level(int emp_auth_level) {
		this.emp_auth_level = emp_auth_level;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_quiz() {
		return emp_quiz;
	}

	public void setEmp_quiz(String emp_quiz) {
		this.emp_quiz = emp_quiz;
	}

	public String getEmp_quiz_answer() {
		return emp_quiz_answer;
	}

	public void setEmp_quiz_answer(String emp_quiz_answer) {
		this.emp_quiz_answer = emp_quiz_answer;
	}

	@Override
	public String toString() {
		return "Employee [emp_seq=" + emp_seq + ", comp_seq=" + comp_seq + ", emp_id=" + emp_id + ", emp_pw=" + emp_pw
				+ ", emp_auth_level=" + emp_auth_level + ", emp_name=" + emp_name + ", emp_tel=" + emp_tel
				+ ", emp_quiz=" + emp_quiz + ", emp_quiz_answer=" + emp_quiz_answer + "]";
	}
}
