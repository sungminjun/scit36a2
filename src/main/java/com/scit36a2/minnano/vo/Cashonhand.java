package com.scit36a2.minnano.vo;

public class Cashonhand {
	private int cashonhand_seq; // cashonhand_seq number NOT NULL,
	private int comp_seq; // comp_seq number NOT NULL,
	private int cashonhand_type; // cashonhand_type number(1) NOT NULL,
	private String cashonhand_register; // cashonhand_register varchar2(30) NOT NULL,
	private String cashonhand_regdate; // cashonhand_regdate date DEFAULT sysdate NOT NULL,
	private int cashonhand_error; // cashonhand_error number,
	private int cashonhand_cash; // cashonhand_cash number NOT NULL,

	public Cashonhand() {
	}

	public Cashonhand(int cashonhand_seq, int comp_seq, int cashonhand_type, String cashonhand_register,
			String cashonhand_regdate, int cashonhand_error, int cashonhand_cash) {
		this.cashonhand_seq = cashonhand_seq;
		this.comp_seq = comp_seq;
		this.cashonhand_type = cashonhand_type;
		this.cashonhand_register = cashonhand_register;
		this.cashonhand_regdate = cashonhand_regdate;
		this.cashonhand_error = cashonhand_error;
		this.cashonhand_cash = cashonhand_cash;
	}

	public int getCashonhand_seq() {
		return cashonhand_seq;
	}

	public void setCashonhand_seq(int cashonhand_seq) {
		this.cashonhand_seq = cashonhand_seq;
	}

	public int getComp_seq() {
		return comp_seq;
	}

	public void setComp_seq(int comp_seq) {
		this.comp_seq = comp_seq;
	}

	public int getCashonhand_type() {
		return cashonhand_type;
	}

	public void setCashonhand_type(int cashonhand_type) {
		this.cashonhand_type = cashonhand_type;
	}

	public String getCashonhand_register() {
		return cashonhand_register;
	}

	public void setCashonhand_register(String cashonhand_register) {
		this.cashonhand_register = cashonhand_register;
	}

	public String getCashonhand_regdate() {
		return cashonhand_regdate;
	}

	public void setCashonhand_regdate(String cashonhand_regdate) {
		this.cashonhand_regdate = cashonhand_regdate;
	}

	public int getCashonhand_error() {
		return cashonhand_error;
	}

	public void setCashonhand_error(int cashonhand_error) {
		this.cashonhand_error = cashonhand_error;
	}

	public int getCashonhand_cash() {
		return cashonhand_cash;
	}

	public void setCashonhand_cash(int cashonhand_cash) {
		this.cashonhand_cash = cashonhand_cash;
	}

	@Override
	public String toString() {
		return "Cashonhand [cashonhand_seq=" + cashonhand_seq + ", comp_seq=" + comp_seq + ", cashonhand_type="
				+ cashonhand_type + ", cashonhand_register=" + cashonhand_register + ", cashonhand_regdate="
				+ cashonhand_regdate + ", cashonhand_error=" + cashonhand_error + ", cashonhand_cash=" + cashonhand_cash
				+ "]";
	}
}
