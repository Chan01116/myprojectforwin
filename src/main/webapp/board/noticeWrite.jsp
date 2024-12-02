<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="UTF-8">
<title>공시사항 글쓰기</title>

<script>
    // 서버에서 전달된 msg 변수를 JavaScript로 가져오는 방법
    var msg = "${msg}"; // 이 부분은 서버 사이드에서 msg 변수를 JavaScript로 전달하는 방식에 따라 달라질 수 있습니다.

    if (msg && msg.trim() !== "") {
        alert(msg);
    }

    </script>
<script>

function writeCheck(){
	alert("w제발");
	
    let fm = document.frm;
    let formData = new FormData(fm);
    
    if (fm.ntitle.value === "") {
        alert("제목을 입력해주세요");
        fm.ntitle.focus();
        return;
    } else if (fm.ncontents.value === "") {
        alert("내용을 입력해주세요");
        fm.ncontents.focus();
        return;
    }
    
    let ans = confirm("저장하시겠습니까?");
    
    if (ans) {
        fetch(`${pageContext.request.contextPath}/board/noticeWriteAction.aws`, {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("저장되었습니다.");
                window.location.href = `${pageContext.request.contextPath}/board/noticeList.aws`;
            } else {
                alert("저장에 실패했습니다: " + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("오류가 발생했습니다. 다시 시도해주세요.");
        });
    }
}
</script>
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
  <form name="frm" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">제목</label>
      <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요" name="ntitle">
    </div>
    <div class="mb-3">
      <label for="exampleFormControlTextarea1" class="form-label">내용</label>
      <textarea class="form-control" id="exampleFormControlTextarea1" rows="16" placeholder="내용을 입력하세요" name="ncontents"></textarea>
    </div>
    <div class="mb-3">
      <label for="formFileMultiple" class="form-label">첨부파일</label>
      <input class="form-control" type="file" id="formFileMultiple" name="attachfile" multiple>
      <br>
      <div class="d-flex justify-content-end">
        <button type="button" class="btn btn-primary" onclick="writeCheck();">저장하기</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>