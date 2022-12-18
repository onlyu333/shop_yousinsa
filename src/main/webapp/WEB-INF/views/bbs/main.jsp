
<%@page import="com.shop.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="${pageContext.request.contextPath}/resources/css/productList.css"
   rel="stylesheet" />
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
.collapsible {
   background-color: #777;
   color: white;
   cursor: pointer;
   padding: 18px;
   width: 100%;
   border: none;
   text-align: left;
   outline: none;
   font-size: 15px;
}

.active, .collapsible:hover {
   background-color: #555;
}

.content {
   padding: 0 18px;
   max-height: 0;
   overflow: hidden;
   transition: max-height 0.2s ease-out;
   background-color: #f1f1f1;
}

.collapsible:after {
   content: '\002B';
   color: white;
   font-weight: bold;
   float: right;
   margin-left: 5px;
}

.active:after {
   content: "\2212";
}
</style>
<link href="${pageContext.request.contextPath}/resources/css/main.css"
   rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>

</head>
<body>


   <div id="main">


      <section>

         <!--  <div style="overflow-y: scroll; height: 1000px;"> </div> -->
         <div id="S_ltable">
            <table>
               <div id="loginBox">
                  <div class="wrap">
                     <c:if test="${member == null }">
                        <!-- 로그인 하지 않은 상태 -->
                        <form id="loginForm" method="post">
                           <div>
                              <span> 로그인</span>
                           </div>
                           <div>
                              <input class="idinput" name="mid">
                           </div>
                           <div>
                              <input type="password" class="pwinput" name="mpw">
                           </div>
                           <c:if test="${result == 0 }">
                              <div>
                                 <span class="login_warn" style="color: red;">사용자 ID 또는
                                    비밀번호를 잘못 입력하셨습니다.</span>
                              </div>
                           </c:if>
                           <div class="d-grid gap-2">
                              <input type="button" class="loginBut" value="로그인"> <span>
                              <a href="joinForm"><button>회원가입</a></button></span>
                           </div>
                        </form>
                     </c:if>
                     </form>

                     <div class="login_success_area">
                        <c:if test="${ member != null }">
                           <c:if test="${member.getMid() eq 'admin'}">
                              <span><a href="/shop/product"><button>상품등록</a></button></span>
                              <span><a href="/shop/productList"><button>상품목록</a></button></span>
                              
                              <br>
                           </c:if>
                           <span>회원 : ${member.mid} 님</span>
                           <br>
                           <span>등급 : ${member.grade}</span>
                           <br>
                           <span>찜</span>
                           <a href="logout" class="link-primary">[로그아웃]</a>
                        </c:if>
                     </div>
                  </div>
               </div>
               <tr>
                  <td>
                     <h2>품목</h2>
                     <button type="button" class="collapsible"
                        onclick="collapse(this);">top/상의</button>
                     <div class="content">
                        <li><a href="#">반팔</a></li>
                        <li><a href="#">셔츠</a></li>
                        <li><a href="#">블라우스</a></li>
                        <li><a href="#">후드</a></li>
                  </td>
               </tr>
               <tr>
                  <td>
                     <button type="button" class="collapsible"
                        onclick="collapse(this);">Pants/하의</button>
                     <div class="content">
                        <li><a href="#">청바지</a></li>
                        <li><a href="#">면바지</a></li>
                        <li><a href="#">레깅스</a></li>
                        <li><a href="#">트레이닝바지</a></li>
                  </td>
               </tr>
               <tr>
                  <td>
                     <button type="button" class="collapsible"
                        onclick="collapse(this);">Outer/아우터</button>
                     <div class="content">
                        <li><a href="#">후드집업</a></li>
                        <li><a href="#">블루종</a></li>
                        <li><a href="#">레더재킷</a></li>
                        <li><a href="#">롱패딩</a></li>
                  </td>
               </tr>
               <tr>
                  <td>
                     <button type="button" class="collapsible"
                        onclick="collapse(this);">Bag/가방</button>
                     <div class="content">
                        <li><a href="#">숄더백</a></li>
                        <li><a href="#">토트백</a></li>
                        <li><a href="#">빅백</a></li>
                        <li><a href="#">미니백</a></li>
                  </td>
               </tr>
               <tr>
                  <td>
                     <button type="button" class="collapsible"
                        onclick="collapse(this);">Shoes/신발</button>
                     <div class="content">
                        <li><a href="#">나이키</a></li>
                        <li><a href="#">아디다스</a></li>
                        <li><a href="#">뉴발란스</a></li>
                        <li><a href="#">UGG</a></li>
                  </td>
               </tr>
               <tr>
                  <td>
                     <button type="button" class="collapsible"
                        onclick="collapse(this);">Onepiece/원피스</button>
                     <div class="content">
                        <li><a href="#">미니원피스</a></li>
                        <li><a href="#">롱원피스</a></li>
                        <li><a href="#">레이스원피스</a></li>
                        <li><a href="#">정장</a></li>
                  </td>
               </tr>
               <tr>
                  <td>
                     <button type="button" class="collapsible"
                        onclick="collapse(this);">Q/A</button>
                     <div class="content">
                        <li><a href="#">자주묻는질문</a></li>
                        <li><a href="#">찾아오시는 곳 </a></li>
                        <li><a href="#">1:1상담</a></li>
                        <li><a href="#">공지사항</a></li>
                  </td>
               </tr>
            </table>
         </div>



         <div id="center">

            <c:forEach items="${imglist}" var="pvo">


               <div class="mb">

                  <!-- <p><a href="${pvo.pname}"></a><p> -->
               </div>

               <a><img src="download?filename=${pvo.filename}" width="140px">
                  <a href="detailview?pnum=${pvo.pnum}">${pvo.pname}</a></a>

            </c:forEach>

         </div>
   </div>


   </div>
   

   <!-- <div id="best">
      <table>
         <tr>
            <td>베스트셀러</td>
         </tr>
         <tr>
            <td>
               <li><a href="#">1위 트렌드코리아2023</a>
            </td>
         </tr>
         <tr>
            <td>
               <li><a href="#">2위 아버지의 해방일기</a>
            </td>
         </tr>
         <tr>
            <td>
               <li><a href="#">3위 이은경쌤의 초등어휘력</a>
            </td>
         </tr>
         <tr>
            <td>
               <li><a href="#">4위 불편한 편의점2</a>
            </td>
         </tr>
         <tr>
            <td>
               <li><a href="#">5위 랑랑 형제 떡집</a>
            </td>
         </tr>
      </table>
   </div>
    -->
   <footer>
      <div id="joo">
         <p>개발자 : 김은혜 김다솜</p>
      </div>
   </footer>

</body>
<script>
   $(".loginButton").click(function() {

      // alert("로그인 버튼 작동");
      $("#loginForm").attr("action", "/shop/login");
      $("#loginForm").submit();

   });

   function collapse(element) {
      var before = document.getElementsByClassName("active")[0] // 기존에 활성화된 버튼
      if (before && document.getElementsByClassName("active")[0] != element) { // 자신 이외에 이미 활성화된 버튼이 있으면
         before.nextElementSibling.style.maxHeight = null; // 기존에 펼쳐진 내용 접고
         before.classList.remove("active"); // 버튼 비활성화
      }
      element.classList.toggle("active"); // 활성화 여부 toggle

      var content = element.nextElementSibling;
      if (content.style.maxHeight != 0) { // 버튼 다음 요소가 펼쳐져 있으면
         content.style.maxHeight = null; // 접기
      } else {
         content.style.maxHeight = content.scrollHeight + "px"; // 접혀있는 경우 펼치기
      }
   }

   $(".loginBut").click(function() {

      //alert("로그인 버튼 작동");
      $("#loginForm").attr("action", "/shop/loginAction");
      $("#loginForm").submit();

   });
</script>
</html>