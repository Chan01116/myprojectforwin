<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글삭제</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .form-delete {
            max-width: 400px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        .form-delete header {
            margin-bottom: 20px;
        }
        .btnBox {
            display: flex;
            justify-content: space-between;
        }
        .btn {
            padding: 15px 30px; /* Increased padding for larger buttons */
            margin: 0 10px; /* Added margin for spacing between buttons */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px; /* Increased font size */
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
    </style>
    <script>
        function check() {
            let fm = document.frm;

            let ans = confirm("삭제하시겠습니까?");
            
            if (ans) {
                fm.action = "<%=request.getContextPath()%>/board/qnaDeleteAction.aws";
                fm.method = "post";
                fm.submit();
            }
            
            return;
        }
    </script>
</head>
<body>
    <div class="form-delete">
        <header>
            <h2 class="mainTitle">글삭제</h2>
        </header>

        <form name="frm">
            <input type="hidden" name="qidx" value="${qidx}">

            <div class="btnBox">
                <button type="button" class="btn btn-primary" onclick="check();">삭제</button>
                <a class="btn btn-secondary" href="#" onclick="history.back();">취소</a>
            </div>    
        </form>
    </div>
</body>
</html>