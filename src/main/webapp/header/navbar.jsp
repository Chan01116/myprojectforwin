<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>

<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
body {
    padding-top: 80px;
}
#loginButton:focus {
    outline: none;
    box-shadow: none;
}
.navbar .btn {
    padding: 0.375rem 0.75rem;
    margin-left: 0.5rem;
    white-space: nowrap;
}
.btn-outline-success {
    color: #28a745;
    border-color: #28a745;
}
.btn-outline-success:hover {
    background-color: #28a745;
    color: white;
}
.btn-info {
    background-color: #007bff;
    border-color: #007bff;
    color: white;
}
.btn-info:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <div class="container">
    <a class="navbar-brand" href="/">여기에 CI</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/board/noticeList.aws">공지사항</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            항공권 검색하기
          </a>
          <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="<%=request.getContextPath()%>/booking/flightSrc.aws">항공권 검색</a></li>
            <%-- <li><a class="dropdown-item" href="<%=request.getContextPath()%>/booking/city.aws">도시별 예약</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/booking/day.aws">날짜별 예약</a></li> --%>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/board/qnaList.aws">문의사항</a>
        </li>
      </ul>
      <form class="d-flex align-items-center">
       <!--  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button> -->
      </form>
      <c:choose>
        <c:when test="${!empty sessionScope.midx}">
            ${sessionScope.memberName}&nbsp;<a href='${pageContext.request.contextPath}/member/memberLogout.aws' class='btn btn-info'>로그아웃</a>
        </c:when>
        <c:otherwise>
            <button type="button" id="loginButton" class="btn btn-info">로그인</button>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>

<!-- 로그인 모달 -->
<div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">로그인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- AJAX로 로드된 컨텐츠가 여기에 삽입됩니다 -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="loginCheck()">로그인</button>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('loginButton').addEventListener('click', function() {
    fetch('/member/memberLogin.aws')
        .then(response => response.text())
        .then(data => {
            document.querySelector('#loginModal .modal-body').innerHTML = data;
            var loginModal = new bootstrap.Modal(document.getElementById('loginModal'), {
                backdrop: 'static',
                keyboard: false
            });
            loginModal.show();
        })
        .catch(error => console.error(error));
});

function loginCheck() {
    let memberid = document.getElementsByName("memberid");
    let memberpassword = document.getElementsByName("memberpassword");
    
    if(memberid[0].value == "") {
        alert("아이디를 입력해주세요");
        memberid[0].focus();
        return false;
    }
    
    if(memberpassword[0].value == "") {
        alert("비밀번호를 입력해주세요");
        memberpassword[0].focus();
        return false;
    }
    
    // form 객체 찾기 수정
    var fm = document.querySelector('form[name="loginfrm"]');
    // 또는
    // var fm = document.forms["frm"];
    
    if(fm) {
        fm.action = "<%=request.getContextPath()%>/member/memberLoginAction.aws";
        fm.method = "post";
        fm.submit();
    } else {
        alert("로그인 폼을 찾을 수 없습니다.");
    }
    return false;
}

function qnawriteCheck() {
    let fm = document.forms['frm'];
    
    if (fm.qtitle.value === "") {
        alert("제목을 입력해주세요");
        fm.qtitle.focus();
        return;
    } else if (tinymce.get('exampleFormControlTextarea1').getContent() === "") {
        alert("내용을 입력해주세요");
        tinymce.get('exampleFormControlTextarea1').focus();
        return;
    }
    
    let ans = confirm("저장하시겠습니까?");
    if(ans) {
        fm.action ="${pageContext.request.contextPath}/board/qnaWriteAction.aws";
        fm.method = "post";
        fm.enctype = "multipart/form-data";
        fm.submit();
    }
}
</script>

</body>
</html>