package com.scit36a2.minnano.vo;

public class Board {
	private int board_seq; // board_seq number NOT NULL,
	private int emp_seq; // emp_seq number NOT NULL, 
	private String board_category; // board_category varchar2(30) NOT NULL,
	private String board_title; // board_title varchar2(100) NOT NULL,
	private String board_content; // board_content varchar2(3000) NOT NULL,
	private String board_orgname; // board_orgname varchar2(500),	
	private String board_savname; // board_savname varchar2(500),	
	private String board_regdate; // board_regdate date DEFAULT sysdate NOT NULL,
	private int board_hitcount; // board_hitcount number DEFAULT 0 NOT NULL,
/*int emp_seq = (Integer)session.getAttribute("emp_seq");
board.setemp_seq(emp_seq);*/
	public Board() {
	}

	public Board(int board_seq, int emp_seq, String board_category, String board_title, String board_content,
			String board_orgname, String board_savname, String board_regdate, int board_hitcount) {
		this.board_seq = board_seq;
		this.emp_seq = emp_seq;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_orgname = board_orgname;
		this.board_savname = board_savname;
		this.board_regdate = board_regdate;
		this.board_hitcount = board_hitcount;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public int getEmp_seq() {
		return emp_seq;
	}

	public void setEmp_seq(int emp_seq) {
		this.emp_seq = emp_seq;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_orgname() {
		return board_orgname;
	}

	public void setBoard_orgname(String board_orgname) {
		this.board_orgname = board_orgname;
	}

	public String getBoard_savname() {
		return board_savname;
	}

	public void setBoard_savname(String board_savname) {
		this.board_savname = board_savname;
	}

	public String getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}

	public int getBoard_hitcount() {
		return board_hitcount;
	}

	public void setBoard_hitcount(int board_hitcount) {
		this.board_hitcount = board_hitcount;
	}

	@Override
	public String toString() {
		return "Board [board_seq=" + board_seq + ", emp_seq=" + emp_seq + ", board_category=" + board_category
				+ ", board_title=" + board_title + ", board_content=" + board_content + ", board_orgname="
				+ board_orgname + ", board_savname=" + board_savname + ", board_regdate=" + board_regdate
				+ ", board_hitcount=" + board_hitcount + "]";
	}
}
