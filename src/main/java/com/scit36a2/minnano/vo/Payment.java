package com.scit36a2.minnano.vo;

public class Payment {
	private int payment_seq; // payment_seq number NOT NULL,
	private int sales_state_seq; // sales_state_seq number NOT NULL,
	private int payment_type; // payment_type number(1) NOT NULL,
	private int payment_amount; // payment_amount number DEFAULT 0 NOT NULL,
	private String payment_time; // payment_time date DEFAULT sysdate NOT NULL,
	private String payment_clerk; // payment_clerk varchar2(30) NOT NULL,

	public Payment() {
	}

	public Payment(int payment_seq, int sales_state_seq, int payment_type, int payment_amount, String payment_time,
			String payment_clerk) {
		this.payment_seq = payment_seq;
		this.sales_state_seq = sales_state_seq;
		this.payment_type = payment_type;
		this.payment_amount = payment_amount;
		this.payment_time = payment_time;
		this.payment_clerk = payment_clerk;
	}

	public int getPayment_seq() {
		return payment_seq;
	}

	public void setPayment_seq(int payment_seq) {
		this.payment_seq = payment_seq;
	}

	public int getSales_state_seq() {
		return sales_state_seq;
	}

	public void setSales_state_seq(int sales_state_seq) {
		this.sales_state_seq = sales_state_seq;
	}

	public int getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(int payment_type) {
		this.payment_type = payment_type;
	}

	public int getPayment_amount() {
		return payment_amount;
	}

	public void setPayment_amount(int payment_amount) {
		this.payment_amount = payment_amount;
	}

	public String getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(String payment_time) {
		this.payment_time = payment_time;
	}

	public String getPayment_clerk() {
		return payment_clerk;
	}

	public void setPayment_clerk(String payment_clerk) {
		this.payment_clerk = payment_clerk;
	}

	@Override
	public String toString() {
		return "Payment [payment_seq=" + payment_seq + ", sales_state_seq=" + sales_state_seq + ", payment_type="
				+ payment_type + ", payment_amount=" + payment_amount + ", payment_time=" + payment_time
				+ ", payment_clerk=" + payment_clerk + "]";
	}
}
