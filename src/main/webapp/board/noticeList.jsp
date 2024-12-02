<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html lang="UTF-8">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%@ include file="/header/navbar.jsp" %>

<main class="container">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h6 class="border-bottom pb-2 mb-0">공지사항</h6>

        <!-- 글 목록 출력 -->
        <c:forEach items="${blist}" var="bv">
            <div class="d-flex text-muted pt-3">
                <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><text>32x32</text></svg>
                <p class="pb-3 mb-0 small lh-sm border-bottom">
                    <strong class="d-block text-gray-dark">${bv.writer}</strong>
                    <a href="${pageContext.request.contextPath}/board/boardContents.aws?bidx=${bv.bidx}">${bv.subject}</a>
                </p>
            </div>
        </c:forEach>

        <!-- 관리자만 볼 수 있는 글쓰기 버튼 -->
      
            <small class="d-block text-end mt-3">
                <a href="${pageContext.request.contextPath}/board/noticeWrite.aws" class="btn btn-primary">글쓰기</a>
            </small>
    </div>
</main>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>
</body>
</html>