package com.scit36a2.minnano.vo;

public class Menu {
	private int menu_seq; // menu_seq number NOT NULL,
	private int comp_seq; // comp_seq number NOT NULL,
	private int menu_sellFlag; // menu_sellFlag number(1) NOT NULL,
	private String menu_name; // menu_name varchar2(200) NOT NULL,
	private int menu_price; // menu_price number NOT NULL,
	private String menu_category; // menu_category varchar2(100) NOT NULL,

	public Menu() {
	}

	public Menu(int menu_seq, int comp_seq, int menu_sellFlag, String menu_name, int menu_price, String menu_category) {
		this.menu_seq = menu_seq;
		this.comp_seq = comp_seq;
		this.menu_sellFlag = menu_sellFlag;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_category = menu_category;
	}

	public int getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}

	public int getComp_seq() {
		return comp_seq;
	}

	public void setComp_seq(int comp_seq) {
		this.comp_seq = comp_seq;
	}

	public int getMenu_sellFlag() {
		return menu_sellFlag;
	}

	public void setMenu_sellFlag(int menu_sellFlag) {
		this.menu_sellFlag = menu_sellFlag;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_category() {
		return menu_category;
	}

	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}

	@Override
	public String toString() {
		return "Menu [menu_seq=" + menu_seq + ", comp_seq=" + comp_seq + ", menu_sellFlag=" + menu_sellFlag
				+ ", menu_name=" + menu_name + ", menu_price=" + menu_price + ", menu_category=" + menu_category + "]";
	}
}
