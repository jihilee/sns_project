<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../common/common.jsp"%>     
<!DOCTYPE html>
<html lang="ko">

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


</head>

<body>
	
<%@ include file="../admin/top.jsp" %>      

    


                              
	 <div style="margin: 50px 250px; width:60%">
			<div class="container">
				<div class="row">
					<center><h2>공지사항</h2></center>			
				</div>
			</div>
			
			<div class="container">
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<strong>식별번호</strong> : ${notice.num}
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						<strong>조회수</strong> : ${notice.readcount}
					</div>
				</div>
				
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<strong>작성일</strong> : 
						<fmt:parseDate var="formattedDay" value="${notice.upload_date }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd"/>
						${newformattedDay}
					</div>
				</div>
					
				<div class="row">
					
					<div class="col" style="margin-bottom: 15px;">
						<strong>제목 : ${notice.title}</strong> 
					</div>
					
					
					<div class="row" style="margin-bottom: 15px;">
						<strong style="width: 1200px;height: 50px;border-left-width: 30px;padding-left: 25px;">글내용 : ${notice.contents}</strong> 
					  </div>
				
					
					<div class="row" style="margin-bottom: 15px;">
						<img src="${pageContext.request.contextPath}/resources/images/${notice.nfile}" style="width: 1200px;height: 500px;">
					</div>
					
				</div>
				
				<div class="row">
					<div class="col" style="margin-bottom: 15px;">
						<input type="button" value="공지사항 수정" onclick="location.href='update.nt?num=${notice.num}&pageNumber=${pageNumber}'">
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						 <input type="button" value="공지사항 삭제" onclick="location.href='delete.nt?num=${notice.num}&pageNumber=${pageNumber}'">
					</div>
					
					<div class="col" style="margin-bottom: 15px;">
						 <input type="button" value="공지사항 목록" onclick="location.href='list.nt?pageNum=${pageNumber}'">
					</div>
				</div>
			</div>
	</div>                        
                         
                          
   
                              
 <%@ include file="../admin/bottom.jsp" %>

</body>
</html>                             
                              
      