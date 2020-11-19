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
		<h3>로그인 화면</h3>
	</div>
	<div class="info_con">
	<form action="login" method="post">
		<input type="text" name="userid" id="userid" placeholder="아이디"><br>
		<input type="password" name="passwd" id="passwd" placeholder="비밀번호"><br>
		<div class="signRow submit">
			<input type="submit" value="로그인"> 
			<input type="reset"value="취소"> 
		</div>
	</form>
	</div>
	</div>
</div>
</div>
	<!-- script -->
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<c:if test="${!empty param.mesg }">
		<script>
 		alert("${param.mesg}");
		</script>
	</c:if>
	<c:if test="${!empty mesg }">
		<script>
 		alert("${mesg}");
		</script>
	</c:if>
	<script type="text/javascript">
		$("#userid").focus();
		$("form").on("submit", function() {
			if ($("#userid").val().length == 0) {
				event.preventDefault();
				alert("아이디 입력 확인");
				$("#userid").focus();
			} else if ($("#passwd").val().length == 0) {
				event.preventDefault();
				alert("비밀번호 입력 확인");
				$("#passwd").focus();
			}
		})
	</script>
</body>
</html>