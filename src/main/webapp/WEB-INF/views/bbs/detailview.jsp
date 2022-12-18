<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="../top.jsp"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Mall</title>
<link href="${pageContext.request.contextPath}/resources/css/detailview.css"
   rel="stylesheet" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="content_area">
			<div class="line">
			</div>			
			<div class="content_top">
				<div class="ct_left_area">
						<c:forEach items="${attachList}" var="filename">
                        <img src="download?filename=${filename}" height="150">
                     </c:forEach>
				</div>
				<div class="ct_right_area">
					<div class="title">
						<h1>
							${pnum.pname}
						</h1>
					</div>
					<div class="line">
					</div>
					<div class="author">
						 <span>
						 	${pnum.brand}
						 </span>
						 <span>|</span>
						 <span class="publeyear">
						 	${pnum.pDate}
						 </span>
					</div>
					<div class="line">
					</div>	
					<div class="price">
						<div class="sale_price">판매가 : <fmt:formatNumber value="${pnum.price}" pattern="###,### 원" /></div>							
					</div>			
					<div class="line">
					</div>	
					<div class="button">						
						<div class="button_quantity">
							주문수량
							<input type="text" class="quantity_input" value="1">
							<span>
								<button class="plus_btn">+</button>
								<button class="minus_btn">-</button>
							</span>
						</div>
						<div class="button_set">
							<button class="btn_cart">장바구니 담기</button>
							<button class="btn_buy">바로구매</button>
						</div>
					</div>
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_middle">
				<div class="book_intro">
					${pnum.pexplain}
				</div>
				<div class="book_content">
					${pnum.pinformation }
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_bottom">
				<div class="reply_subject">
					<h2>리뷰</h2>
				</div>
			
				<c:if test="${member != null}">
					<div class="reply_button_wrap">
						<button>리뷰 쓰기</button>
					</div>
				</c:if>		
				
				<div class="reply_not_div">
					
				</div>
				<ul class="reply_content_ul">
					
				</ul>
				<div class="repy_pageInfo_div"> 
					<ul class="pageMaker">
									
					</ul>
				</div> 
					
				
			</div>
			<!-- 주문 form -->
			<form action="/cart" method="get" class="order_form">
				<input type="hidden" name="orders[0].pnum" value="${pnum.pnum}">
				<input type="hidden" name="orders[0].pount" value="">
			</form>	
		</div>
		
		
				<div class="clearfix"></div>
			</div>
		</div> <!-- class="footer" -->		
		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->

<script>
$(document).ready(function(){
	
	/* 이미지 삽입 */
	const bobj = $(".image_wrap");
	
	if(bobj.data("pnum")){
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
	} else {
		bobj.find("img").attr('src', '/resources/img/goodsNoImage.png');
	}	
	
	
	/* publeyear */
	const year = "${pnum.pDate}";
	
	let tempYear = year.substr(0,10);
	
	let yearArray = tempYear.split("-")
	let publeYear = yearArray[0] + "년 " + yearArray[1] + "월 " + yearArray[2] + "일";
	
	$(".pDate").html(publeYear);
	
	/* 포인트 삽입 */
	/* let salePrice = "${pnum.price - (goodsInfo.bookPrice*goodsInfo.bookDiscount)}"
	let point = salePrice*0.05;
	point = Math.floor(point);
	$(".point_span").text(point); */	
	
	/* 리뷰 리스트 출력 */
	
	const pnum = '${pnum.pnum}';	
	$.getJSON("/reply/list", {pnum : pnum}, function(obj){
		
		makeReplyContent(obj);
	});		
	
	
});	//$(document).ready(function(){
// 수량 버튼 조작
let quantity = $(".quantity_input").val();
$(".plus_btn").on("click", function(){
	$(".quantity_input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	if(quantity > 1){
		$(".quantity_input").val(--quantity);	
	}
});	
// 서버로 전송할 데이터
const frm = {
		mnum : '${member.mnum}',
		pnum : '${pnum.pnum}',
		pcount : ''
}
// 장바구니 추가 버튼
	$('.btn_cart').on("click", function(e){
		frm.pcount = $(".quantity_input").val();
		alert(frm.pcount);
		$.ajax({
			url: "cartadd",
			type: "POST",
			data: frm,
			success: function(result){
				alert(result);		
				cartAlert(result);
			}
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
	/* 바로구매 버튼 */
	$(".btn_buy").on("click", function(){
		let bookCount = $(".quantity_input").val();
		$(".order_form").find("input[name='orders[0].bookCount']").val(bookCount);
		$(".order_form").submit();
	})
	
	});
	

</script>

</body>
</html>