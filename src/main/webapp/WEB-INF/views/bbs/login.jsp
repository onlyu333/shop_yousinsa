<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 나의 스타일 추가 -->
    <link rel="stylesheet" href="css/login.css?v=1234">

  </head>
  <body>
 <div class="wrap">
 <form id="loginForm" method="post">
 <div>
 <span> 로그인</span>
 </div>
 <div>
 <input class="idinput" name="mid">
 </div>
 <div>
 <input class="pwinput" name="mpw">
 </div>
 <c:if test = "${result == 0 }">
 <div><span class = "login_warn" style="color: red;">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</span></div>
  </c:if>
 <div>
 <input type="button" class="loginBut" value="로그인">
 </div>
 </form>
 </div>

</body>
<script>
$(".loginBut").click(function(){
    
    /*  alert("로그인 버튼 작동"); */
 $("#loginForm").attr("action", "/shop/loginAction");
     $("#loginForm").submit(); 
     
 });
 
 
</script>
</html>