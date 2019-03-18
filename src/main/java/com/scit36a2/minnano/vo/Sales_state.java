package com.scit36a2.minnano.vo;

public class Sales_state {
	private int sales_state_seq; // sales_state_seq number NOT NULL,
	private int comp_seq; // comp_seq number NOT NULL,
	private int seat_seq; // seat_seq number NOT NULL,
	private String sales_start; // sales_start date DEFAULT sysdate NOT NULL,
	private String sales_end; // sales_end date,
	private int sales_visitors; // sales_visitors number(2) NOT NULL,
	private String sales_memo; // sales_memo varchar2(600),

	public Sales_state() {
	}

	public Sales_state(int sales_state_seq, int comp_seq, int seat_seq, String sales_start, String sales_end,
			int sales_visitors, String sales_memo) {
		this.sales_state_seq = sales_state_seq;
		this.comp_seq = comp_seq;
		this.seat_seq = seat_seq;
		this.sales_start = sales_start;
		this.sales_end = sales_end;
		this.sales_visitors = sales_visitors;
		this.sales_memo = sales_memo;
	}

	public int getSales_state_seq() {
		return sales_state_seq;
	}

	public void setSales_state_seq(int sales_state_seq) {
		this.sales_state_seq = sales_state_seq;
	}

	public int getComp_seq() {
		return comp_seq;
	}

	public void setComp_seq(int comp_seq) {
		this.comp_seq = comp_seq;
	}

	public int getSeat_seq() {
		return seat_seq;
	}

	public void setSeat_seq(int seat_seq) {
		this.seat_seq = seat_seq;
	}

	public String getSales_start() {
		return sales_start;
	}

	public void setSales_start(String sales_start) {
		this.sales_start = sales_start;
	}

	public String getSales_end() {
		return sales_end;
	}

	public void setSales_end(String sales_end) {
		this.sales_end = sales_end;
	}

	public int getSales_visitors() {
		return sales_visitors;
	}

	public void setSales_visitors(int sales_visitors) {
		this.sales_visitors = sales_visitors;
	}

	public String getSales_memo() {
		return sales_memo;
	}

	public void setSales_memo(String sales_memo) {
		this.sales_memo = sales_memo;
	}

	@Override
	public String toString() {
		return "Sales_state [sales_state_seq=" + sales_state_seq + ", comp_seq=" + comp_seq + ", seat_seq=" + seat_seq
				+ ", sales_start=" + sales_start + ", sales_end=" + sales_end + ", sales_visitors=" + sales_visitors
				+ ", sales_memo=" + sales_memo + "]";
	}
}
