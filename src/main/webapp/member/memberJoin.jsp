<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .form-signup {
            max-width: 400px;
            padding: 15px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-4 col-md-6 col-sm-8">
            <main class="form-signup">
                <form name="frm">
                    <h1 class="h3 mb-3 fw-normal text-center">Sign Up</h1>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInputId" placeholder="아이디를 입력하세요" name="memberid">
                        <label for="floatingInputId">ID</label>
                        <button type="button" class="btn btn-secondary mt-2 w-100" id="btn">아이디 중복체크</button>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력하세요" name="memberpassword">
                        <label for="floatingPassword">Password</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="floatingPasswordConfirm" placeholder="비밀번호 확인" name="memberpassword2">
                        <label for="floatingPasswordConfirm">Password Confirm</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" name="memberemail">
                        <label for="floatingEmail">Email address</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingName" placeholder="이름을 입력하세요" name="membername">
                        <label for="floatingName">이름</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="floatingBirthDate" name ="memberbirthday">
                        <label for="floatingBirthDate">생년월일</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingPhoneNumber" placeholder="핸드폰 번호를 입력하세요" name ="memberphone">
                        <label for="floatingPhoneNumber">핸드폰번호</label>
                    </div>

                    <!-- 성별 선택 -->
                    <div class="mb-3">
                        <input type="radio" id="genderMale" name="membergender" value="Male"> 
                        <label for="genderMale">남성</label><br>
                        <input type = "radio" id ="genderFemale"name ="membergender"value ="Female"> 
                        <label for ="genderFemale">여성</label><br> 
                        <input type ="radio" id ="genderOther"name ="membergender"value ="Other"> 
                        <label for ="genderOther">기타</label> 
                    </div>

                    <!-- 저장 버튼 -->
                    <button class='btn btn-primary w-100 py-2' type='button' onclick = "check();">저장하기</button>

                    <!-- Footer -->
                    <p class='mt-5 mb-3 text-body-secondary text-center'>&copy; 2024</p>
                </form>
            </main>
        </div>
    </div>
</div>

<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type = "text/javascript"> 
    $(document).ready(function() { 
        $("#btn").click(function() { 
            let memberId = $("#floatingInputId").val(); 
            if (memberId === "") { 
                alert("아이디를 입력해 주세요"); 
                return; 
            }

            $.ajax({ 
                type: "post", //전송방식
                url: "<%=request.getContextPath()%>/member/memberIdCheck.aws", 
                dataType: "json", // json타입은 문서에서 {"키값": "value값","키갑2": "value값2"} 
                data: { "memberId": memberId }, 
                success: function(result) { // 결과가 넘어와서 성공했을 때 받는 영역
                    if (result.cnt == 0) { 
                        alert("사용할 수 있는 아이디입니다."); 
                        $("#btn").val("Y"); 
                    } else { 
                        alert("사용할 수 없는 아이디입니다."); 
                        $("#floatingInputId").val(""); //입력한 아이디 지우기
                    } 
                }, 
                error: function() { // 결과가 실패했을 때 받는 영역
                    alert("전송실패 테스트"); 
                } 
            }); 
        }); 
    });

    function check() { 
        var fm = document.frm; // frm : form객체의 이름
        const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i; 
        
        if (fm.memberid.value == "") { 
            alert("아이디를 입력해주세요"); fm.memberid.focus(); return; 
        } else if (fm.memberpassword.value == "") { 
            alert("비밀번호를 입력해주세요"); fm.memberpwd.focus(); return; 
        } else if (fm.memberpassword2.value == "") { 
            alert("비밀번호확인을 입력해주세요"); fm.memberpwd2.focus(); return; 
        } else if (fm.memberpassword.value !== fm.memberpassword2.value) { 
            fm.memberpassword2.value = ""; fm.memberpassword2.focus(); alert("비밀번호가 일치하지 않습니다."); return; 
        } else if (fm.membername.value == "") { 
            alert("이름을 입력해주세요"); fm.membername.focus(); return; 
        } else if (fm.memberemail.value == "") { 
            alert("이메일을 입력해주세요"); fm.memberemail.focus(); return; 
        } else if(email.test(fm.memberemail.value) == false) { 
            alert("이메일형식이 올바르지 않습니다."); fm.memberemail.value = ""; fm.memberemail.focus(); return; 
        }

        var ans = confirm("저장하시겠습니까?"); 

        if(ans == true) { //가상경로를 사용해서 쓸 예정 가짜경로 형식은 : /기능/세부기능.aws
            fm.action = "<%=request.getContextPath()%>/member/memberJoinAction.aws"; fm.method = "post"; fm.submit(); } return; }
</script>

</body> </html> 
