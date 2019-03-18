package com.scit36a2.minnano.vo;

public class Board_comments {

	private int board_comments_seq; // board_comments_seq number NOT NULL,
	private int board_seq; // board_seq number NOT NULL,
	private String board_comments_writer; // board_comments_writer varchar2(30) NOT NULL,
	private String board_comments_content; // board_comments_content varchar2(500) NOT NULL,
	private String board_comments_regdate; // board_comments_regdate date DEFAULT sysdate NOT NULL,

	public Board_comments() {
	}

	public Board_comments(int board_comments_seq, int board_seq, String board_comments_writer,
			String board_comments_content, String board_comments_regdate) {
		this.board_comments_seq = board_comments_seq;
		this.board_seq = board_seq;
		this.board_comments_writer = board_comments_writer;
		this.board_comments_content = board_comments_content;
		this.board_comments_regdate = board_comments_regdate;
	}

	public int getBoard_comments_seq() {
		return board_comments_seq;
	}

	public void setBoard_comments_seq(int board_comments_seq) {
		this.board_comments_seq = board_comments_seq;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard_comments_writer() {
		return board_comments_writer;
	}

	public void setBoard_comments_writer(String board_comments_writer) {
		this.board_comments_writer = board_comments_writer;
	}

	public String getBoard_comments_content() {
		return board_comments_content;
	}

	public void setBoard_comments_content(String board_comments_content) {
		this.board_comments_content = board_comments_content;
	}

	public String getBoard_comments_regdate() {
		return board_comments_regdate;
	}

	public void setBoard_comments_regdate(String board_comments_regdate) {
		this.board_comments_regdate = board_comments_regdate;
	}

	@Override
	public String toString() {
		return "Board_comments [board_comments_seq=" + board_comments_seq + ", board_seq=" + board_seq
				+ ", board_comments_writer=" + board_comments_writer + ", board_comments_content="
				+ board_comments_content + ", board_comments_regdate=" + board_comments_regdate + "]";
	}
}
