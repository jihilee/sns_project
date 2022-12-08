<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../common/common.jsp" %>

<%@include file="/WEB-INF/top&bottom/top.jsp"%>
    
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

<div class="pcoded-content">
      
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
            <h2 style="align-self: center;">공지사항(전체 글 : ${totalCount })</h2>
           
                <button class="btn link-secondary px-0 d-flex d-lg-none shadow-none" type="button" data-toggle="inner-sidebar-expand">
                  <svg width="16" height="20" viewBox="0 0 16 16" stroke="currentColor" stroke-width="2">
                    <line x1="0" x2="16" y1="3" y2="3"></line>
                    <line x1="0" x2="16" y1="8" y2="8"></line>
                    <line x1="0" x2="16" y1="13" y2="13"></line>
                  </svg>
                </button>
                
               <form action="view.nt" method="get">
		        <div class="input-group">
					<select class="form-select mt-0" name="whatColumn">
						<option value="title" selected>제목</option>
					</select>
					<input type="text" name="keyword"  class="form-control" placeholder="검색할 정보 입력">
					<input type="submit" class="btn btn-light" value="검색"><br><br>
				</div>
			   </form>
			  
              </div>

 


		
	
	
<div class="card-body p-0" data-simplebar>
             
<!-- 화면 작성하면 되는 부분 -->
<%	
	String apath = application.getContextPath() + "/resources/images";
%>
<div class="row row-cols-2 row-cols-lg-3 row-cols-xl-4 g-2 g-sm-4">
	
	<c:forEach var="notice" items="${lists }" >
		<div class="col">
           
			 <div class="card">


				<div class="card-body">
					<!--Product Name-->
					<h6 class="card-title">
						<a class="text-uppercase fw-normal" href="usernoticeContent.nt?num=${notice.num }&pageNumber=${pageInfo.pageNumber}">${notice.title}</a>
					</h6>
					<!--End Product Name-->
					<!--Product Price-->
					<div class="card-subtitle text-muted small">
						작성일 : 
						
						<fmt:parseDate var="formattedDay" value="${notice.upload_date}" pattern="yyyy-MM-dd" />
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


<%@include file="/WEB-INF/top&bottom/bottom.jsp"%>
 



