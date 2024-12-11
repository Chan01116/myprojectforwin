<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.chan.aws0822.domain.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>좌석선택</title>
    
    <%
    FlightVo flightVo = new FlightVo();
    String selectedGrade = "B"; // 또는 다른 값 (F, B, E 등)
    request.setAttribute("selectedGrade", selectedGrade);
    request.setAttribute("flight", flightVo);
    %>
    
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
        <h2>Flight Seat Selection</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Flight Number</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Aircraft</th>
                    <th>Economy Seats</th>
                    <th>Business Seats</th>
                    <th>First Class Seats</th>
                    <th>Available Seats</th>
                    <th>Select Seat</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${flights}">
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
                                    <option value="economy">Economy</option>
                                    <option value="business">Business</option>
                                    <option value="first">First Class</option>
                                </select>
                                <button type="submit" class="btn btn-primary mt-2">Select</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>


    <!-- JavaScript -->
    <script>
        const selectedGrade = '${selectedGrade}';
        const flight = {
            flight_id: '${flight.flight_id}',
            flight_number: '${flight.flight_number}',
            departure_time: '${flight.departure_time}',
            arrival_time: '${flight.arrival_time}',
            available_seats: ${flight.available_seats}
        };

        function generateSeats(grade) {
            const seats = [];
            const rows = grade === 'F' ? 2 : grade === 'B' ? 4 : 20; // 등급별 행 수
            const cols = grade === 'F' ? 4 : grade === 'B' ? 6 : 8; // 등급별 열 수

            // 좌석 정보 생성 (랜덤 예약 처리)
            for (let i = 0; i < rows; i++) {
                for (let j = 0; j < cols; j++) {
                    seats.push({
                        id: `${String.fromCharCode(65 + i)}${j + 1}`,  // A1, B1, C1 같은 형식
                        seatClass: grade.toLowerCase(),  // 클래스 (e.g., economy, business, first)
                        isReserved: Math.random() > 0.7,  // 예약 여부 (랜덤으로 설정)
                    });
                }
            }
            return seats;
        }

        function renderSeatSelection() {
            const container = document.getElementById('seat-selection');
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
            seatDiv.className = `seat ${seat.seatClass} ${seat.isReserved ? 'reserved' : ''}`;  // 예약된 좌석은 reserved 클래스 추가
            seatDiv.textContent = seat.id;  // 좌석 ID 표시 (예: A1, B2)
            seatDiv.dataset.id = seat.id;  // 데이터 속성에 좌석 ID 저장

            // 예약되지 않은 좌석 클릭 시 선택할 수 있게 처리
            if (!seat.isReserved) {
                seatDiv.onclick = () => selectSeat(seat.id);
            }

            return seatDiv;
        }

        function selectSeat(seatId) {
            const previousSelected = document.querySelector('.seat.selected');
            if (previousSelected) previousSelected.classList.remove('selected');  // 이전 선택된 좌석 해제
            
            const selectedSeat = document.querySelector(`.seat[data-id='${seatId}']`);
            selectedSeat.classList.add('selected');  // 새로 선택된 좌석에 selected 클래스 추가
            document.getElementById('selected-seat').textContent = seatId;  // 선택한 좌석 ID 표시
        }

        function confirmSeatSelection() {
            alert('좌석 선택이 완료되었습니다!');
            // 추가 작업을 여기에 작성 (예: 서버로 선택 정보 전송)
        }

        // 페이지가 로드되면 좌석을 렌더링
        window.onload = renderSeatSelection;
    </script>
</body>
</html>
