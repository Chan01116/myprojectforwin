package com.chan.aws0822.domain;

public class AirportVo {
	private String icn;
	private String nrt;
	private String lax;
	private String gmp;
	private String hnd;
	private String jfk;
	private String cdg;
	private String airportCode;    // 공항 코드
    private String airportName;    // 공항 이름
    private String city;           // 도시
	private String country;        // 국가
	
	
	
	
	public AirportVo() {}

	public AirportVo(String airportCode, String airportName, String city, String country) {
	    this.airportCode = airportCode;
	    this.airportName = airportName;
	    this.city = city;
	    this.country = country;
	}
	
	
	
	
	
	public String getAirportCode() {
		return airportCode;
	}
	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}
	public String getAirportName() {
		return airportName;
	}
	public void setAirportName(String airportName) {
		this.airportName = airportName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getIcn() {
		return icn;
	}
	public void setIcn(String icn) {
		this.icn = icn;
	}
	public String getNrt() {
		return nrt;
	}
	public void setNrt(String nrt) {
		this.nrt = nrt;
	}
	public String getLax() {
		return lax;
	}
	public void setLax(String lax) {
		this.lax = lax;
	}
	public String getGmp() {
		return gmp;
	}
	public void setGmp(String gmp) {
		this.gmp = gmp;
	}
	public String getHnd() {
		return hnd;
	}
	public void setHnd(String hnd) {
		this.hnd = hnd;
	}
	public String getJfk() {
		return jfk;
	}
	public void setJfk(String jfk) {
		this.jfk = jfk;
	}
	public String getCdg() {
		return cdg;
	}
	public void setCdg(String cdg) {
		this.cdg = cdg;
	}
}
