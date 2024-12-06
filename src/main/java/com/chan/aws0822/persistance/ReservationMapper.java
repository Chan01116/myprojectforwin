package com.chan.aws0822.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.chan.aws0822.domain.ReservationVo;

public interface ReservationMapper {
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
