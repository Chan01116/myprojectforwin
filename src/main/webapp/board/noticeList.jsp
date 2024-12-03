<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html lang="UTF-8">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .notice-item {
            padding: 15px;
            border-bottom: 1px solid #e9ecef;
            transition: background-color 0.2s;
        }
        .notice-item:hover {
            background-color: #f8f9fa;
        }
        .notice-title {
            font-weight: bold;
            color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="/header/navbar.jsp" %>

<main class="container mt-5">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom pb-2 mb-0">공지사항</h6>

        <!-- 글 목록 출력 -->
        <c:forEach items="${nlist}" var="nv">
            <div class="d-flex notice-item align-items-center">
                <span class="me-3 text-muted"></span>
                <p class="mb-0 small lh-sm w-100">
                    <a href="${pageContext.request.contextPath}/board/noticeContents.aws?nidx=${nv.nidx}" class="notice-title">${nv.ntitle}</a>
                </p>
            </div>
        </c:forEach>

       <small class="d-block text-end mt-3">
    <c:if test="${sessionScope.admin == 'Y'}"> 
        <a href="${pageContext.request.contextPath}/board/noticeWrite.aws" class="btn btn-primary">글쓰기</a>
     </c:if>
</small>
    </div>
</main>

</body>
</html>