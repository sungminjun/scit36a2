package com.scit36a2.minnano.vo;

public class Company {
	private int comp_seq; // comp_seq number NOT NULL,
	private String comp_id; // comp_id varchar2(10) NOT NULL UNIQUE,
	private String comp_name; // comp_name varchar2(100) NOT NULL,
	private String comp_tel; // comp_tel varchar2(20) NOT NULL,
	private String comp_address; // comp_address varchar2(600) NOT NULL,
	private String comp_address2; // comp_address2 varchar2(100) NOT NULL,

	public Company() {
	}

	public Company(int comp_seq, String comp_id, String comp_name, String comp_tel, String comp_address,
			String comp_address2) {
		this.comp_seq = comp_seq;
		this.comp_id = comp_id;
		this.comp_name = comp_name;
		this.comp_tel = comp_tel;
		this.comp_address = comp_address;
		this.comp_address2 = comp_address2;
	}

	public int getComp_seq() {
		return comp_seq;
	}

	public void setComp_seq(int comp_seq) {
		this.comp_seq = comp_seq;
	}

	public String getComp_id() {
		return comp_id;
	}

	public void setComp_id(String comp_id) {
		this.comp_id = comp_id;
	}

	public String getComp_name() {
		return comp_name;
	}

	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}

	public String getComp_tel() {
		return comp_tel;
	}

	public void setComp_tel(String comp_tel) {
		this.comp_tel = comp_tel;
	}

	public String getComp_address() {
		return comp_address;
	}

	public void setComp_address(String comp_address) {
		this.comp_address = comp_address;
	}

	public String getComp_address2() {
		return comp_address2;
	}

	public void setComp_address2(String comp_address2) {
		this.comp_address2 = comp_address2;
	}

	@Override
	public String toString() {
		return "Company [comp_seq=" + comp_seq + ", comp_id=" + comp_id + ", comp_name=" + comp_name + ", comp_tel="
				+ comp_tel + ", comp_address=" + comp_address + ", comp_address2=" + comp_address2 + "]";
	}
}
