<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.chan.aws0822.domain.FlightVo" %>




<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>좌석 선택</title>

    <style>
        .seat-container {
            position: relative;
            width: 100%;
            max-width: 800px;
            height: auto;
            margin: 20px auto;
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .seat {
            width: 40px;
            height: 40px;
            margin: 5px;
            text-align: center;
            line-height: 40px;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        .economy { background-color: #28a745; color: white; }
        .business { background-color: #007bff; color: white; }
        .first { background-color: #dc3545; color: white; }
        .reserved { background-color: rgba(128, 128, 128, 0.5); cursor: not-allowed; }
        .selected { background-color: #ffc107; color: black; transform: scale(1.1); }
        
        .legend-item {
            display: inline-block;
            margin-right: 10px;
            font-size: 14px;
        }
        
        .legend-box {
            width: 20px;
            height: 20px;
            display: inline-block;
            margin-right: 5px;
        }

        .seat-row {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%@ include file="/header/navbar.jsp" %>

    <div class="container mt-5">
        <h2>항공편 좌석 선택</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>항공편 번호</th>
                    <th>출발 시간</th>
                    <th>도착 시간</th>
                    <th>항공기 종류</th>
                    <th>이코노미 좌석</th>
                    <th>비즈니스 좌석</th>
                    <th>퍼스트 클래스 좌석</th>
                    <th>사용 가능한 좌석</th>
                    <th>좌석 선택</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="flight" value="${flight}" />
                <tr>
                    <td>${flight.flight_number}</td>
                    <td>${flight.departure_time}</td>
                    <td>${flight.arrival_time}</td>
                    <td>${flight.aircraft_type}</td>
                    <td>${flight.economy_seats}</td>
                    <td>${flight.business_seats}</td>
                    <td>${flight.first_seats}</td>
                    <td>${flight.available_seats}</td>
                    <td>
                        <form action="reserveSeat" method="post">
                            <input type="hidden" name="flight_id" value="${flight.flight_id}">
                            <select name="seat_class" class="form-select">
                                <option value="economy">이코노미</option>
                                <option value="business">비즈니스</option>
                                <option value="first">퍼스트 클래스</option>
                            </select>
                            <button type="submit" class="btn btn-primary mt-2">선택하기</button>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- 좌석 선택 컨테이너 -->
        <div id="seat-selection" class="seat-container"></div>

        <!-- 선택된 좌석 표시 -->
        <div id="selected-seat-display">선택된 좌석 ID가 여기에 표시됩니다.</div>

    </div>

    <!-- JavaScript -->
    <script type="text/javascript">
        const selectedGrade = '${selectedGrade}';
        
        function generateSeats(grade) {
            const seats = [];
            const rows = grade === 'F' ? 2 : grade === 'B' ? 4 : 20; // 등급별 행 수
            const cols = grade === 'F' ? 4 : grade === 'B' ? 6 : 8; // 등급별 열 수

            // 좌석 정보 생성 (랜덤 예약 처리)
            for (let i = 0; i < rows; i++) {
                for (let j = 0; j < cols; j++) {
                    seats.push({
                        id: `${String.fromCharCode(65 + i)}${j + 1}`, // A1, B1, C1 같은 형식
                        seatClass: grade.toLowerCase(), // 클래스 (e.g., economy, business, first)
                        isReserved: Math.random() > 0.7, // 예약 여부 (랜덤으로 설정)
                    });
                }
            }
            return seats;
        }

        function renderSeatSelection() {
            const container = document.getElementById('seat-selection');
            
            if (!container) return;

            const seats = generateSeats(selectedGrade); // 좌석 데이터 생성
            container.innerHTML = ''; // 기존 좌석 초기화

            // 좌석을 HTML 요소로 생성 후, 페이지에 추가
            seats.forEach((seat) => {
                const seatElement = createSeatElement(seat); // 각 좌석 요소 생성
                container.appendChild(seatElement);
            });
        }

        function createSeatElement(seat) {
            const seatDiv = document.createElement('div');
            
            seatDiv.className = `seat ${seat.seatClass} ${seat.isReserved ? 'reserved' : ''}`; // 예약된 좌석은 reserved 클래스 추가
            seatDiv.textContent = seat.id; // 좌석 ID 표시 (예: A1, B2)
            
            seatDiv.dataset.id = seat.id; // 데이터 속성에 좌석 ID 저장

            // 예약되지 않은 좌석 클릭 시 선택할 수 있게 처리
            if (!seat.isReserved) {
                seatDiv.onclick = () => selectSeat(seat.id);
                seatDiv.style.cursor = 'pointer';
                seatDiv.title = '이 좌석을 선택하려면 클릭하세요';
                
                if (!document.getElementById('selected-seat-display')) return;

                document.getElementById('selected-seat-display').textContent = `선택된 좌석 ID가 여기에 표시됩니다.`;
                
                function selectSeat(seatId) {
                    const previousSelected = document.querySelector('.seat.selected');
                    
                    if (previousSelected) previousSelected.classList.remove('selected'); // 이전 선택된 좌석 해제
                    
                    const selectedSeat = document.querySelector(`.seat[data-id='${seatId}']`);
                    
                    if (!selectedSeat) return;

                    selectedSeat.classList.add('selected'); // 새로 선택된 좌석에 selected 클래스 추가
                    
                    document.getElementById('selected-seat-display').textContent = `선택된 좌석 ID는 ${seatId}입니다.`; // 선택한 좌석 ID 표시
                }
                
                window.onload = renderSeatSelection;

                function confirmSeatSelection() {
                    alert('좌석 선택이 완료되었습니다!');
                    
                    // 추가 작업을 여기에 작성 (예: 서버로 선택 정보 전송)
                }
                
                window.onload = renderSeatSelection;

                function confirmSeatSelection() {
                    alert('좌석 선택이 완료되었습니다!');
                }
                    
                    // 추가 작업을 여기에 작성 (예:
