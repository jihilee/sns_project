<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

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
	
	
	

</head>

<body>
	
<%@ include file="../admin/top.jsp" %>       

<style>
.err {
	font-size: 10px;
	font-weight: bold;
	color: red;
}

.w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
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


<br>
	<div id="inner-main">
				<div class="card">
					<div class="card-header d-flex align-items-center gap-3">

					</div>
					<div class="card-body p-0" data-simplebar>
						<div class="vstack gap-2">
		<form:form commandName="notice" method="post" name="noticeInsertForm" action="insert.nt" enctype="multipart/form-data"  style=" padding-right: 50px; padding-left: 280px;">
					<center><h2>공지상항 추가</h2></center>			
			
			<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>제 목</label>
			</div>
			<div class="input-group ">			
						<input class="form-control" type="text" size="50" maxlength="50" name="title" value="${notice.title }">
						<form:errors cssClass="err" path="title"/>
						<br>
					</div>
					
					
					<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>공지상항 날짜</label>
					</div>
					<div class="input-group ">
						<input class="form-control" type="text" size="50" maxlength="30" name="upload_date" value="${notice.upload_date}" placeholder="YYYY-MM-DD">
						<form:errors cssClass="err" path="upload_date"/>
					</div>
					
					<div class="mb-3">
					<label  class="form-label fw-bold" for="title"><br>사진</label>
					</div>
					<div class="input-group ">	
						<img align="center" height=100 width=100 src="${pageContext.request.contextPath}/resources/images${notice.nfile}">
						<input class="form-control" type="file"   name="upload" id="nfile"  value="${notice.nfile }"><br>
	       				<form:errors cssClass="err" path="nfile" />
					</div>
					
					<div class="mb-3">
					<label  class="form-label fw-bold"for="title"><br>내 용</label>
					</div>
					<div class="input-group ">
						<textarea class="form-control" name="contents" id="abc" rows="13" cols="50">${notice.contents}</textarea><br>
						<form:errors cssClass="err" path="contents"/>
					</div>
					
					<div class="mb-3">
						<input type="submit" class="w-btn w-btn-blue" value="글쓰기"> 
					
					<input type="button" value="목록보기" class="w-btn w-btn-blue" OnClick="window.location='list.nt?pageNumber=${pageNumber }'">
					</div>
			
		 </form:form>
				</div>
			</div>   
			</div>
	</div>                                                   

 </div>
 </div>     


                    
<%@ include file="../admin/bottom.jsp" %>
<head>
</body>
</html>
