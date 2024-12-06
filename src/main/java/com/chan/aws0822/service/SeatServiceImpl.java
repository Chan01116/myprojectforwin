package com.chan.aws0822.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chan.aws0822.domain.SeatVo;
import com.chan.aws0822.persistance.SeatMapper;
@Service
public class SeatServiceImpl implements SeatService {


	 @Autowired
	 private SqlSession sqlSession;
	 private SeatMapper seatMapper;
	 
	@Autowired   //스프링코어한테 여기다 주입해줘라고 이야기 하는것
	public SeatServiceImpl(SqlSession sqlSession) {
		this.seatMapper = sqlSession.getMapper(SeatMapper.class);
		
	}	
	
	

	    @Override
	    public List<SeatVo> getAllSeats(int flightId) {
	        return seatMapper.getAllSeats(flightId);
	    }

	    @Override
	    public List<String> getAvailableSeats(int flightId, String seatGrade) {
	        return seatMapper.getAvailableSeats(flightId, seatGrade);  // getAvailableSeatsByGrade -> getAvailableSeats
	    }

	    @Override
	    public boolean isSeatAvailable(int flightId, String seatNumber) {
	        return seatMapper.isSeatAvailable(flightId, seatNumber);  // 메서드 로직 변경
	    }

	    @Override
	    public SeatVo getSeatByNumber(int flightId, String seatNumber) {
	        return seatMapper.getSeatByNumber(flightId, seatNumber);
	    }

}
