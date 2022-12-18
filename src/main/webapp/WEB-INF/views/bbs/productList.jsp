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
<link href="${pageContext.request.contextPath}/resources/css/productList.css"
   rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

<h1> 상품 목록</h1>
<div>
 <div class="ptable">
                    	<!-- 상품 리스트 O -->
	                    <c:if test="${listcheck != 'empty'}">
	                    	<table class="p_table">
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">상품 번호</td>
	                    				<td class="th_column_2">상품 이름</td>
	                    				<td class="th_column_3">카테고리</td>
	                    				<td class="th_column_4">브랜드명</td>
	                    				<td class="th_column_5">가격</td>
	                    				<td class="th_column_6">재고</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.pnum}"></c:out></td>
	                    			<td><a href="productMod?pnum=${list.pnum}"><c:out value="${list.pname}"></c:out></a></td>
	                    			<td><c:out value="${list.cate1}"></c:out></td>
	                    			<td><c:out value="${list.brand}"></c:out></td>
	                    			<td><fmt:formatNumber value="${list.price}" pattern="###,###,###"/></td>
	                    			<td><c:out value="${list.stock}"></c:out></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    </c:if>
	                    <!-- 상품 리스트 X -->
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 상품이 없습니다.
                			</div>
                		</c:if> 
                	</div>
                	
                	 <!-- 검색 영역 -->
                	<%-- <div class="search_wrap">
                		<form id="searchForm" action="/bbs/productList" method="post">
                			<div class="search_input">
                    			<input type="text" name="searchKeyword" value='<c:out value="${list.searchKeyword}"></c:out>'>
                    			 <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.amount}'> 
                    			<input type="hidden" name="type" value="G">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>  --%>
          	<!-- 페이지 이름 인터페이스 영역 -->
                	<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                			
                			<!-- 이전 버튼 -->
                			<c:if test="${pagevo.prev}">
                					<a href="productList?page=${pagevo.startPage -1}">이전</a>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pagevo.startPage}" end="${pagevo.endPage}" var="idx">
                				<c:choose>
                					<c:when test="${pagevo.page==idx}">♥</c:when>
                					<c:otherwise><a href="productList?page=${idx}">${idx}</a></c:otherwise>
                				</c:choose>
                				
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pagevo.next}">
	                    			<a href="productList?page=${pagevo.endPage + 1}">다음</a>
	                    	</c:if>
	                    </ul>
                	</div>
                	
                	<%-- <form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${pagevo.pageNum}">
						<input type="hidden" name="amount" value="${pagevo.amount}">
						<input type="hidden" name="keyword" value="${pagevo.keyword}">
                	</form>  --%>
</div>








</table>

<!-- /* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
}); -->
</body>
</html>