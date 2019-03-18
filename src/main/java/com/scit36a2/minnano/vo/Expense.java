package com.scit36a2.minnano.vo;

public class Expense {

	private int expense_seq; // expense_seq number NOT NULL,
	private int comp_seq; // comp_seq number NOT NULL,
	private int expense_type; // expense_type number(1) NOT NULL,
	private String expense_date; // expense_date date DEFAULT sysdate NOT NULL,
	private String expense_description; // expense_description varchar2(300) NOT NULL,
	private int expense_amount; // expense_amount number DEFAULT 0 NOT NULL,

	public Expense() {
	}

	public Expense(int expense_seq, int comp_seq, int expense_type, String expense_date, String expense_description,
			int expense_amount) {
		this.expense_seq = expense_seq;
		this.comp_seq = comp_seq;
		this.expense_type = expense_type;
		this.expense_date = expense_date;
		this.expense_description = expense_description;
		this.expense_amount = expense_amount;
	}

	public int getExpense_seq() {
		return expense_seq;
	}

	public void setExpense_seq(int expense_seq) {
		this.expense_seq = expense_seq;
	}

	public int getComp_seq() {
		return comp_seq;
	}

	public void setComp_seq(int comp_seq) {
		this.comp_seq = comp_seq;
	}

	public int getExpense_type() {
		return expense_type;
	}

	public void setExpense_type(int expense_type) {
		this.expense_type = expense_type;
	}

	public String getExpense_date() {
		return expense_date;
	}

	public void setExpense_date(String expense_date) {
		this.expense_date = expense_date;
	}

	public String getExpense_description() {
		return expense_description;
	}

	public void setExpense_description(String expense_description) {
		this.expense_description = expense_description;
	}

	public int getExpense_amount() {
		return expense_amount;
	}

	public void setExpense_amount(int expense_amount) {
		this.expense_amount = expense_amount;
	}

	@Override
	public String toString() {
		return "Expense [expense_seq=" + expense_seq + ", comp_seq=" + comp_seq + ", expense_type=" + expense_type
				+ ", expense_date=" + expense_date + ", expense_description=" + expense_description
				+ ", expense_amount=" + expense_amount + "]";
	}
}
