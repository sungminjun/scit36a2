package com.scit36a2.minnano.vo;

public class Seat {
	private int seat_seq; // seat_seq number NOT NULL,
	private int comp_seq; // comp_seq number NOT NULL,
	private String seat_id; // seat_id varchar2(30) NOT NULL,

	public Seat() {
	}

	public Seat(int seat_seq, int comp_seq, String seat_id) {
		this.seat_seq = seat_seq;
		this.comp_seq = comp_seq;
		this.seat_id = seat_id;
	}

	public int getSeat_seq() {
		return seat_seq;
	}

	public void setSeat_seq(int seat_seq) {
		this.seat_seq = seat_seq;
	}

	public int getComp_seq() {
		return comp_seq;
	}

	public void setComp_seq(int comp_seq) {
		this.comp_seq = comp_seq;
	}

	public String getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(String seat_id) {
		this.seat_id = seat_id;
	}

	@Override
	public String toString() {
		return "Seat [seat_seq=" + seat_seq + ", comp_seq=" + comp_seq + ", seat_id=" + seat_id + "]";
	}
}
