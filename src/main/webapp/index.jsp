<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 항상 맨위에 있어야 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
  .nav-tabs .nav-link {
    padding: 15px 30px;
  }

  .tabs-overlay {
    position: absolute;
    top: 25%; /* 이미지 위 가운데 세로 위치 */
    left: 50%; /* 이미지 위 가운데 가로 위치 */
    transform: translate(-50%, -50%); /* 가운데 정렬을 위한 추가 코드 */
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 10px;
    width: 60%;  
    max-width: 1500px;
    
}
.form-control{
width: 100%;

}
  .tab-content {
    margin-top: 10px;
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 10px;
  }

  body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    position: relative; /* 부모 요소에 상대 위치 설정 */
    min-height: 100vh; /* 최소 높이 설정 */
  }
  
    .schedule-form {
    max-width: 800px;
    margin: auto;
  }
  .bg-light {
    background-color: #f8f9fa !important;
  }
  .booking-form {
    max-width: 800px;
    margin: auto;
  }
  .bi-arrow-left-right {
    font-size: 24px;
  }
  .shadow {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) !important;
  }
  
  
  .promo-img {
   
    top: 50%; /* 수직 중앙 정렬 */
    left: 50%; /* 수평 중앙 정렬 */
    
}
</style>
  
</head>

<body>

<%@ include file="/header/navbar.jsp" %>


<div class="container mt-1 position-relative"> <!-- 컨텐츠에 여백 추가 -->
  <img src="https://www.rosenaviation.com/wp-content/uploads/2024/02/Longest-commercial-flights-Rosen-Aviation-scaled.jpeg" class="img-fluid mt-1" alt="">
  
   <form name="frm" method="post" action="/booking/dirBooking.aws" class="tabs-overlay">
    <input type="hidden" name="departure" id="departure_hidden">
    <input type="hidden" name="arrival" id="arrival_hidden">
    <input type="hidden" name="departureDate" id="departureDate_hidden">
    <input type="hidden" name="selectedGrade" id="selectedGrade_hidden">  <!-- 이미 있음 -->
        
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">바로검색</button>
        
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">예약조회</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">셀프체크인</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="schedule-tab" data-bs-toggle="tab" data-bs-target="#schedule-tab-pane" type="button" role="tab" aria-controls="schedule-tab-pane" aria-selected="false">비행 시간표 조회</button>
      </li>
    </ul>
    
    
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab">
       <div class="container mt-5">
  <div class="booking-form bg-light p-4 rounded shadow">
    <div class="form-header d-flex justify-content-between align-items-center mb-3">
      
     
    </div>

    <div class="form-content">
      <div class="row mb-3">
        <div class="col-md-5">
          <label class="form-label">출발지</label>
          <div class="input-group">
            <select class="form-select" id="departure" name="departure" onchange="updateArrivalOptions()">
          <option value="">출발지 선택</option>
            <option value="ICN">인천국제공항 (ICN)</option>
            <option value="GMP">김포국제공항 (GMP)</option>
             <option value="NRT">도쿄 나리타국제공항 (NRT)</option>
            <option value="HND">도쿄 하네다국제공항 (HND)</option>
            <option value="LAX">로스앤젤레스국제공항 (LAX)</option>
            <option value="JFK">뉴욕 JFK국제공항 (JFK)</option>
            <option value="CDG">파리 샤를드골국제공항 (CDG)</option>            
           </select>
          </div>
        </div>

        <div class="col-md-2 text-center align-self-center">
          <i class="bi bi-arrow-left-right"></i>
        </div>

        <div class="col-md-5">
          <label class='form-label'>도착지</label>
         <select class="form-select" id="arrival"name="arrival">
            <option value="">도착지 선택</option> 
            <option value="ICN">인천국제공항 (ICN)</option>
            <option value="GMP">김포국제공항 (GMP)</option>
            <option value="NRT">도쿄 나리타국제공항 (NRT)</option>
            <option value="HND">도쿄 하네다국제공항 (HND)</option>
            <option value="LAX">로스앤젤레스국제공항 (LAX)</option>
            <option value="JFK">뉴욕 JFK국제공항 (JFK)</option>
            <option value="CDG">파리 샤를드골국제공항 (CDG)</option>
        </select>
        </div>
      </div>

      <div class="row mb-3">
        <div class="col-md-6">
        <div class="row mb-3">
  <div class="col-md-3">
    <label class="form-label">출발일</label>
    <input type="date" id="departureDate" class="form-control" placeholder="가는 날"name="departureDate">
  </div>
  <div class="col-md-3">
    <label class="form-label">돌아오는 일</label>
    <input type="date" id="returnDate" class="form-control" placeholder="오는 날" name="returnDate"disabled>
  </div>
  
</div>
        </div>
		<div class="col-md-3">
		  <label class="form-label">탑승객</label>
		  <div class="input-group">
		    <button type="button" class="btn btn-outline-secondary" onclick="decreasePassenger()">-</button>
		    <input type="text" id="passengerCount" name="passengerCount" class="form-control text-center" value="1" min="1" max="9" readonly>
		    <button type="button" class="btn btn-outline-secondary" onclick="increasePassenger()">+</button>
		  </div>
		</div>


						<div class="col-md-3">
						    <label class="form-label">좌석 등급</label>
						    <select class="form-select" name="selectedGrade">
						        <option value="E">이코노미</option>
						        <option value="B">비즈니스</option>
						        <option value="F">퍼스트</option>
						    </select>
						</div>

      </div>

     

     <div class="d-grid gap-2 mt-4">
         <button class="btn btn-dark" id="searchFlightBtn">항공편 검색</button>
      </div>
    </div>
  </div>
</div>

      </div>
      <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab">
      <div class='container mt-5'>
  <div class='booking-form bg-light p-4 rounded shadow'>
    <div class='form-header d-flex justify-content-between align-items-center mb-3'>
      
    </div>

    <div class='form-content'>
      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>예약번호또는 항공권번호</label>
          <input type='text' class='form-control' placeholder='A1B2C3 또는 1801234567890'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>출발일</label>
          <input type="date" class='form-control' placeholder='YYYY-MM-DD' name ='indexTakeOffDay'>
        </div>
      </div>

      <div class='row mb-3'>
        <div class='col-md-5'>
        
        </div>

        <div class='col-md-5'>
          <label class='form-label'>승객 이름</label>
          <input type='text' class='form-control'>
        </div>
      </div>


      <div class='d-grid gap-2 mt-4'>
        <button class='btn btn-dark'>조회</button>
      </div>
    </div>
  </div>
</div>


 
      </div>
      <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab">
       <div class='container mt-5'>
  <div class='booking-form bg-light p-4 rounded shadow'>
    <div class='form-header d-flex justify-content-between align-items-center mb-3'>
      
    </div>

    <div class='form-content'>
      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>예약번호또는 항공권번호</label>
          <input type='text' class='form-control' placeholder='A1B2C3 또는 1801234567890'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>출발일 - d-day-4</label>
          <input type='date' class='form-control' placeholder='YYYY-MM-DD'>
        </div>
      </div>

      <div class='row mb-3'>
        <div class='col-md-5'>
        
        </div>

        <div class='col-md-5'>
          <label class='form-label'>승객 이름</label>
          <input type='text' class='form-control'>
        </div>
      </div>


      <div class='d-grid gap-2 mt-4'>
        <button class='btn btn-dark'>조회</button>
      </div>
    </div>
  </div>
</div>

<style>
  .booking-form {
    max-width: 800px;
    margin: auto;
  }
  .bg-light {
    background-color: #f8f9fa !important;
  }
  .shadow {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) !important;
  }
</style>
      </div>
      <div class="tab-pane fade" id="schedule-tab-pane" role="tabpanel" aria-labelledby="schedule-tab">
       <div class='container mt-5'>
  <div class='schedule-form bg-light p-4 rounded shadow'>
    <div class='form-header d-flex justify-content-between align-items-center mb-3'>
      

    <div class='form-content'>
      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>출발지</label>
           <select class="form-select" id="departure">
          <option value="">출발지 선택</option>
            <option value="ICN">인천국제공항 (ICN)</option>
            <option value="GMP">김포국제공항 (GMP)</option>
             <option value="NRT">도쿄 나리타국제공항 (NRT)</option>
            <option value="HND">도쿄 하네다국제공항 (HND)</option>
            <option value="LAX">로스앤젤레스국제공항 (LAX)</option>
            <option value="JFK">뉴욕 JFK국제공항 (JFK)</option>
            <option value="CDG">파리 샤를드골국제공항 (CDG)</option>            
           </select>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>도착지</label>
         <select class="form-select" id="arrival">
            <option value="">도착지 선택</option> 
            <option value="ICN">인천국제공항 (ICN)</option>
            <option value="GMP">김포국제공항 (GMP)</option>
            <option value="NRT">도쿄 나리타국제공항 (NRT)</option>
            <option value="HND">도쿄 하네다국제공항 (HND)</option>
            <option value="LAX">로스앤젤레스국제공항 (LAX)</option>
            <option value="JFK">뉴욕 JFK국제공항 (JFK)</option>
            <option value="CDG">파리 샤를드골국제공항 (CDG)</option>
        </select>
        </div>
      </div>

      <div class='row mb-3'>
        <div class='col-md-5'>
          <label class='form-label'>출발일</label>
          <input type='date' class='form-control' placeholder='YYYY-MM-DD'>
        </div>

        <div class='col-md-5'>
          <label class='form-label'>돌아오는 일</label>
          <input type='date' class='form-control' placeholder='YYYY-MM-DD'>
        </div>
      </div>

      <div class='d-grid gap-2 mt-4'>
        <button class='btn btn-dark'>조회</button>
      </div>
    </div>
  </div>
</div>



      </div>
    </div>
    
  </div>

</form>
 <!-- 프로모션 링크 -->
  <div class="promo-img">
    <a href="http://localhost/board/noticeContents.aws?nidx=9"><img src="https://vrthumb.imagetoday.co.kr/2024/07/18/tae0019t000021.jpg" alt="프로모션1" /></a>
</div>

  <div class="promo-img">
    <a href="http://localhost/board/noticeContents.aws?nidx=8"><img src="https://img.freepik.com/free-vector/hand-drawn-travel-adventure-facebook-cover_23-2150877996.jpg" alt="프로모션2" /></a>
  </div>

  <!-- 하단 저작권 -->
  <footer class="copyright">Copyright &copy; Chan</footer>
  
  <script>
  function increasePassenger() {
    var input = document.getElementById('passengerCount');
    var currentValue = parseInt(input.value);
    if (currentValue < 9) {
      input.value = currentValue + 1;
    }
  }

  function decreasePassenger() {
    var input = document.getElementById('passengerCount');
    var currentValue = parseInt(input.value);
    if (currentValue > 1) {
      input.value = currentValue - 1;
    }
  }
  
  
  
  function searchFlight(event) {
	    event.preventDefault();
	    const form = document.frm;
	    const departure = document.getElementById('departure').value;
	    const arrival = document.getElementById('arrival').value;
	    const departureDate = document.getElementById('departureDate').value;
	    const returnDate = document.getElementById('returnDate').value;
	    const passengerCount = document.getElementById('passengerCount').value;
	    const selectedGrade = document.querySelector('select[name="selectedGrade"]').value;
	    // 유효성 검사
	    if (!departure) {
	        alert('출발지를 선택해주세요.');
	        document.getElementById('departure').focus();
	        return false;
	    }
	    
	    if (!arrival) {
	        alert('도착지를 선택해주세요.');
	        document.getElementById('arrival').focus();
	        return false;
	    }
	    
	    if (!departureDate) {
	        alert('출발일을 선택해주세요.');
	        document.getElementById('departureDate').focus();
	        return false;
	    }
	    if (!returnDate) {
	        alert('돌아오는 일을 선택해주세요.');
	        document.getElementById('return').focus();
	        return false;
	    }
	    if (!passengerCount) {
	        alert('탑승객 수를 선택해주세요.');
	        document.getElementById('passengerCount').focus();
	        return false;
	    }
	    
	    // 모든 검증이 통과되면 폼 제출
	    form.departure.value = departure;
	    form.arrival.value = arrival;
	    form.departureDate.value = departureDate;
	    form.returnDate.value = returnDate;
	    form.passengerCount.value = passengerCount;
	    form.selectedGrade.value = selectedGrade;  // 이 부분이 중요

	    form.submit();
	}

	// 이벤트 리스너 수정
	document.getElementById('searchFlightBtn').addEventListener('click', searchFlight);
  	
	   <%--  $.ajax({ 
            type: "post", //전송방식
            url: "<%=request.getContextPath()%>/booking/dirBooking.aws", 
            dataType: "json", // json타입은 문서에서 {"키값": "value값","키갑2": "value값2"} 
            data: { "departure": departure, 
            	"arrival": arrival, 
            	"departureDate": departureDate, 
            	"passengerCount": passengerCount, 
            	"seatClass": seatClass,
            	"returnDate": returnDate }, 
            success: function(result) { // 결과가 넘어와서 성공했을 때 받는 영역
                alert("성공"); 
            }, 
            error: function() { // 결과가 실패했을 때 받는 영역
                alert("전송실패 테스트"); 
            } 
        });  --%>
	    
	    
	    /* fetch('/booking/searchFlights.aws', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	            'Accept': 'application/json'  // 추가: JSON 응답 요청
	        },
	        body: JSON.stringify({
	            departure,
	            arrival,
	            departureDate,
	            passengerCount,
	            seatClass
	        })
	    })
	    .then(response => {
	        // 응답 타입 체크
	        const contentType = response.headers.get('content-type');
	        if (contentType && contentType.includes('application/json')) {
	            return response.json();
	        }
	        // JSON이 아닌 경우 로그인 페이지로 리다이렉트
	        window.location.href = '/member/memberLogin.aws';
	        throw new Error('Not JSON');
	    })
	    .then(data => {
	        if (data.redirect === 'login') {
	            window.location.href = '/member/memberLogin.aws';
	        } else {
	            window.location.href = '/booking/dirBooking.aws';
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        // 에러 발생 시 로그인 페이지로 이동
	        window.location.href = '/member/memberLogin.aws';
	    }); */

	// 이벤트 리스너 추가
	/* document.getElementById('searchFlightBtn').addEventListener('click', searchFlight); */
	
	
	
	
	
  
	 function updateArrivalOptions() {
		    const departure = document.getElementById("departure").value;
		    const arrival = document.getElementById("arrival");
		    const arrivalOptions = arrival.querySelectorAll("option");

		    // 모든 도착지 옵션을 기본값으로 표시
		    arrivalOptions.forEach(option => {
		      option.disabled = false;
		    });

		    // 출발지가 ICN이면 도착지에서 GMP를 비활성화
		    if (departure === "ICN") {
		      arrival.querySelector("option[value='GMP']").disabled = true;
		    }

		    // 출발지가 GMP이면 도착지에서 ICN을 비활성화
		    if (departure === "GMP") {
		      arrival.querySelector("option[value='ICN']").disabled = true;
		    }
		    // 이런식으로 없는 항공편 비활성화 시킬수 있음
		    if (departure === "NRT") {
			      arrival.querySelector("option[value='HND']").disabled = true;
			    }
		    if (departure === "HND") {
			      arrival.querySelector("option[value='NRT']").disabled = true;
			    }
		    if (departure === "ICN") {
		        arrival.querySelector("option[value='ICN']").disabled = true;
		    }
		    if (departure === "GMP") {
		        arrival.querySelector("option[value='GMP']").disabled = true;
		    }
		    if (departure === "NRT") {
		        arrival.querySelector("option[value='NRT']").disabled = true;
		    }
		    if (departure === "HND") {
		        arrival.querySelector("option[value='HND']").disabled = true;
		    }
		    if (departure === "LAX") {
		        arrival.querySelector("option[value='LAX']").disabled = true;
		    }
		    if (departure === "JFK") {
		        arrival.querySelector("option[value='JFK']").disabled = true;
		    }
		    if (departure === "CDG") {
		        arrival.querySelector("option[value='CDG']").disabled = true;
		    }
		  }

		  // 초기화 시에도 출발지에 대한 도착지 옵션을 확인
		  
		  window.onload = updateArrivalOptions;
		  
		  
		  
		  
		  
		  document.addEventListener('DOMContentLoaded', function() {
			  const departureDateInput = document.getElementById('departureDate');
			  const returnDateInput = document.getElementById('returnDate');

			  departureDateInput.addEventListener('change', function() {
			    returnDateInput.disabled = false;
			    returnDateInput.min = this.value;
			  });

			  // 오늘 날짜 이후로만 선택 가능하도록 설정
			  const today = new Date().toISOString().split('T')[0];
			  departureDateInput.min = today;
			});
  
</script>
  

</body>
</html>