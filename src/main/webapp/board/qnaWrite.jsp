<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>건의사항 글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
  body {
    margin-top: 80px; /* 네비게이션 바 높이에 따라 조정 */
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
</style>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>

<div class="container mt-5">
  <div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">제목</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요">
  </div>
  <div class="mb-3">
    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="16" placeholder="내용을 입력하세요"></textarea>
  </div>
  <div class="row g-3 align-items-center mb-3">
    <div class="col-auto">
      <label for="inputPassword6" class="col-form-label">비밀번호</label>
    </div>
    <div class="col-auto">
      <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
    </div>
    <div class="col-auto">
      <span id="passwordHelpInline" class="form-text"></span>
    </div>
  </div>
  <div class="mb-3">
    <label for="formFileMultiple" class="form-label">첨부파일</label>
    <input class="form-control" type="file" id="formFileMultiple" multiple>
  </div>
</div>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>
</body>
</html>