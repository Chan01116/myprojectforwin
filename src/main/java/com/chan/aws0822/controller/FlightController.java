package com.chan.aws0822.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chan.aws0822.domain.FlightSearchDTO;
import com.chan.aws0822.domain.FlightVo;
import com.chan.aws0822.domain.ReservationVo;
import com.chan.aws0822.service.FlightService;

@Controller
@RequestMapping(value = "/booking/")
public class FlightController { 
	
	
	@Autowired
    private FlightService flightService;
		
	
	@RequestMapping(value = "searchFlights.aws", method = {RequestMethod.GET, RequestMethod.POST})
	 public ResponseEntity<?> searchFlights(@RequestBody(required = false) FlightSearchDTO searchDTO, 
             HttpSession session, Model model) {
				if (session.getAttribute("login") == null) {
				// 로그인 정보가 없을 때
				model.addAttribute("midx", null);
				model.addAttribute("memberName", null);
				model.addAttribute("memberId", null);
				model.addAttribute("admin", null);
				return ResponseEntity.ok().body("{\"redirect\":\"login\"}");
				}
				
				// 로그인 정보를 모델에 추가
				model.addAttribute("midx", session.getAttribute("midx"));
				model.addAttribute("memberName", session.getAttribute("memberName"));
				model.addAttribute("memberId", session.getAttribute("memberId"));
				model.addAttribute("admin", session.getAttribute("admin"));
				
				if (searchDTO == null) {  // GET 요청 처리
				return ResponseEntity.ok().build();
				}
				// POST 요청 처리
				List<FlightVo> flights = flightService.searchFlights(searchDTO);
				return ResponseEntity.ok(flights);
				}
	
	
	
				@GetMapping("searchFlights.aws")
				   public ResponseEntity<?> checkLoginStatus(HttpSession session) {
				      if (session.getAttribute("login") == null) {
				          return ResponseEntity.ok().body("{\"redirect\":\"login\"}");
				       }
				       return ResponseEntity.ok().build();
				   }
						
						
						
				@PostMapping("reservation.aws")
				public ResponseEntity<?> makeReservation(@RequestBody ReservationVo reservationVo) {
				    return ResponseEntity.ok(reservationService.createReservation(reservationVo));
					}
						
						
						
						@GetMapping("checkSeat.aws")
						public ResponseEntity<?> getAvailableSeats(@RequestParam int flightId) {
						    return ResponseEntity.ok(seatService.getAvailableSeats(flightId));
						}
						
						
						
						
						
						
						
						
						
						
						
						
						@RequestMapping(value = "city.aws", method = RequestMethod.GET)
					    public String ctiy() {
					    	
					        
					        return "/booking/city";
					    }
						
						
						
						@RequestMapping(value = "day.aws", method = RequestMethod.GET)
					    public String day() {
					    	
					        
					        return "/booking/day";
					    }
					    
						
						
						@RequestMapping(value = "dirBooking.aws", method = RequestMethod.POST)
						public String dirBooking(@RequestParam String departure,
						                        @RequestParam String arrival,
						                        @RequestParam String departureDate,
						                        @RequestParam String passengerCount,
						                        @RequestParam(required = false) String returnDate,
						                        Model model) {
							 departure = departure.replace(",", "").trim();
							    arrival = arrival.replace(",", "").trim();
							    departureDate = departureDate.replace(",", "").trim();
							    passengerCount = passengerCount.replace(",", "").trim();
							    if (returnDate != null) {
							        returnDate = returnDate.replace(",", "").trim();
							    }
							
							
						    
						    int passengers = Integer.parseInt(passengerCount.replace(",", ""));
						    
						    // 날짜 문자열에서 쉼표 제거 및 시간 추가
						    String cleanDate = departureDate.replace(",", "") + " 00:00:00";
						    
						    FlightSearchDTO searchDTO = new FlightSearchDTO();
						    searchDTO.setDeparture(departure);
						    searchDTO.setArrival(arrival);
						    searchDTO.setDepartureDate(LocalDateTime.parse(cleanDate, 
						        DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
						    searchDTO.setPassengerCount(passengers);
						    
						    List<FlightVo> flightList = flightService.searchFlights(searchDTO);
						    
						    model.addAttribute("departure", departure);
						    model.addAttribute("arrival", arrival);
						    model.addAttribute("departureDate", departureDate);
						    model.addAttribute("passengerCount", passengers);
						    model.addAttribute("returnDate", returnDate != null ? returnDate : "");
						    model.addAttribute("flightList", flightList);
						    
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
