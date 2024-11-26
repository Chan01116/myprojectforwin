<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 항상 맨위에 있어야 함 -->
<!DOCTYPE html>
<html>
<head>
  <title>메인 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
 .nav-tabs .nav-link {
    padding: 15px 30px; /* 탭의 크기 증가 */
}

.tabs-overlay {
    position: absolute;
    top: 50%; /* 세로 가운데 배치 */
    left: 50%; /* 가로 가운데 배치 */
    transform: translate(-50%, -50%); /* 가운데 정렬 */
    background-color: rgba(255, 255, 255, 0.8); /* 반투명 배경 색상 */
    border-radius: 10px; /* 탭의 모서리 둥글게 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
}

.tab-content {
    position: absolute;
    top: calc(50% + 50px); /* 세로 가운데 배치 */
    left: 50%; /* 가로 가운데 배치 */
    transform: translate(-50%, -90%); /* 가운데 정렬 */
    background-color: rgba(255, 255, 255, 0.8); /* 반투명 배경 색상 */
    border-radius: 10px; /* 탭의 모서리 둥글게 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
}

.search-bar {
    margin-bottom: 20px;
}

body {
    background-color: #f8f9fa; /* 부드러운 배경색 */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* 폰트 스타일 */
}

#navbar {
    background-color: #007bff; /* 네비게이션 바 배경색 */
    top: calc(50% + 56px);
    left: 50%;
    padding: 10px;
    display: flex;
    justify-content: space-between;
}

btn btn-info {
    color: white; /* 링크 텍스트 색상 */
    margin-right: 15px; /* 오른쪽 여백 */
}

.login {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 10;
}
  </style>
</head>

<body>
  <!-- 로그인 버튼 -->
  <div class="login">
    <button type="button" class="btn btn-info">로그인</button>
  </div>

  <!-- 검색창 및 탭 -->
  <div class="container position-relative">
    <div class="search-bar">
      <input type="text" placeholder="검색어를 입력하세요" />
    </div>
    <img src="https://www.rosenaviation.com/wp-content/uploads/2024/02/Longest-commercial-flights-Rosen-Aviation-scaled.jpeg" class="img-fluid" alt="">
    <div class="tabs-overlay">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">바로예매</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">예약조회</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">셀프체크인</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="schedule-tab" data-bs-toggle="tab" data-bs-target="#schedule-tab-pane" type="button" role="tab" aria-controls="schedule-tab-pane" aria-selected="false">비행 시간표</button>
        </li>
      </ul>
    </div>
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
        바로예약 넣기
      </div>
      <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
        예약조회 넣기  
      </div>
      <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
        셀프체크인 넣기  
      </div>
      <div class="tab-pane fade" id="schedule-tab-pane" role="tabpanel" aria-labelledby="schedule-tab" tabindex="0">
        비행 시간표넣기  
      </div>
    </div>
  </div>

  <!-- 네비게이션 바 -->
  <div id="navbar">
    <a href="/board/noticeList.jsp">공지사항</a>
    <a href="/booking/city.jsp">도시별 예약</a>
    <a href="/booking/day.jsp">날짜별 예약</a>
    <a href="/board/qnaList.jsp">문의사항</a>
  </div>

  <!-- 프로모션 링크 -->
  <div class="promo-img">
    <a href="/promo1"><img src="/images/promo1.jpg" alt="프로모션1" /></a>
  </div>
  <div class="promo-img">
    <a href="/promo2"><img src="/images/promo2.jpg" alt="프로모션2" /></a>
  </div>

  <!-- 하단 저작권 -->
  <footer class="copyright">Copyright &copy; Chan</footer>

  <!-- JavaScript -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="script.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>