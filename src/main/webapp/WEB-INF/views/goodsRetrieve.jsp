<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
</div>
<div class="right_section">
<jsp:include page="common/top.jsp" flush="false"></jsp:include>
<jsp:include page="goods/goodsRetrieve.jsp" flush="true"></jsp:include><br>
</div>
</body>
</html>