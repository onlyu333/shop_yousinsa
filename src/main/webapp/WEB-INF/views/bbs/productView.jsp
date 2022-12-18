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
			<form action="modipyAction" method="post" id="pForm" enctype="multipart/form-data">
				<div id="productModipy">
					<div>
						<h1>상품수정</h1>
					</div>
					<div class="cate_wrap">
						<label for="gLocaLB" class="form-label">분류선택 </label>
						<div class="search_boxes">
							<span class="search_box"> <select name="cate1"  value="${cate1}"></select>
								<select name="cate2" value="${cate2}"></select>
							</span>
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">상품명</labal>
								<input class="productname form-control"
								id="formGroupExampleInput1" type="text" value="${pnum.pname}">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">브랜드명</labal>
								<input class="productid form-control"
								id="formGroupExampleInput2" type="text" value="${pnum.brand}"> 
						</div>
						<div class="mb-3">
							<labal for="formGroupExampleInput" class="form-label">가격</labal>
							<input class="price form-control" id="formGroupExampleInput3"
								type="text" value="${pnum.price}">
						</div>
						<div class="col-sm">
							<labal for="formGroupExampleInput" class="form-label">재고량</labal>
							<input class="stock form-control" type="text"
								id="formGroupExampleInput4" value="${pnum.stock}"><br>
						</div>
						<div class="col-sm" style="height: 170px;">
							<labal for="formGroupExampleInput" class="form-label">상품정보</labal><br>
							<textarea row="8" cols="100" id="Intro_textarea" style="height: 50px;">${pnum.pinformation}</textarea>
						</div>
						<div class="col-sm" style="height: 170px;">
							<labal for="formGroupExampleInput" class="form-label">상품설명</labal><br>
							<textarea row="8" cols="100" id="Contents_textarea" >${pnum.pexplain}</textarea>
       
								<label>상품 이미지</label>
							</div>
						           <th>첨부파일</th>
               <td>
               <c:forEach items="${attachList}" var="filename">
               <a href ="download?filename=${filename}">${filename}</a><br>
               </c:forEach></td>
            </tr>
         </table>
         <br>
         <br> <input type="button" value="이전" onclick="history.go(-1)">
         <input type="button" value="목록" onclick="location.href='productList'">
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary">수정하기</button>
					</div>
			</form>
		</section>
      <footer>
			<div id="joo">
				<p>
					예스이십오(주)<br> 경기도 수원시 팔달구 중부대로 100 3층<br> 고객문의<br>
					1544-0000<br>
				</p>
			</div>
		</footer>
   </div>
</body>
<script type="text/javascript">

$('document').ready(function() {
    var area0 = ["선택","상의","하의","아우터","가방","신발","원피스"];
     var area1 = ["반팔","셔츠","블라우스","후드"];
      var area2 = ["청바지","면바지","레깅스","트레닝바지"];
      var area3 = ["후드집업","블루종","레더재킷","롱패딩"];
      var area4 = ["숄더백","토트백","빅백","미니백"];
      var area5 = ["나이키","아디다스","뉴발란스","UGG"];
      var area6 = ["미니원피스","롱원피스","레이스원피스","정장"];
      //  선택 박스 초기화

      $("select[name^=cate]").each(function() {
       $selcate = $(this);
       $.each(eval(area0), function() {
        $selcate.append("<option value='"+this+"'>"+this+"</option>");
       });
       $selcate.next().append("<option value=''>선택</option>");
      });
   // 대분류 선택시 소분류 설정

      $("select[name^=cate]").change(function() {
       var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택 Array
       var $ccate = $(this).next(); // 선택영역 객체
       $("option",$ccate).remove(); //  초기화

       if(area == "area0")
        $ccate.append("<option value=''>선택</option>");
       else {
        $.each(eval(area), function() {
         $ccate.append("<option value='"+this+"'>"+this+"</option>");
        });
       }
      });
     });


</script>
</html>