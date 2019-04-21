package com.scit36a2.minnano.vo;

public class CardVeriTool {
	// 기간별 승인내역_세부내역.xls 의 구분자료
	// category표시는 row3 에 있음 (title of xls@row1, summary of xls@row2)
	private int cvt_seq; // No.
	private String gubun; // 구분
	private String cvt_date; // 거래일자
	private String cvt_time; // 거래시간
	private String cvt_cardtype1; // 카드사
	private String cvt_cardtype2; // 제휴카드사
	private String cvt_cardnum16; // 카드번호
	private String cvt_cardverinum; // 승인번호
	private int cvt_amount; // 승인금액
	private String cvt_instperiod; // 할부기간

	public CardVeriTool() {
	}

	public CardVeriTool(int cvt_seq, String gubun, String cvt_date, String cvt_time, String cvt_cardtype1,
			String cvt_cardtype2, String cvt_cardnum16, String cvt_cardverinum, int cvt_amount, String cvt_instperiod) {
		this.cvt_seq = cvt_seq;
		this.gubun = gubun;
		this.cvt_date = cvt_date;
		this.cvt_time = cvt_time;
		this.cvt_cardtype1 = cvt_cardtype1;
		this.cvt_cardtype2 = cvt_cardtype2;
		this.cvt_cardnum16 = cvt_cardnum16;
		this.cvt_cardverinum = cvt_cardverinum;
		this.cvt_amount = cvt_amount;
		this.cvt_instperiod = cvt_instperiod;
	}

	public int getCvt_seq() {
		return cvt_seq;
	}

	public void setCvt_seq(int cvt_seq) {
		this.cvt_seq = cvt_seq;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getCvt_date() {
		return cvt_date;
	}

	public void setCvt_date(String cvt_date) {
		this.cvt_date = cvt_date;
	}

	public String getCvt_time() {
		return cvt_time;
	}

	public void setCvt_time(String cvt_time) {
		this.cvt_time = cvt_time;
	}

	public String getCvt_cardtype1() {
		return cvt_cardtype1;
	}

	public void setCvt_cardtype1(String cvt_cardtype1) {
		this.cvt_cardtype1 = cvt_cardtype1;
	}

	public String getCvt_cardtype2() {
		return cvt_cardtype2;
	}

	public void setCvt_cardtype2(String cvt_cardtype2) {
		this.cvt_cardtype2 = cvt_cardtype2;
	}

	public String getCvt_cardnum16() {
		return cvt_cardnum16;
	}

	public void setCvt_cardnum16(String cvt_cardnum16) {
		this.cvt_cardnum16 = cvt_cardnum16;
	}

	public String getCvt_cardverinum() {
		return cvt_cardverinum;
	}

	public void setCvt_cardverinum(String cvt_cardverinum) {
		this.cvt_cardverinum = cvt_cardverinum;
	}

	public int getCvt_amount() {
		return cvt_amount;
	}

	public void setCvt_amount(int cvt_amount) {
		this.cvt_amount = cvt_amount;
	}

	public String getCvt_instperiod() {
		return cvt_instperiod;
	}

	public void setCvt_instperiod(String cvt_instperiod) {
		this.cvt_instperiod = cvt_instperiod;
	}

	@Override
	public String toString() {
		return "CardVeriTool [cvt_seq=" + cvt_seq + ", gubun=" + gubun + ", cvt_date=" + cvt_date + ", cvt_time="
				+ cvt_time + ", cvt_cardtype1=" + cvt_cardtype1 + ", cvt_cardtype2=" + cvt_cardtype2
				+ ", cvt_cardnum16=" + cvt_cardnum16 + ", cvt_cardverinum=" + cvt_cardverinum + ", cvt_amount="
				+ cvt_amount + ", cvt_instperiod=" + cvt_instperiod + "]";
	}

}
