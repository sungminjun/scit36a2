package com.scit36a2.minnano.vo;

public class Sales_detail {

	private int sales_detail_seq; // sales_detail_seq number NOT NULL,
	private int sales_state_seq; // sales_state_seq number NOT NULL,
	private int menu_seq; // menu_seq number NOT NULL,
	private int sales_order; // sales_order number(2) DEFAULT 1 NOT NULL,
	private int sales_discount; // sales_discount number,

	public Sales_detail() {
	}

	public Sales_detail(int sales_detail_seq, int sales_state_seq, int menu_seq, int sales_order, int sales_discount) {
		this.sales_detail_seq = sales_detail_seq;
		this.sales_state_seq = sales_state_seq;
		this.menu_seq = menu_seq;
		this.sales_order = sales_order;
		this.sales_discount = sales_discount;
	}

	public int getSales_detail_seq() {
		return sales_detail_seq;
	}

	public void setSales_detail_seq(int sales_detail_seq) {
		this.sales_detail_seq = sales_detail_seq;
	}

	public int getSales_state_seq() {
		return sales_state_seq;
	}

	public void setSales_state_seq(int sales_state_seq) {
		this.sales_state_seq = sales_state_seq;
	}

	public int getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}

	public int getSales_order() {
		return sales_order;
	}

	public void setSales_order(int sales_order) {
		this.sales_order = sales_order;
	}

	public int getSales_discount() {
		return sales_discount;
	}

	public void setSales_discount(int sales_discount) {
		this.sales_discount = sales_discount;
	}

	@Override
	public String toString() {
		return "Sales_detail [sales_detail_seq=" + sales_detail_seq + ", sales_state_seq=" + sales_state_seq
				+ ", menu_seq=" + menu_seq + ", sales_order=" + sales_order + ", sales_discount=" + sales_discount
				+ "]";
	}
}
