<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>다이렉트 예약</title>
    <style>
        .flight-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 20px;
        }
        .price-info {
            font-size: 1.2rem;
            font-weight: bold;
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <%@ include file="/header/navbar.jsp" %>
    
    <div class="container mt-5">
        <!-- 검색 정보 요약 -->
        <div class="card mb-4">
            <div class="card-header">
                <h5 class="card-title mb-0">검색 조건</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">출발지: ${departure}</div>
                    <div class="col-md-3">도착지: ${arrival}</div>
                    <div class="col-md-3">출발일: ${departureDate}</div>
                    <div class="col-md-3">돌아오는 일: ${returnDate}</div>
                    <div class="col-md-3">탑승객: ${passengerCount}명</div>
                </div>
            </div>
        </div>
        
        <%-- <c:out value="디버그: flightList 크기 ${not empty flightList ? flightList.size() : '데이터 없음'}" /> --%>

			<div class="flight-list">
    <c:choose>
        <c:when test="${not empty flightList}">
            <c:forEach var="flight" items="${flightList}">
				    <div class="flight-card" data-flight-id="${flight.flight_id}">
				        <div class="row align-items-center">
				            <div class="col-md-2">
				                <h5>항공편</h5>
				                <p class="mb-0">${flight.flight_number}</p>
				            </div>
				            <div class="col-md-2">
				                <h5>출발/도착</h5>
				                <p class="mb-0">${flight.departure_time} / ${flight.arrival_time}</p>
				            </div>
				           <div class="col-md-2">
							    <h5>좌석</h5>
							    <p class="mb-0">잔여 ${flight.available_seats}석</p>
							</div>
							<div class="col-md-2">
							    <h5>가격</h5>
							    <p class="price-info">₩<fmt:formatNumber value="${flight.seat_price}" pattern="#,###" /></p>
							</div>
				            <div class="col-md-2">
				                <button class="btn btn-primary w-100" onclick="selectFlight(${flight.flight_id})">선택</button>
				            </div>
				        </div>
				    </div>
				 </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">
                검색 조건에 맞는 항공편이 없습니다.
            </div>
        </c:otherwise>
    </c:choose>
</div>
    
    <script>
    function selectFlight(flightId) {
        const url = '/booking/seat.aws?' + 
            'flightId=' + flightId + 
            '&passengerCount=${passengerCount}' +
            '&departure=${departure}' +
            '&arrival=${arrival}' +
            '&departureDate=${departureDate}' +
            '&selectedGrade=${selectedGrade}';
        
        window.location.href = url;
    }
    </script>
</body>
</html>