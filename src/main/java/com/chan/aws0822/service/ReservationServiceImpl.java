package com.chan.aws0822.service;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chan.aws0822.domain.ReservationVo;
import com.chan.aws0822.persistance.ReservationMapper;
@Service
public class ReservationServiceImpl implements ReservationService {


	    @Autowired
	    private SqlSession sqlSession;
	    private ReservationMapper reservationMapper;  // final·Î º¯°æ
    
	    @Autowired
	    public ReservationServiceImpl(SqlSession sqlSession) {
	        this.reservationMapper = sqlSession.getMapper(ReservationMapper.class);
	    }
   

	    @Override
	    public ReservationVo createReservation(ReservationVo reservation) {
	        reservation.setReservationDate(LocalDateTime.now());
	        reservation.setStatus("Confirmed");
	        return reservationMapper.createReservation(reservation);
	    }

	    @Override
	    public ReservationVo getReservation(int reservationId) {
	        return reservationMapper.getReservation(reservationId);  // getReservationById -> getReservation
	    }

	    @Override
	    public List<ReservationVo> getReservationsByMember(int midx) {
	        return reservationMapper.getReservationsByMember(midx);
	    }

	    @Override
	    public void updateReservationStatus(int reservationId, String status) {
	        reservationMapper.updateReservationStatus(reservationId, status);  // updateStatus -> updateReservationStatus
	    }

	    @Override
	    public void cancelReservation(int reservationId) {
	        reservationMapper.cancelReservation(reservationId);  // updateStatus -> cancelReservation
	    }



}
