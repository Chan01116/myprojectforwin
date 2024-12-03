<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.chan.aws0822.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <title>공지사항 글수정</title>
    <script src="https://cdn.tiny.cloud/1/qfz3buag8m18lhmxt4mlwy2t9xcoq6akibkw606ukd6w4oxx/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
    tinymce.init({
        selector: "textarea[name='ncontents']", // TinyMCE를 적용할 textarea 선택
        plugins: "advlist autolink link image lists charmap preview paste", // 플러그인 설정
        toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | link image", // 툴바 설정
        menubar: false, // 메뉴바 비활성화

        paste_data_images: true, // 클립보드에서 복사한 이미지를 Base64로 처리
        automatic_uploads: false, // 이미지 자동 업로드 비활성화

        images_upload_handler: function (blobInfo, success, failure) {
            const reader = new FileReader(); 
            reader.onload = function () {
                success(reader.result); 
            };
            reader.onerror = function () {
                failure('이미지를 처리하는 동안 문제가 발생했습니다.');
            };
            reader.readAsDataURL(blobInfo.blob()); 
        },

        paste_postprocess: function(plugin, args) {
            console.log("붙여넣기 처리 중:", args.node.innerHTML);
        }
    });
    </script>
    <style>
      body {
        margin-top: 80px;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
      }
    </style>
</head>
<body>
<%@ include file="/header/navbar.jsp" %>

<div class="container mt-5">
  <form name="frm" method="post" enctype="multipart/form-data">
    <input type="hidden" name="nidx" value="${nv.nidx}">
    <div class="mb-3">
      <label for="ntitle" class="form-label">제목</label>
      <input type="text" class="form-control" id="ntitle" placeholder="제목을 입력하세요" name="ntitle" value="${nv.ntitle}">
    </div>
    <div class="mb-3">
      <label for="ncontents" class="form-label">내용</label>
      <textarea class="form-control" id="ncontents" rows="16" placeholder="내용을 입력하세요" name="ncontents">${nv.ncontents}</textarea>
    </div>
    <div class="mb-3">
      <label for="writer" class="form-label">작성자</label>
      <input type="text" class="form-control" id="writer" name="writer" value="${nv.writer}">
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">비밀번호</label>
      <input type="password" class="form-control" id="password" name="password">
    </div>
    <div class="mb-3">
      <label for="attachfile" class="form-label">첨부파일</label>
      <input class="form-control" type="file" id="attachfile" name="attachfile">
      <br>
      <div class="d-flex justify-content-end">
        <button type="button" class="btn btn-primary" onclick="check();">저장하기</button>
        <a class="btn btn-secondary ml-2" onclick="history.back();">취소</a>
      </div>
    </div>
  </form>
</div>

<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>

<script> 
function check() {
    let fm = document.frm;
    
    if (fm.ntitle.value === "") {
        alert("제목을 입력해주세요");
        fm.ntitle.focus();
        return;
    } else if (tinymce.get('ncontents').getContent() === "") {
        alert("내용을 입력해주세요");
        tinymce.get('ncontents').focus();
        return;
    }
    
    let ans = confirm("저장하시겠습니까?");
    
    if (ans) {
        fm.action = "<%=request.getContextPath()%>/board/noticeModifyAction.aws";
        fm.method = "post";
        fm.enctype = "multipart/form-data";
        fm.submit();
    }
}
</script>

</body>
</html>