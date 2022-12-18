<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css"
   rel="stylesheet" />
</head>
<body>
   <header>
      <div style="width: 350px; float: left;">
         <img id="mainimg"
            src="${pageContext.request.contextPath}/resources/img/main3.jpg">
      </div>
      <div class="mainSelect">
         <form action="search" method="get">
            <select id="mainS" name="mainSelect1">
               <option value="title">제목</option>
               <option value="writer">저자</option>
               <option value="publisher">출판사</option>
            </select> <input id="search" type="text" name="search"> <input
               id="searchButton" type="submit" value="검색">
         </form>
      </div>

   </header>

   <nav>
      <div id="nav1">
         <ul>
            <li><a href="/shop">HOME</a></li>
            <li><a href="#">신상품</a></li>
            <li><a href="#">이벤트</a></li>
            <li><a href="#">최근본상품</a></li>
            <li><a href="#">스페셜</a></li>
         </ul>
      </div>
      <div id="nav2">
         <ul>
            <li><a href="/shop/productList">상품목록</a></li>
            <li><a href="/shop/account">마이페이지</a></li>
            <li><a href="cart?mnum=${member.mnum }">장바구니</a></li>
            

         </ul>
      </div>
   </nav>
</body>
</html>