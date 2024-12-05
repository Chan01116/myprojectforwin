package com.chan.aws0822.persistance;

import java.util.List;
import java.util.Map;

import com.chan.aws0822.domain.FlightSearchDTO;
import com.chan.aws0822.domain.FlightVo;

public interface FlightMapper {
	List<FlightVo> searchFlights(Map<String, Object> params);

}
