<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp" %>

<%@include file="/WEB-INF/top&bottom/top.jsp"%>

<style>
.w-btn-green {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    
}
</style>

<div style="margin: 50px 250px; width:60%">
			<div class="container">
				<div class="row">
					<center><h2>이벤트 보기</h2></center>			
				</div>
			</div>
			
			<div class="container">
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<strong>식별번호</strong> : ${bean.num}
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						<strong>조회수</strong> : ${bean.readcount}
					</div>
				</div>
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<strong>이벤트 종료일</strong> : 
						<fmt:parseDate var="formattedDay" value="${bean.eventdate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/>
						${newformattedDay}
					</div>
				</div>
					
				<div class="row">
					
					<div class="col" style="margin-bottom: 15px;">
						<strong>제목 : ${bean.title}</strong> 
					</div>
					
					<a>
					<div class="row" style="margin-bottom: 15px;">
						<strong style="width: 2030px;  padding-left: 30px;">글내용 : ${bean.write}</strong> 
					</div>
					</a>
					<div class="row" style="margin-bottom: 15px;">
						<img src="${pageContext.request.contextPath}/resources/images/${bean.eventImage}" style="width: 1200px;height: 500px;">
					</div>
					
				</div>
				
				<div class="row">
					
					
					<div class="col" style="margin-bottom: 15px;">
						 <input type="button" align="center" value="이벤트 글 목록" onclick="location.href='view.evt?pageNum=${pageNumber}'" class="w-btn w-btn-green"
						 style="
    padding-left: 20px;
    padding-right: 20px;
    margin-left: 600px;
">
					</div>
				
				</div>
			</div>
	</div>  
	
<%@include file="/WEB-INF/top&bottom/bottom.jsp"%>	
 
