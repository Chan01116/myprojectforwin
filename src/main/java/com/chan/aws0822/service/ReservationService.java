package com.chan.aws0822.service;

import java.util.List;

import com.chan.aws0822.domain.ReservationVo;

public interface ReservationService {
	
	 // 예약 생성
    ReservationVo createReservation(ReservationVo reservation);
    
    // 예약 조회
    ReservationVo getReservation(int reservationId);
    
    // 회원의 예약 목록 조회
    List<ReservationVo> getReservationsByMember(int midx);
    
    // 예약 상태 업데이트
    void updateReservationStatus(int reservationId, String status);
    
    // 예약 취소
    void cancelReservation(int reservationId);

}
