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

	<style>
	.btn {
		padding: 3px 5px;
		font-size: 13px;
	}
	.table td, .table th {
    	padding: 10px;
    }
    
   .w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
}




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
	
	

</head>

<body>
	
<%@ include file="../admin/top.jsp" %>       
             
  <div class="pcoded-content">
      <!-- Page-header start -->
      <div class="page-header">
          <div class="page-block">
              <div class="row align-items-center">
                  <div class="col-md-8">
                      <div class="page-header-title">
                          <h5 class="m-b-10">Event 게시글</h5>
                          <p class="m-b-0">Event page</p>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <ul class="breadcrumb">
                          <li class="breadcrumb-item">
                              <a href="index.ad"> <i class="fa fa-home"></i> </a>
                          </li>
                          <li class="breadcrumb-item">Event 게시글</li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
      <!-- Page-header end -->
      
      <div class="pcoded-inner-content">
          <!-- Main-body start -->
          <div class="main-body">
              <div class="page-wrapper">
                  <!-- Page-body start -->
                  <div class="page-body">
                      
                       <div id="main-body">

        <div id="inner-wrapper">
          <div id="inner-main">
            <div class="card">
            <h2 style="align-self: center;">이벤트 목록(전체 글 : ${totalCount })</h2>
           
                <button class="btn link-secondary px-0 d-flex d-lg-none shadow-none" type="button" data-toggle="inner-sidebar-expand">
                  <svg width="16" height="20" viewBox="0 0 16 16" stroke="currentColor" stroke-width="2">
                    <line x1="0" x2="16" y1="3" y2="3"></line>
                    <line x1="0" x2="16" y1="8" y2="8"></line>
                    <line x1="0" x2="16" y1="13" y2="13"></line>
                  </svg>
                </button>
                
               <form action="list.evt" method="get">
		        <div class="input-group">
					<select class="form-select mt-0" name="whatColumn">
						<option value="title" selected>제목</option>
					</select>
					<input type="text" name="keyword"  class="form-control" placeholder="검색할 정보 입력">
					<input type="submit" class="btn btn-light" value="검색"><br><br>
				</div>
			   </form>
			   <a href="insert.evt" style="float: right;"><button class="w-btn w-btn-green" type="button" style="
    padding-left: 20px;
    padding-right: 20px;
    padding-top: 12px;
">글쓰기</button></a>
              </div>

 


		
	
	
<div class="card-body p-0" data-simplebar>
             
<!-- 화면 작성하면 되는 부분 -->
<%	
	String apath = application.getContextPath() + "/resources/images";
%>
<div class="row row-cols-2 row-cols-lg-3 row-cols-xl-4 g-2 g-sm-4">
	
	<c:forEach var="event" items="${lists }" >
		<div class="col">
           
			 <div class="card">
				
					<a href="content.evt?pageNumber=${pageInfo.pageNumber}&num=${event.num }" class="product-img"> <!--Image--> 
						<img class="card-img-top" loading="lazy"  src="<%=apath%>/${event.eventImage}" alt="..." title="" style="height:250px !important" /> <!--End Image--> <!--Hover Image-->
					</a>
					<!-- End Product Image -->
	

				<div class="card-body">
					<!--Product Name-->
					<h6 class="card-title">
						<a class="text-uppercase fw-normal" href="content.evt?num=${event.num }&pageNumber=${pageInfo.pageNumber}">${event.title}</a>
					</h6>
					<!--End Product Name-->
					<!--Product Price-->
					<div class="card-subtitle text-muted small">
						마감일 : 
						
						<fmt:parseDate var="formattedDay" value="${event.eventdate}" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="newformattedDay_endday" value="${formattedDay }" pattern="yyyy-MM-dd" />${newformattedDay_endday}
						
					</div>
				</div>
				<!--End Product Details-->
			</div>
		
		</div>
		
		
	</c:forEach>
</div>
<center>
${pageInfo.pagingHtml }	
</center>
 </div>
 </div>               

                    
<%@ include file="../admin/bottom.jsp" %>

</body>
</html>
