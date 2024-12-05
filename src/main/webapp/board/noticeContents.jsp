<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 글내용</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function checkImageType(fileName){
            var pattern = /jpg$|gif$|png$|jpeg$/i;
            return fileName.match(pattern);
        }

        function getOriginalFileName(fileName){
            var idx = fileName.lastIndexOf("_")+1;
            return fileName.substr(idx);
        }

        function getImageLink(fileName){
            var front = fileName.substr(0,12);
            var end = fileName.substr(14);
            return front+end;
        }

        function download(){
            var downloadImage = getImageLink("${qv.filename}"); 
            var downLink = "${pageContext.request.contextPath}/board/displayFile.aws?fileName="+downloadImage+"&down=1";
            return downLink;
        }

        $(document).ready(function(){
            $("#dUrl").html(getOriginalFileName("${nv.filename}"));
            $("#dUrl").click(function(){
                $("#dUrl").attr("href", download());
                return;
            });

                
        });
    </script>
</head>
<body class="bg-light">
<%@ include file="/header/navbar.jsp" %>

<main class="container">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h6 class="border-bottom pb-2 mb-0">글내용</h6>
        
        <div><article class="detailContents">${nv.ntitle}(조회수:${nv.viewcnt})</article><br>
      
        </div>
        
        <div>${nv.ncontents}</div>

        <hr id="mid">
        
        <c:if test="${!empty nv.filename}">
            <img src="<%=request.getContextPath()%>/board/displayFile.aws?fileName=${nv.filename}">
            <p>
                <a id="dUrl" href="#" class="fileDown">첨부파일 다운로드</a>
            </p>
        </c:if>

        <hr id="bottom">
        
        
      <c:if test="${sessionScope.admin == 'Y'}">
            <div> 
                <a class="btn aBtn" id="contentsBtn" href="${pageContext.request.contextPath}/board/noticeModify.aws?nidx=${nv.nidx}">수정</a>
                <a class="btn aBtn" id="contentsBtn" href="${pageContext.request.contextPath}/board/noticeDelete.aws?nidx=${nv.nidx}">삭제</a>
            </div>
       </c:if>
        <!-- 목록으로 돌아가는 버튼 -->
        <a class="btn aBtn" href="${pageContext.request.contextPath}/board/noticeList.aws">목록</a>
    </div>
</main>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>
</body>
</html>