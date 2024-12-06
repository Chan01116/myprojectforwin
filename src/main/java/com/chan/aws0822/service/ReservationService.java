package com.chan.aws0822.service;

import java.util.List;

import com.chan.aws0822.domain.ReservationVo;

public interface ReservationService {
	
	 // ���� ����
    ReservationVo createReservation(ReservationVo reservation);
    
    // ���� ��ȸ
    ReservationVo getReservation(int reservationId);
    
    // ȸ���� ���� ��� ��ȸ
    List<ReservationVo> getReservationsByMember(int midx);
    
    // ���� ���� ������Ʈ
    void updateReservationStatus(int reservationId, String status);
    
    // ���� ���
    void cancelReservation(int reservationId);

}
