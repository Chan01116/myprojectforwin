package com.chan.aws0822.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.chan.aws0822.domain.SeatVo;
@Mapper
public interface SeatMapper {
	List<SeatVo> getAllSeats(int flightId);
    
    // 특정 항공편의 좌석 등급별 잔여 좌석 조회
    List<String> getAvailableSeats(int flightId, String seatGrade);
    
    // 좌석 예약 상태 확인
    boolean isSeatAvailable(int flightId, String seatNumber);
    
    // 좌석 정보 조회
    SeatVo getSeatByNumber(int flightId, String seatNumber);

}
