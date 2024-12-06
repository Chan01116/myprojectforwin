package com.chan.aws0822.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.chan.aws0822.domain.SeatVo;
@Mapper
public interface SeatMapper {
	List<SeatVo> getAllSeats(int flightId);
    
    // Ư�� �װ����� �¼� ��޺� �ܿ� �¼� ��ȸ
    List<String> getAvailableSeats(int flightId, String seatGrade);
    
    // �¼� ���� ���� Ȯ��
    boolean isSeatAvailable(int flightId, String seatNumber);
    
    // �¼� ���� ��ȸ
    SeatVo getSeatByNumber(int flightId, String seatNumber);

}
