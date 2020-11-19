<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>
	<table width="100%" cellspacing="0" cellpadding="0" border="0">

		<tr>
			<td height="30">
		</tr>

		<tr>
			<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
				size="5"><b>- 장바구니-</b></font> &nbsp;
			</td>
		</tr>

		<tr>
			<td height="15">
		</tr>

		<tr>
			<td colspan="10">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		<tr>
			<td height="7">
		</tr>

		<tr>
			<td class="td_default" align="center"><input type="checkbox"
				name="allCheck" id="allCheck"> <strong>전체선택</strong></td>
			<td class="td_default" align="center"><strong>주문번호</strong></td>
			<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
			<td class="td_default" align="center"><strong>판매가</strong></td>
			<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
			<td class="td_default" align="center"><strong>합계</strong></td>
			<td></td>
		</tr>

		<tr>
			<td height="7">
		</tr>
		<tr>
			<td colspan="10">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>


		<form name="myForm">
			<c:forEach var="dto" items="${cartList }">


				<tr>
					<td class="td_default" width="80">
						<!-- checkbox는 체크된 값만 넘어간다. 따라서 value에 삭제할 num값을 설정한다. --> 
						<input type="checkbox" name="check" class="check" value="${dto.num} ">
					</td>
					<td class="td_default" width="80">${dto.num }</td>
					<td class="td_default" width="80"><img
						src="images/items/${dto.GImage }.gif" border="0" align="center"
						width="80" /></td>
					<td class="td_default" width="300" style='padding-left: 30px'><br>
						<font size="2" color="#665b5f">[옵션 : 사이즈(${dto.GSize }) ,
							색상(${dto.GColor })] </font></td>
					<td class="td_default" align="center" width="110">${dto.GPrice }</td>
					<td class="td_default" align="center" width="90"><input
						class="input_default" type="text" name="cartAmount"
						id="cartAmount${dto.num }" style="text-align: right" maxlength="3"
						size="2" value="${dto.GAmount }"></input></td>
					<td><input type="button" value="수정" class="updateBtn"
						data-xxx="${dto.num }" data-price="${dto.GPrice }" /></td>
					<td class="td_default" align="center" width="80"
						style='padding-left: 5px'><span id="sum${dto.num }">${dto.GPrice*dto.GAmount }</span>
					</td>
					<td><input type="button" value="주문" class="orderBtn"
						data-xxx="${dto.num }"></td>
					<td class="td_default" align="center" width="30"
						style='padding-left: 10px'><input type="button" value="삭제"
						id="xx${dto.num }" class="delBtn" data-xxx="${dto.num }">
					</td>
					<td height="10"></td>
				</tr>
			</c:forEach>
		</form>
		<tr>
			<td colspan="2"><b>총 합계 : </b><span id="total"></span></td>
		</tr>
		<tr>
			<td colspan="10">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td align="center" colspan="10" id="orderBtn">
				<a class="a_black" href="#" id="orderAllConfirm">선택 항목 주문하기 </a>
				<a class="a_black" href="#" id="delAllCart"> 선택 항목 삭제하기</a>
				<a class="a_black" href="/shop/"> 계속쇼핑하기 </a>
			</td>
		</tr>
		<tr>
			<td height="20">
		</tr>

	</table>
	<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
    	//전체 선택
    	$("#allCheck").on("click", function() {
    		const result = this.checked;
    		$(".check").each(function() {
    			this.checked = result;
    		});
    	});
    	
    	//삭제 버튼
    	$(".delBtn").on("click", function() {
    		const num = $(this).attr("data-xxx");
    		const xxx = $(this);
    		$.ajax({
        		url:'loginCheck/cartDelete',
        		type: 'get',
        		dataType: 'text',
        		data: {
        			num,
        		},
        		success: function(data, status, xhr){
        			xxx.parents().filter("tr").remove(); //span태그에 sum값 수정
        			totalPrint();
      			},
        		error:function(xhr,status,error){
        			console.log("error");
        		} 
        	}); //end ajax
    		
    	});
    	
    	
    	//수량 수정 버튼
    	$(".updateBtn").on("click", function() {
    		const num = $(this).attr("data-xxx");
    		const gAmount = $("#cartAmount"+num).val();
            const gPrice = $(this).attr("data-price");
           		 
            if(gAmount > 10) {
            	alert("수량을 10개 이하로 입력하세요.");
            } else {
            	$.ajax({
            		url:'loginCheck/cartUpdate',
            		type: 'get',
            		dataType: 'text',
            		data: {
            			num,
            			gAmount,
            		},
            		success:function(data, status, xhr){
            			let sum = gAmount*gPrice;
            			$("#sum"+num).text(sum); //span태그에 sum값 수정
            			totalPrint();
            		},
            		error:function(xhr,status,error){
            			console.log("error");
            		} 
            	}); //end ajax
            }// end if~else
        });// end event
        
    	//총 합계 
    	 function totalPrint() {
         	const sum = document.querySelectorAll("span[id^='sum']");
         	const total = document.querySelector("#total");
         	let totalSum = 0;
           for(let xxx of sum) {
        	   totalSum += parseInt(xxx.textContent);
           	}
           		console.log(totalSum);
           		total.innerText = totalSum;
    	 }
    	 totalPrint();

    	//전체 장바구니 삭제 2
    	$("#delAllCart").on("click", () => {
    		if($("#check").checked) {
    			totalPrint();
    			$("form").attr("action", "loginCheck/delAllCart");
    			$("form").submit(); //trigger (강제실행)
    		} else {
    			alert("상품을 선택해주세요");
    		}
    		
    	}); //end 전체 삭제2
    	
        //주문 버튼 
        $(".orderBtn").on("click", function(){
        	console.log("aaa");
        	const num = $(this).attr("data-xxx");
        	location.href="loginCheck/orderConfirm?num="+num;
        });// end 주문 
    
</script>
</body>
</html>