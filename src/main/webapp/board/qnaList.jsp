<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>건의사항 리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .inquiry-item {
            padding: 15px;
            border-bottom: 1px solid #e9ecef;
            transition: background-color 0.2s;
        }
        .inquiry-item:hover {
            background-color: #f8f9fa;
        }
        .inquiry-title {
            font-weight: bold;
            color: #007bff;
        }
        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
        .btn-info:hover {
            background-color: #138496;
            border-color: #117a8b;
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="/header/navbar.jsp" %>

<main class="container mt-5">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom pb-2 mb-0">문의사항</h6>

        <!-- 글 목록 출력 -->
        <c:forEach items="${qlist}" var="qv">
            <div class="d-flex inquiry-item align-items-center">
                <span class="me-3 text-muted"></span>
                <p class="mb-0 small lh-sm w-100">
                    <a href="${pageContext.request.contextPath}/board/qnaContents.aws?qidx=${qv.qidx}" class="qna-title">${qv.qtitle}</a>
                </p>
            </div>
        </c:forEach>

       <small class="d-block text-end mt-3">
           
               <a href="${pageContext.request.contextPath}/board/qnaWrite.aws" class="btn btn-info">글쓰기</a>
           
       </small>
    </div>
</main>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>
</body>
</html>