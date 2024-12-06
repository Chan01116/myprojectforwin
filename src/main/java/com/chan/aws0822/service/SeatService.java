package com.chan.aws0822.service;

import java.util.List;

import com.chan.aws0822.domain.SeatVo;

public interface SeatService {
	
	 List<SeatVo> getAllSeats(int flightId);
	    
	    // Ư�� �װ����� �¼� ��޺� �ܿ� �¼� ��ȸ
	    List<String> getAvailableSeats(int flightId, String seatGrade);
	    
	    // �¼� ���� ���� Ȯ��
	    boolean isSeatAvailable(int flightId, String seatNumber);
	    
	    // �¼� ���� ��ȸ
	    SeatVo getSeatByNumber(int flightId, String seatNumber);

}
