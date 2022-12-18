<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
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
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	 rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

	<div id="main">
		<section>
			<form action="joinAction" method="post">
				<div id="join">
					<div>
							<h1>회원가입</h1>
						</div>
						<div class="mb-3">
						<label for="formGroupExampleInput" class="form-label">이름</labal>
							<input class="username form-control" id="formGroupExampleInput1" type="text" name="mname"
								placeholder="이름을 입력해 주세요."> 
									</div>
						<div class="mb-3">		
							<label for="formGroupExampleInput" class="form-label">아이디</labal>
							<input class="userid form-control" id="formGroupExampleInput2" type="text" name="mid" placeholder="아이디를 입력해 주세요."> 
								<span class="idError1" style="display: none; color: green;">사용가능한 아이디 입니다.</span> 
								<span class="idError2" style="display: none; color: red;">아이디가 이미 존재합니다.</span> 
								<span class="idError3" style="display: none; color: red;">4~12자 영문 대소문와 숫자로 입력</span>
						</div>
						<div class="mb-3">	
							<labal for="formGroupExampleInput" class="form-label">비밀번호</labal>
							<input class="userpass form-control" id="formGroupExampleInput3" type="text" name="mpw" placeholder="비밀번호를 입력해 주세요">
						</div>
						<div class="col-sm">	
						<labal for="formGroupExampleInput" class="form-label">비밀번호 확인</labal>
						<input class="userpass1 form-control" id="formGroupExampleInput4" type="text" name="mpwck" placeholder="비밀번호 확인해주세요"><br> 
						<span class="numberError" style="display: none; color: green;">비밀번호가 일치 합니다.</span> 
						<span class="numberErrorck" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</span>
						</div>
						<div class="col-sm">	
							<labal for="formGroupExampleInput" class="form-label">Email</labal>
							<input class="useremail form-control" type="text" id="formGroupExampleInput4" name="email" placeholder="이메일을 입력해 주세요."><br>
							<span class="emailError" style="display: none;"></span></td>
						</div>
						<div class="row g-3">	
							<labal for="formGroupExampleInput" class="form-label">주소</labal>
							<div class="col-sm">
							<input class="useraddr1 form-control" placeholder="Zip" aria-label="Zip" type="text" name="maddr1" readonly="readonly">
							</div>
							<div class="col-sm">
							<input class="addBut" type="button" value="우편번호" onclick="execution_daum_address()">
							</div>
							<div class="col-12">
							<input class="useraddr2 form-control" id="inputAddress" placeholder="1234 Main St" type="text" name="maddr" readonly="readonly">
							</div>
							<div class="col-12">
							<input class="useraddr3 form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" type="text" name="maddr" readonly="readonly">
							</div>
							<!-- <span style="display: none;"></span></td>-->
						</div>

						<div class="col-12"><button type="submit" class="btn btn-primary" >가입하기</button></div>
						

					
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
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		var idCheck = false;
		var idckCheck = false;
		var pwCheck = false;
		var pwckCheck = false;
		var pwckcorCheck = false;
		var nameCheck = false;
		var mailCheck = false;
		var addrCheck = false;
		var regul1 = /^[a-zA-Z0-9]{4,12}$/;

		/*   $(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
		$(".join_button").click(function(){
		$("#joinAction").attr("action", "/shop/join"); 
		$("#joinForm").submit(); 
		var mid=$('.userid').val();
		});
		});   */
		//아이디 중복검사
		$('.userid').on("propertychange change keyup paste input", function() {

			console.log("keyup 테스트");
			var mid = $('.userid').val(); // .id_input에 입력되는 값
			var data = {
				mid : mid
			} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

			$.ajax({
				type : "post",
				url : "/shop/memberIdChk",
				data : data,
				success : function(result) {
					console.log("성공 여부" + result);
					if (result != 'fail') {
						$('.idError1').css("display", "inline-block");
						$('.idError2').css("display", "none");
						idckCKeck = true;
					} else {
						$('.idError2').css("display", "inline-block");
						$('.idError1').css("display", "none");
						idckCKeck = false;

					}// success 종료
				}
			}); // ajax 종료	

		});// function 종료

		$('.userpass1').on("propertychange change keyup paste input",
				function() {
					var mpw = $('.userpass').val();
					var mpwck = $('.userpass1').val();
					if (mpw == mpwck) {
						$('.numberError').css("display", "inline-block");
						$('.numberErrorck').css("display", "none");
						pwckcorCheck = true;
					} else {
						$('.numberError').css("display", "none");
						$('.numberErrorck').css("display", "inline-block");
						pwckcorCheck = false;
					}
				});
		function mailFormCheck(email) {
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
		$('.useremail').on("propertychange change keyup paste input",
				function() {

					console.log("keyup 테스트");
					var email = $('.useremail').val();
					var warnMsg = $(".emailError");

					if (mailFormCheck(email)) {
						warnMsg.html("이메일이 확인되었습니다.");
						warnMsg.css("display", "inline-block");
					} else {
						warnMsg.html("올바르지 못한 이메일 형식입니다.");
						warnMsg.css("display", "inline-block");
						return false;
					}

					$.ajax({
						type : "GET",
						url : email,
						success : function(data) {
							checkBox.attr("disabled", false);
							code = data;
						}// success 종료
					}); // ajax 종료	
				});
		function execution_daum_address(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		 
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		 
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                   addr += extraAddr;
		                
		                } else {
		                   addr += '';
		                }
		 
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $(".useraddr1").val(data.zonecode);
                        //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
                        $(".useraddr2").val(addr);
                        //$("[name=memberAddr2]").val(addr);            // 대체가능
		                // 커서를 상세주소 필드로 이동한다.
                        $(".useraddr3").attr("readonly",false);
                        $(".useraddr3").focus();
			 
			        }
			    }).open();  
		}
	</script>
</body>

</html>