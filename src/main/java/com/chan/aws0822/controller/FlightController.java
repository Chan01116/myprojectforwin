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
import org.springframework.web.bind.annotation.ResponseBody;

import com.chan.aws0822.domain.FlightSearchDTO;
import com.chan.aws0822.domain.FlightVo;
import com.chan.aws0822.domain.ReservationVo;
import com.chan.aws0822.service.FlightService;
import com.chan.aws0822.service.ReservationService;
import com.chan.aws0822.service.SeatService;

@Controller
@RequestMapping(value = "/booking/")
public class FlightController { 
	
	
	  @Autowired
	    private FlightService flightService;

	    @Autowired
	    private ReservationService reservationService;
	    
	    @Autowired
	    private SeatService seatService;
	
	@RequestMapping(value = "searchFlights.aws", method = {RequestMethod.GET, RequestMethod.POST})
	 public ResponseEntity<?> searchFlights(@RequestBody(required = false) FlightSearchDTO searchDTO, 
             HttpSession session, Model model) {
				if (session.getAttribute("login") == null) {
				// �α��� ������ ���� ��
				model.addAttribute("midx", null);
				model.addAttribute("memberName", null);
				model.addAttribute("memberId", null);
				model.addAttribute("admin", null);
				return ResponseEntity.ok().body("{\"redirect\":\"login\"}");
				}
				
				// �α��� ������ �𵨿� �߰�
				model.addAttribute("midx", session.getAttribute("midx"));
				model.addAttribute("memberName", session.getAttribute("memberName"));
				model.addAttribute("memberId", session.getAttribute("memberId"));
				model.addAttribute("admin", session.getAttribute("admin"));
				
				if (searchDTO == null) {  // GET ��û ó��
				return ResponseEntity.ok().build();
				}
				// POST ��û ó��
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
						
						
						
					/*
					 * @GetMapping("checkSeat.aws") public ResponseEntity<?>
					 * getAvailableSeats(@RequestParam int flightId) { return
					 * ResponseEntity.ok(seatService.getAvailableSeats(flightId)); }
					 */
						
						
						
						
						
						
						
						
						
						
						
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
						                        @RequestParam(value = "selectedGrade", required = false) String selectedGrade,
						                        Model model) {
						    
						    // ������ ����
						    departure = departure.replaceAll("[,\\s]", "");
						    arrival = arrival.replaceAll("[,\\s]", "");
						    departureDate = departureDate.replaceAll("[,\\s]", "");
						    passengerCount = passengerCount.replaceAll("[,\\s]", "");
						    
						   // System.out.println("�˻� ����: " + departure + ", " + arrival + ", " + departureDate);
						    
						    if (selectedGrade != null) {
						        selectedGrade = selectedGrade.replaceAll("[,\\s]", "");
						    }

						    int passengers = Integer.parseInt(passengerCount);
						    
						    FlightSearchDTO searchDTO = new FlightSearchDTO();
						    searchDTO.setDeparture(departure);
						    searchDTO.setArrival(arrival);
						    searchDTO.setDepartureDate(departureDate); // String���� ����
						    searchDTO.setPassengerCount(passengers);
						    //System.out.println("Controller���� selectedGrade ��: " + selectedGrade);
						    searchDTO.setSelectedGrade(selectedGrade != null ? selectedGrade : "E");
						    //System.out.println("DTO�� ������ selectedGrade ��: " + searchDTO.getSelectedGrade());
						    
						    List<FlightVo> flightList = flightService.searchFlights(searchDTO);
						    
						    // �𵨿� ������ �߰�
						    model.addAttribute("departure", departure);
						    model.addAttribute("arrival", arrival);
						    model.addAttribute("departureDate", departureDate);
						    model.addAttribute("passengerCount", passengers);
						    model.addAttribute("returnDate", returnDate != null ? returnDate : "");
						    model.addAttribute("flightList", flightList);
						    model.addAttribute("selectedGrade", selectedGrade);
						    //System.out.println("���õ� ���: " + searchDTO.getSelectedGrade());
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
						
						
						
						@RequestMapping(value = "selectSeat.aws", method = RequestMethod.POST)
						@ResponseBody
						public Map<String, Object> selectSeat(@RequestBody Map<String, Object> params) {
						    Map<String, Object> response = new HashMap<>();
						    try {
						        // �¼� ���� ���� ����
						        boolean success = flightService.selectSeat(
						            Integer.parseInt(params.get("flightId").toString()),
						            params.get("seatId").toString(),
						            params.get("grade").toString()
						        );
						        response.put("success", success);
						    } catch (Exception e) {
						        response.put("success", false);
						    }
						    return response;
						}
						
						
						
						
						
						
						
						@RequestMapping(value = "seat.aws", method = RequestMethod.GET)
						public String seat(@RequestParam("flightId") int flightId, Model model) {
						    FlightVo flight = flightService.getFlightById(flightId);
						    model.addAttribute("flight", flight);
						    System.out.println("fligth����? : "+ flight);
						    return "/booking/seat";
						}
						
						@PostMapping("completeReservation.aws")
						public String completeReservation(@RequestParam int flightId,
						                                  @RequestParam String Seat_number,
						                                  @RequestParam String selectedGrade,
						                                  HttpSession session,
						                                  Model model) {
						    Integer midx = (Integer) session.getAttribute("midx");
						    if (midx == null) {
						        return "redirect:/member/login.aws";
						    }

						    ReservationVo reservation = new ReservationVo();
						    reservation.setFlightId(flightId);
						    reservation.setMidx(midx);
						    reservation.setSeat_number(Seat_number);
						    reservation.setSeatGrade(selectedGrade);

						    reservationService.createReservation(reservation);

						    model.addAttribute("reservationDetails", reservation);
						    return "/booking/reservationConfirmation";
						}
						
						
					
					}
