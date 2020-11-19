<%@page import="com.dto.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form id="goodRetrieveForm" name="goodRetrieveForm" method="GET">
	    <!-- hidden  tag생성 -->
	    <input type="hidden" name="gCode" value="${goodsDTO.GCode }">
	    <input type="hidden" name="gImage" value="${goodsDTO.GImage }">
	    <input type="hidden" name="gName" value="${goodsDTO.GName }">
	    <input type="hidden" name="gPrice" value="${goodsDTO.GPrice }">

	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" cellspacing="0" cellpadding="0" border="0" width="100%">
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="8">
						<img src="images/items/${goodsDTO.GImage }.gif" border="0" align="center" width="300" />
						</td>
						<td class="td_title">제품코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
						${goodsDTO.GCode } 
						</td>
					</tr>
					<tr>
						<td class="td_title">상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
						${goodsDTO.GName }
						</td>
					</tr>
					<tr>
						<td class="td_title">가격</td>

						<td class="td_red" colspan="2" style='padding-left: 30px'>
						 ${goodsDTO.GPrice }
						</td>
					</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2">
						<font color="#2e56a9" size="2"style='padding-left: 30px'><b> 무료배송</b> </font> 
						<font size="2">(도서산간지역 별도 배송비 추가)</font>
						</td>
					</tr>
					<tr>
						<td class="td_title" rowspan="2">상품옵션</td>
						<td colspan="2" style='padding-left: 30px'>
						<select class="select_change" size="1" name="gSize" id="gSize">
								<option selected value="사이즈선택">사이즈선택</option>
								<option value="L">L</option>
								<option value="M">M</option>
								<option value="S">S</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" style='padding-left: 30px'>
						<select class="select_change" size="1" name="gColor" id="gColor">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
						</select></td>
					</tr>

					<tr>
						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px">
					    <input class="orderAmount" type="text" name="gAmount" value="1" id="gAmount" readonly> 
					    <img class="orderbtn"src="images/up.PNG" id="up"> <img class="orderbtn" src="images/down.PNG" id="down">
					    </td>
					</tr>
					<tr>
						<td colspan="2" >
							<div class="orderRow submit">
								<button onclick="reqCheck('order')">구매</button>
								<button id="cart" onclick="reqCheck('cart')">장바구니</button>
							</div>
						</td>
					</tr>
				</table>

			</td>
			
		</tr>
	</table>
	
</form>
 <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
 <c:if test="${!empty mesg }"> 
		<script>alert("${mesg}")</script> <!-- 장바구니 등록 시 넘어옴(addFlashAttribute) -->
</c:if>
 <script type="text/javascript">
		//상품 구매, 장바구니 저장
    	$("#cart").on("click", function() {
    		if($("#gSize").val() == "사이즈선택") {
    			alert("사이즈를 선택하세요.");
    			event.preventDefault();
    		} else if($("#gColor").val() == "색상선택") {
    			alert("색상을 선택하세요.");
    			event.preventDefault();
    		}
    		$("#goodRetrieveForm").attr("action","loginCheck/cartAdd"); //로그인 interceptor 후 진행
    	});  // end formSubmitEvent
    	
    	
    	//수량 증가버튼
    	let num = Number($("#gAmount").val());
    	$("#up").on("click", function() {
    		$("#gAmount").val(++num);
    	});
    	
    	//수량 감소버튼
    	$("#down").on("click", function() {
    		if(num > 1) {
    			$("#gAmount").val(--num);
    		}
    	}); //end
    	
</script>
</body>
</html>    