<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
memberList.jsp<br>

<center>

<table border="1">
	<tr>
		<th>번호</th>
		<th>이메일</th>
		<th>이름</th>
		<th>성별</th>
		<th>생년월일</th>
		<th>핸드폰번호</th>
		<th>주소</th>
		<th></th>
	</tr>
	
	<c:if test="${ fn:length(lists) eq 0 }">
		<tr>
			<td>등록된 회원이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${ fn:length(lists) ne 0 }">
		<c:forEach var="member" items="${ lists }">
			<tr>
				<td>${ member.no }</td>
				<td>${ member.email }</td>
				<td>${ member.name }</td>
				<td>${ member.gender }</td>
				<td><fmt:parseDate var="b_date" pattern="yyyy-MM-dd" value="${ member.b_date }"/>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${ b_date }"/></td>
				<td>${ member.hp1 }-${ member.hp2 }-${ member.hp3 }</td>
				<td>${ member.addr1 }&nbsp;${ member.addr2 }&nbsp;${ member.addr3 }</td>
				<td><a href="delete.mem?no=${ member.no }">삭제</a></td>
			</tr>
		</c:forEach>
	</c:if>
	

</table>


</center>