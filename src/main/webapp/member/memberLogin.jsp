<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<%
	String msg = "";
	if(request.getAttribute("msg")!= null){ 
	msg = (String)request.getAttribute("msg");
	}
%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> 멤버 로그인페이지 </title>
  <style>
    body {
      height: 100vh;
      background-color: #f8f9fa;
    }
    .form-signin {
      max-width: 330px;
      padding: 15px;
      margin: 0 auto;
    }
    
  </style>
  
  
  <script>
  <%
  if(msg != ""){
  out.println("alert('"+msg+"')");
  }
  %>
  
  </script>
  
  
  
  
</head>
<body>

<main class="form-signin text-center">
  <form name="frm">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating mb-3">
      <input type="email" class="form-control" id="floatingInput" name="memberid" placeholder="name@example.com">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating mb-3">
      <input type="password" class="form-control" id="floatingPassword" name="memberpassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

   <!--   <div class="form-check text-start my-3">
      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
      <label class="form-check-label" for="flexCheckDefault">
        Remember me
      </label>
    </div> -->
    
    <button class="btn btn-primary w-100 py-2 mb-2" name="btn" type="button" onclick= "check();" id="signIn" >Sign in</button>
    <button class="btn btn-secondary w-100 py-2" type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberJoin.aws'">Sign Up</button>
    
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2024</p>
  </form>
</main>

</body>
</html>