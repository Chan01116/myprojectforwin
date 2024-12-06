package com.chan.aws0822.domain;

import java.time.LocalDateTime;

public class ReservationVo {
	 private int reservationId;
	    private int flightId;
	    private int midx;
	    private LocalDateTime reservationDate;
	    private int seatId;  // seat_number를 seatId로 변경
	    private String status;
	    private double totalPrice;  // 추가: 총 결제 금액
	    private String passengerName;  // 추가: 승객 이름
	    private String seatGrade;  // 추가: 좌석 등급
	    private String seat_number;
		
	    
	    
	    public String getSeat_number() {
			return seat_number;
		}
		public void setSeat_number(String seat_number) {
			this.seat_number = seat_number;
		}
		public int getReservationId() {
			return reservationId;
		}
		public void setReservationId(int reservationId) {
			this.reservationId = reservationId;
		}
		public int getFlightId() {
			return flightId;
		}
		public void setFlightId(int flightId) {
			this.flightId = flightId;
		}
		public int getMidx() {
			return midx;
		}
		public void setMidx(int midx) {
			this.midx = midx;
		}
		public LocalDateTime getReservationDate() {
			return reservationDate;
		}
		public void setReservationDate(LocalDateTime reservationDate) {
			this.reservationDate = reservationDate;
		}
		public int getSeatId() {
			return seatId;
		}
		public void setSeatId(int seatId) {
			this.seatId = seatId;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public double getTotalPrice() {
			return totalPrice;
		}
		public void setTotalPrice(double totalPrice) {
			this.totalPrice = totalPrice;
		}
		public String getPassengerName() {
			return passengerName;
		}
		public void setPassengerName(String passengerName) {
			this.passengerName = passengerName;
		}
		public String getSeatGrade() {
			return seatGrade;
		}
		public void setSeatGrade(String seatGrade) {
			this.seatGrade = seatGrade;
		}
	
		// 기본 생성자
		public ReservationVo() {}

		// 모든 필드를 포함하는 생성자
		public ReservationVo(int reservationId, int flightId, int midx, 
		    LocalDateTime reservationDate, int seatId, String status,
		    double totalPrice, String passengerName, String seatGrade) {
		    // 필드 초기화
		}
		
		
		@Override
		public String toString() {
		    return "ReservationVo{" +
		            "reservationId=" + reservationId +
		            ", flightId=" + flightId +
		            ", midx=" + midx +
		            ", reservationDate=" + reservationDate +
		            ", seatId=" + seatId +
		            ", status='" + status + '\'' +
		            ", totalPrice=" + totalPrice +
		            ", passengerName='" + passengerName + '\'' +
		            ", seatGrade='" + seatGrade + '\'' +
		            '}';
		}
		
	

}
