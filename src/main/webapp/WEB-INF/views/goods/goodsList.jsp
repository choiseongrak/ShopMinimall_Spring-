

<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section class="content">
	<div class="goodList">
	<table cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0">
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
						<!-- 반복 시작-->
						<c:forEach var="dto" items="${goodsList }" varStatus="status">
							<!-- status는 index(방 번호) -->
							<td>
								<table style='padding: 15px'>
									<tr>
										<td>
										<a href="goodsRetrieve?gCode=${dto.GCode }"> 
										<img src="images/items/${dto.GImage }.gif" border="0" align="center" width="200">
										</a></td>
									</tr>
									<tr>

										<td height="10">
									</tr>
									<tr>
										<td class="td_default" align="center">
										<a class="a_black" href="goodsRetrieve?gCode=${dto.GCode }"> ${dto.GName }<br></a> 
										<font color="gray"> -------------------- </font>
										</td>

									</tr>
									<tr>
										<td height="10">
									</tr>
									<tr>
										<td class="td_gray" align="center">${dto.GContent}</td>
									</tr>
									<tr>
										<td height="10">
									</tr>
									<tr>
										<td class="td_red" align="center"><font color="red"><strong>${dto.GPrice}</strong></font>
										</td>
									</tr>
								</table>
							</td>

							<!-- 한줄에 4개씩 보여주기 -->
							<c:if test="${status.count%4 == 0}">
								<tr>
									<td height="10">
								</tr>
							</c:if>
						</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10">
		</tr>
	</table>
	</div>
</section>