<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>좌석선택</title>
    <style>
        .seat-container {
            position: relative;
            width: 800px;
            height: 600px;
            margin: 20px auto;
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
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
            transition: all 0.3s ease;
        }
        .economy {
            background-color: #28a745;
            color: white;
        }
        .business {
            background-color: #007bff;
            color: white;
        }
        .first {
            background-color: #dc3545;
            color: white;
        }
        .reserved {
            background-color: rgba(128, 128, 128, 0.5);
            cursor: not-allowed;
        }
        .selected {
            background-color: #ffc107;
            color: black;
            transform: scale(1.1);
        }
        .emergency-exit {
            background-color: #ff9800;
            height: 20px;
            width: 100%;
            margin: 15px 0;
            text-align: center;
            color: white;
            line-height: 20px;
            font-size: 12px;
        }
        .seat-row {
            display: flex;
            justify-content: center;
            margin: 5px 0;
        }
        .seat-legend {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            gap: 20px;
        }
        .legend-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .legend-box {
            width: 20px;
            height: 20px;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <%@ include file="/header/navbar.jsp" %>
    
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2 class="mb-0">좌석 선택 (${selectedGrade})</h2>
                    </div>
                    <div class="card-body">
                        <div class="seat-legend">
                            <div class="legend-item">
                                <div class="legend-box economy"></div>
                                <span>이코노미</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box business"></div>
                                <span>비즈니스</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box first"></div>
                                <span>퍼스트</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box reserved"></div>
                                <span>예약됨</span>
                            </div>
                        </div>
                        <div class="seat-container" id="seat-selection"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">선택한 좌석 정보</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <h6>항공편 정보</h6>
                            <p class="mb-1">항공편: ${flight.flight_number}</p>
                            <p class="mb-1">출발: ${flight.departure_time}</p>
                            <p class="mb-1">도착: ${flight.arrival_time}</p>
                        </div>
                        <div class="mb-3">
                            <h6>좌석 정보</h6>
                            <p class="mb-1">좌석 등급: ${selectedGrade}</p>
                            <p class="mb-1">잔여 좌석: ${flight.available_seats}석</p>
                            <p class="mb-1">선택한 좌석: <span id="selected-seat" class="fw-bold">-</span></p>
                        </div>
                        <button class="btn btn-primary w-100" onclick="confirmSeatSelection()">좌석 선택 완료</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function generateSeats(grade) {
            const seats = [];
            const rows = grade === 'F' ? 2 : (grade === 'B' ? 4 : 20);
            const cols = grade === 'F' ? 4 : (grade === 'B' ? 6 : 8);
            
            for (let i = 0; i < rows; i++) {
                for (let j = 0; j < cols; j++) {
                    const seatId = String.fromCharCode(65 + i) + (j + 1);
                    seats.push({
                        id: seatId,
                        seatClass: grade.toLowerCase(),
                        x: j * 50,
                        y: i * 50
                    });
                }
            }
            return seats;
        }

        function renderSeatSelection() {
            const container = document.getElementById('seat-selection');
            const seats = generateSeats(selectedGrade);
            container.innerHTML = '';
            
            let currentRow;
            seats.forEach((seat, index) => {
                if (index % (selectedGrade === 'F' ? 4 : (selectedGrade === 'B' ? 6 : 8)) === 0) {
                    currentRow = document.createElement('div');
                    currentRow.className = 'seat-row';
                    container.appendChild(currentRow);
                }
                const seatElement = createSeatElement(seat);
                currentRow.appendChild(seatElement);
                
                // 통로 추가
                if ((index + 1) % (selectedGrade === 'F' ? 2 : 3) === 0 && 
                    (index + 1) % (selectedGrade === 'F' ? 4 : (selectedGrade === 'B' ? 6 : 8)) !== 0) {
                    const aisle = document.createElement('div');
                    aisle.style.width = '20px';
                    currentRow.appendChild(aisle);
                }
            });
        }

        // 나머지 JavaScript 코드는 동일
    </script>
</body>
</html>