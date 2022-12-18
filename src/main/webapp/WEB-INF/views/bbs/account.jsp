<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
   href="${pageContext.request.contextPath}/resources/css/shopping.css"
   rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<script
   src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
   crossorigin="anonymous">
</head>
<body>
   <div id="main">
      <section>
         <form action="accountmodiAction" method="post" id="pForm">
            <div id="memberModipy">
               <div>
                  <h1>회원정보 수정</h1>
               </div>
               <div class="cate_wrap">
                  <label for="gLocaLB" class="form-label">회원번호</label> <input
                     class="name form-control" id="pExampleInput1" type="text"
                     name="mnum" value="${member.mnum}" readonly="readonly">
                  </div>

                  <div class="mb-3">
                     <label for="formGroupExampleInput" class="form-label">아이디</labal>
                        <input class="name form-control" id="pExampleInput1" type="text"
                        name="mid" value="${member.mid}" readonly="readonly">
                  </div>
                  <div class="cate_wrap">
                     <label for="gLocaLB" class="form-label">이름</label> <input
                        class="name form-control" id="pExampleInput1" type="text"
                        name="mname" value="${member.mname}">

                  </div>

                  <div class="mb-3">
                     <label for="formGroupExampleInput" class="form-label">비밀번호</labal>
                        <input class="productid form-control"
                        id="formGroupExampleInput2" type="text" name="mpw"
                        value="${member.mpw}">
                  </div>
                  <div class="mb-3">
                     <labal for="formGroupExampleInput" class="form-label">주소</labal>
                     <input class="price form-control" id="formGroupExampleInput3"
                        type="text" name="maddr" value="${member.maddr}">
                  </div>

                  <div class="col-sm" style="height: 170px;">
                     <labal for="formGroupExampleInput" class="form-label">이메일</labal>
                     <br> <input class="price form-control"
                        id="formGroupExampleInput3" type="text" name="email"
                        value="${member.email}">
                  
                  </div>
                  <div class="col-sm" style="height: 170px;">
                     <labal for="formGroupExampleInput" class="form-label">등급</labal>
                     <br> <input class="price form-control"
                        id="formGroupExampleInput3" type="text" name="grade"
                        value="${member.grade}"readonly="readonly">
                  </div>
                  
                  
                   <input type="hidden" name="adminCK" value="${member.adminCK}">
                  
                  </tr>
                  </table>

               </div>
               <div class="col-12">
                  <button type="submit" class="btn btn-primary">수정하기</button>
                  <button class="btn btn-primary"><a href="memDel?mid=${mvo.mid}">삭제하기</a></button>
               </div>
         </form>
      </section>
      <footer>
         <div id="joo">
            <p>개발자 : 김은혜 김다솜</p>
         </div>
      </footer>
   </div>
</body>

</html>