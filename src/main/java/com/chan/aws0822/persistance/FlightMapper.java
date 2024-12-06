package com.chan.aws0822.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.chan.aws0822.domain.FlightSearchDTO;
import com.chan.aws0822.domain.FlightVo;

public interface FlightMapper {
	 List<FlightVo> searchFlights(FlightSearchDTO searchDTO);
	 FlightVo getFlightById(@Param("flightId") int flightId);
	 boolean selectSeat(int flightId, String seatId, String grade);
	 int reserveSeat(@Param("flightId") int flightId, 
             @Param("seatId") String seatId, 
             @Param("grade") String grade);
	

}
