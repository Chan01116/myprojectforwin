package com.chan.aws0822.domain;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FlightSearchDTO {
	 @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	    
	  private String departure;        // ����� ���� �ڵ�
	    private String arrival;         // ������ ���� �ڵ�
	    private LocalDateTime departureDate;  // �����
	    private int passengerCount;     // ž�°� ��
	    private String seatClass;       // �¼� ���
	    
	    // �⺻ ������
	    public FlightSearchDTO() {}

		public String getDeparture() {
			return departure;
		}

		public void setDeparture(String departure) {
			this.departure = departure;
		}

		public String getArrival() {
			return arrival;
		}

		public void setArrival(String arrival) {
			this.arrival = arrival;
		}

		public LocalDateTime getDepartureDate() {
			return departureDate;
		}

		public void setDepartureDate(LocalDateTime departureDate) {
			this.departureDate = departureDate;
		}

		public int getPassengerCount() {
			return passengerCount;
		}

		public void setPassengerCount(int passengerCount) {
			this.passengerCount = passengerCount;
		}

		public String getSeatClass() {
			return seatClass;
		}

		public void setSeatClass(String seatClass) {
			this.seatClass = seatClass;
		}
	    
	    // Getter/Setter
	    // ... getter/setter �޼����

}
