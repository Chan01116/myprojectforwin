<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 항상 맨위에 있어야 함 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
  <head>
    <title>비행기 예약 메인 페이지</title>
    <link rel="stylesheet" href="../css/style.css" />
  </head>
  <body>
    <!-- 로그인 버튼 -->
    <div class="login">
      <a href="/member/memberLogin.jsp">로그인</a>
    </div>

    <!-- 검색창 및 탭 -->
    <div class="container">
      <div class="search-bar">
        <input type="text" placeholder="검색어를 입력하세요" />
      </div>
      <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Home</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false" disabled>Disabled</button>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
</div>
    </div>

    <!-- 네비게이션 바 -->
    <div id="navbar">
      <a href="/board/notice.jsp">공지사항</a>
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
  </body>
</html>
