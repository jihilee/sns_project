<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="../common/common.jsp"%>     
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Material Able bootstrap admin template by Codedthemes</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="Codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="resources/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="resources/assets/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/font-awesome.min.css">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/style.css">
	
	<!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="resources/assets/icon/themify-icons/themify-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="resources/assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="resources/assets/icon/icofont/css/icofont.css">
    <!-- morris chart -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/morris.js/css/morris.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/jquery.mCustomScrollbar.css">

	<style>
	.btn {
		padding: 3px 5px;
		font-size: 13px;
	}
	.table td, .table th {
    	padding: 10px;
    }
	</style>
	
	

</head>

<body>
	
<%@ include file="../admin/top.jsp" %>    

<style>
.err {
	font-size: 10px;
	font-weight: bold;
	color: red;
}
</style>

<br>
	<div style="margin: 50px 300px;">
		<form:form commandName="event" method="post" action="update.evt" enctype="multipart/form-data">
			<div class="container">
				<div class="row">
					<center><h2 style="padding-left: 150px;">이벤트 수정</h2></center>			
				</div>
			</div>
			
			<input type="hidden" name="num" value="${event.num}">
			<input type="hidden" name="pageNumber" value="${pageNumber}">
			<input type="hidden" name="originalImg" value="${event.eventImage}">
			
			<div class="container" style="width:600px;">
				<div class="row">
				
					<div class="row" style="margin-bottom: 15px;">
						<strong>제 목</strong>	
						<input type="text" size="50" maxlength="50" name="title" value="${event.title}">
						<form:errors cssClass="err" path="title"/>
					</div>
				
					<div class="row" style="margin-bottom: 15px;">
						<strong>작성자</strong><br>	
						<input type="text" size="30" maxlength="10" name="writer" value="관리자" readonly>
					</div>
				
					<div class="row" style="margin-bottom: 15px;">
						<strong>이벤트종료일</strong>
						<fmt:parseDate var="formattedDay" value="${event.eventdate }" pattern="yyyy-MM-dd"/>
	             		<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/><br>
						<input type="text" size="50" maxlength="50" name="eventdate" value="${newformattedDay}" placeholder="YYYY-MM-DD">
						<form:errors cssClass="err" path="eventdate"/>
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<strong>이벤트 이미지</strong><br>
						<img align="center" height="250" width="150" src="${pageContext.request.contextPath}/resources/images/${event.eventImage}">
						<input type="file"   name="upload" id="upload"  value="${event.upload }"><br>
	       				<form:errors cssClass="err" path="eventImage" />
					</div>
					
					<div class="row" style="margin-bottom: 15px;">
						<strong>내 용</strong>
						<textarea name="write" id="abc" rows="13" cols="50">${event.write}</textarea><br>
						<form:errors cssClass="err" path="write" /></td>
					</div>
					
					
				</div>
				
				
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<input type="submit" value="수정하기"> 
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						<input type="button" value="목록보기"  OnClick="window.location='list.evt?pageNumber=${pageNumber}'"> 
					</div>
				</div>
			</div>
		</form:form>
	</div>
	

   <%@ include file="../admin/bottom.jsp" %>

</body>
</html>	