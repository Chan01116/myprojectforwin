package com.chan.aws0822.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chan.aws0822.domain.FlightSearchDTO;
import com.chan.aws0822.domain.FlightVo;
import com.chan.aws0822.persistance.FlightMapper;


@Service  // 추가 필요
public class FlightServiceImpl implements FlightService {
    @Autowired
    private SqlSession sqlSession;
    private final FlightMapper fm;  // final로 변경
    
    @Autowired
    public FlightServiceImpl(SqlSession sqlSession) {
        this.fm = sqlSession.getMapper(FlightMapper.class);
    }
   
    
    @Override
    public List<FlightVo> searchFlights(FlightSearchDTO searchDTO) {
    	 if (searchDTO == null) {
             searchDTO = new FlightSearchDTO();
             // Map에서 필요한 데이터 설정
         }
        Map<String, Object> params = new HashMap<>();
        params.put("departure", searchDTO.getDeparture());
        params.put("arrival", searchDTO.getArrival());
        params.put("departureDate", searchDTO.getDepartureDate());
        params.put("seatClass", searchDTO.getSeatClass());
        params.put("passengerCount", searchDTO.getPassengerCount());
        
        return fm.searchFlights(searchDTO);
    }


	@Override
	public FlightVo getFlightById(int flightId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	 @Override
	    public boolean selectSeat(int flightId, String seatId, String grade) {
	        try {
	            // 좌석 유효성 검사
	            FlightVo flight = fm.getFlightById(flightId);
	            if (flight == null) {
	                return false;
	            }

	            // 좌석 등급 확인
	            int availableSeats = 0;
	            switch(grade) {
	                case "E":
	                    availableSeats = flight.getEconomy_seats();
	                    break;
	                case "B":
	                    availableSeats = flight.getBusiness_seats();
	                    break;
	                case "F":
	                    availableSeats = flight.getFirst_seats();
	                    break;
	                default:
	                    return false;
	            }

	            // 잔여 좌석 확인
	            if (availableSeats <= 0) {
	                return false;
	            }

	            // 좌석 예약 처리
	            return fm.reserveSeat(flightId, seatId, grade) > 0;
	            
	        } catch (Exception e) {
	            return false;
	        }
	    }
	
	
	

	
}