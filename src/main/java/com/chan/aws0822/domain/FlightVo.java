package com.chan.aws0822.domain;

import java.util.List;

public class FlightVo {
	private int flight_id;
	private String flight_number;
	private int departure_airport_id;
	private int arrival_airport_id;
	private String departure_time;
	private String arrival_time;
	private String aircraft_type;
	private int available_seats;
	private int price;
	private int economy_seats;
	private int business_seats;
	private int first_seats;
	private int economy_price;
	private int business_price;
	private int first_price;
	private int seat_price; 
	private String seatClass;
	private List<String> reserved_seats;
	
	
	
	

	
	public String getSeatClass() {
	    return seatClass;
	}
	public void setSeatClass(String seatClass) {
	    this.seatClass = seatClass;
	}
	public List<String> getReserved_seats() {
		return reserved_seats;
	}
	public void setReserved_seats(List<String> reserved_seats) {
		this.reserved_seats = reserved_seats;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getEconomy_price() {
		return economy_price;
	}
	public void setEconomy_price(int economy_price) {
		this.economy_price = economy_price;
	}
	public int getBusiness_price() {
		return business_price;
	}
	public void setBusiness_price(int business_price) {
		this.business_price = business_price;
	}
	public int getFirst_price() {
		return first_price;
	}
	public void setFirst_price(int first_price) {
		this.first_price = first_price;
	}
	public int getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(int seat_price) {
		this.seat_price = seat_price;
	}
	public int getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}
	public String getFlight_number() {
		return flight_number;
	}
	public void setFlight_number(String flight_number) {
		this.flight_number = flight_number;
	}
	public int getDeparture_airport_id() {
		return departure_airport_id;
	}
	public void setDeparture_airport_id(int departure_airport_id) {
		this.departure_airport_id = departure_airport_id;
	}
	public int getArrival_airport_id() {
		return arrival_airport_id;
	}
	public void setArrival_airport_id(int arrival_airport_id) {
		this.arrival_airport_id = arrival_airport_id;
	}
	public String getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public String getAircraft_type() {
		return aircraft_type;
	}
	public void setAircraft_type(String aircraft_type) {
		this.aircraft_type = aircraft_type;
	}
	public int getAvailable_seats() {
		return available_seats;
	}
	public void setAvailable_seats(int available_seats) {
		this.available_seats = available_seats;
	}
	
	public int getEconomy_seats() {
		return economy_seats;
	}
	public void setEconomy_seats(int economy_seats) {
		this.economy_seats = economy_seats;
	}
	public int getBusiness_seats() {
		return business_seats;
	}
	public void setBusiness_seats(int business_seats) {
		this.business_seats = business_seats;
	}
	public int getFirst_seats() {
		return first_seats;
	}
	public void setFirst_seats(int first_seats) {
		this.first_seats = first_seats;
	}
	
	
	

}
