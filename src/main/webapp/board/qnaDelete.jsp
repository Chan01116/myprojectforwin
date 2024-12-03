<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제</title>
<script> 

function check() {
	  
	  // 유효성 검사하기
	  let fm = document.frm;
	  
	 
	  let ans = confirm("삭제하시겠습니까?");
	  
	  if (ans == true) {
		  fm.action="<%=request.getContextPath()%>/board/qnaDeleteAction.aws";
		  fm.method="post";
		  fm.submit();
	  }	  
	  
	  return;
}

</script>
</head>
<body>
<header>
	<h2 class="mainTitle">글삭제</h2>
</header>

<form name="frm">
<input type="hidden" name="qidx" value="${qidx}">
	<table class="writeTable">
		
	</table>
	
	<div class="btnBox">
		<button type="button" class="btn" onclick="check();">저장</button>
		<a class="btn aBtn" href="#"  onclick="history.back();">취소</a>
	</div>	
</form>

</body>
</html>