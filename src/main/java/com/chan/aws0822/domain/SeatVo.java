package com.chan.aws0822.domain;

public class SeatVo {
	
	private int sidx;
	private String seat_grade;
	private int flight_id;
	private String seat_number;
	public int getSidx() {
		return sidx;
	}
	
	
	public void setSidx(int sidx) {
		this.sidx = sidx;
	}
	public String getSeat_grade() {
		return seat_grade;
	}
	public void setSeat_grade(String seat_grade) {
		this.seat_grade = seat_grade;
	}
	public int getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}
	public String getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(String seat_number) {
		this.seat_number = seat_number;
	}

}
