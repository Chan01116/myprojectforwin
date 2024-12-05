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
        Map<String, Object> params = new HashMap<>();
        params.put("departure", searchDTO.getDeparture());
        params.put("arrival", searchDTO.getArrival());
        params.put("departureDate", searchDTO.getDepartureDate());
        params.put("seatClass", searchDTO.getSeatClass());
        params.put("passengerCount", searchDTO.getPassengerCount());
        
        return fm.searchFlights(params);
    }
}