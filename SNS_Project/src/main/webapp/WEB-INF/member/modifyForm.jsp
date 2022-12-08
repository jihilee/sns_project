<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
modifyForm.jsp
<br>

<center>
<form action="modify.mem" method="post">
<input type="hidden" name="no" value="${ login.no }">
<table border="1">
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="${ login.email }"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${ login.name }"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="password" value="1234"></td>
	</tr>
	<!-- <tr>
		<td>비밀번호 확인</td>
		<td><input type="text" name="passwordChk"></td>
	</tr> -->
	<!-- <tr>
		<td>성별</td>
		<td><input type="radio" name="gender" value="man"
			checked="checked">남 <input type="radio" name="gender"
			value="woman">여</td>
	</tr> -->
	<tr>
		<td>생년월일</td>
		<fmt:parseDate var="b_date" pattern="yyyy-MM-dd" value="${ login.b_date }"/>
		<fmt:formatDate var="b_date2" pattern="yyyy-MM-dd" value="${ b_date }"/>
		<td><input type="date" name="b_date" value="${ b_date2 }"></td>
	</tr>
	<tr>
		<td>핸드폰번호</td>
		<td><input type="text" name="hp1" size="3" value="010">-
			<input type="text" name="hp2" size="4" value="9876">- <input
			type="text" name="hp3" size="4" value="">
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="addr1" value="${ login.addr1 }"><br>
			<input type="text" name="addr2" value="${ login.addr2 }"><br> <input
			type="text" name="addr3" value="${ login.addr3 }"></td>
	</tr>
	<tr>
		<td><input type="submit" value="수정"></td>
	</tr>
</table>
</form>
</center>