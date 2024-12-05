package com.chan.aws0822.service;

import java.util.List;

import com.chan.aws0822.domain.FlightSearchDTO;
import com.chan.aws0822.domain.FlightVo;

public interface FlightService {
	 
	List<FlightVo> searchFlights(FlightSearchDTO searchDTO);

}
