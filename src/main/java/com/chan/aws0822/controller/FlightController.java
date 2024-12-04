package com.chan.aws0822.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chan.aws0822.service.FlightService;

@Controller
@RequestMapping(value = "/booking/")
public class FlightController {
	
	
	  
	
	
	
	@RequestMapping(value = "city.aws", method = RequestMethod.GET)
    public String ctiy() {
    	
        
        return "/booking/city";
    }
	
	
	
	@RequestMapping(value = "day.aws", method = RequestMethod.GET)
    public String day() {
    	
        
        return "/booking/day";
    }
    
	
	
	@RequestMapping(value = "dirbBooking.aws", method = RequestMethod.GET)
    public String dirBooking() {
    	
        
        return "/booking/dirBooking";
    }
	
	
	@RequestMapping(value = "flightSrc.aws", method = RequestMethod.GET)
    public String flightSrc() {
    	
        
        return "/booking/flightSrc";
    }
	
	
	@RequestMapping(value = "pay.aws", method = RequestMethod.GET)
    public String pay() {
    	
        
        return "/booking/pay";
    }
	
	
	@RequestMapping(value = "seat.aws", method = RequestMethod.GET)
    public String seat() {
    	
        
        return "/booking/seat";
    }
	
	

}
