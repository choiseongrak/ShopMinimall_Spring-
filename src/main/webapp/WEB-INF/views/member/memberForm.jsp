<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>
<div class="wrap">
<div class="left_section">
		<a href="/shop/"><h3 id="logo">logo</h3></a>
		<jsp:include page="../common/menu.jsp" flush="true"></jsp:include>
</div>
<div class="right_section">
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<div class="info">
		<div class="info_tit">
			<h3>회원가입 화면</h3>
		</div>
		<div class="info_con">
			<form action="memberAdd" method="post">
				<input type="text" name="userid" id="userid" placeholder="아이디">
				<span id="result"></span>
				<input type="password" name="passwd" id="passwd" placeholder="비밀번호">
				<input type="password" name="passwd2" id="passwd2" placeholder="비밀번호 확인">
				<span id="passwd2Span"></span>
				<span id="result2"></span>
	
				<input type="text" name="username" id="username" placeholder="이름"> 
				<input type="text" name="post" id="postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" name="addr1" id="roadAddress" placeholder="도로명주소">
				<input type="text" name="addr2" id="jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999"></span>
				<div class="signRow phone">
					<select name="phone1" id="phone1">
  						<option value="010">010</option>
 						<option value="011">011</option>
					</select>
					<input type="text" name="phone2" id="phone2">-<input type="text" name="phone3" id="phone3">
				</div>
				<div class="signRow email">
					<input type="text" name="email1" id="email1">@
   	    			<input type="text" name="email2" id="email2"  placeholder="직접입력">
   	    			<select id="email">
   	    				<option value="">직접 입력</option>
    	    			<option value="daum.net">daum.net</option>
        				<option value="naver.com">naver.com</option>
      	 			</select>
				</div>
				<div class="signRow submit">
					<input type="submit" value="회원가입">
					<input type="reset" value="취소">
				</div>
			</form>
			</div>
	</div>
	</div>
	</div>
<!-- script -->
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    
    	//form 입력 확인
         $("form").on("submit", function () {
             if($("#userid").val().length == 0) {
                 event.preventDefault();
                 $("#userid").focus();
                 alert("아이디 입력 확인");
             } else if ($("#passwd").val().length == 0 || $("#passwd2").val().length == 0){
                 event.preventDefault();
                 alert("비밀번호 입력 확인");
             } else if($("#username").val().length == 0) {
            	 event.preventDefault();
            	 alert("이름 입력 확인");
             } else if($("#postcode").val().length == 0) {
            	 event.preventDefault();
            	 alert("우편번호 입력 확인");
             } else if($("#roadAddress").val().length == 0) {
            	 event.preventDefault();
            	 alert("도로명주소 입력 확인");
             } else if($("#jibunAddress").val().length == 0) {
            	 event.preventDefault();
            	 alert("지번주소 입력 확인");
             } else if($("#phone1").val().length == 0 && $("#phone2").val().length == 0 
            		 && $("#phone3").val().length == 0 ) {
            	 event.preventDefault();
            	 alert("전화번호 입력 확인");
             } else if($("#email1").val().length == 0 && $("#email2").val().length == 0) {
            	 event.preventDefault();
            	 alert("이메일 입력 확인");
             }
         });//end	
    	
    	//비밀번호 일치 불일치 확인
        $("#passwd2").on("keyup", function () {
            if($("#passwd").val() == $("#passwd2").val()){
                $("#passwd2Span").text("비밀번호 일치");
            } else {
            	$("#passwd2Span").text("비밀번호 불일치");
            	
            	
            }
        });//end
		
       	//이메일 선택 입력
       	$("#email").on("change", function() {
       		$("input[name=email2]").val($("#email").val());
       	}); //end
       	
       	//아이디 중복 체크 
       	$("#userid").on("keyup", function() {
       		$.ajax({
       			type: "GET",
       			url: "idCheck", //서버 주소
       			data: {
       				userid: $("#userid").val(), //전송 데이터
       			},
       			dataType: "text", //응답 데이터 타입
       			success: function (data, status, xhr) {
       				console.log(data);
					$("#result").text(data);
				},
				error: function (xhr, status, error) {
					console.log("error");
				}
       		});
       	});// end
       	
</script>    
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</body>
</html>