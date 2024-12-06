package com.chan.aws0822.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.chan.aws0822.domain.ReservationVo;

public interface ReservationMapper {
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
