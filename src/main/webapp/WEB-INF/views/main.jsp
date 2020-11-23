<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>
<div class="wrap">
	<div class="left_section">
		<a href="/shop/"><h3 id="logo">logo</h3></a>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<div class="right_section">
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include><br>
		<c:if test="${!empty mesg }"> <!-- /memberAdd -->
			<script>alert("${mesg}")</script> <!-- 회원가입, 로그인 시 mesg넘어옴(addFlashAttribute) -->
		</c:if>
	</div>
</div>
</body>
</html>

https://youtu.be/RzjDa15Lgo0