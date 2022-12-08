<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="keywords"
	content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="Codedthemes" />
<!-- Favicon icon -->
<link rel="icon" href="resources/assets/images/favicon.ico"
	type="image/x-icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet">
<!-- waves.css -->
<link rel="stylesheet"
	href="resources/assets/pages/waves/css/waves.min.css" type="text/css"
	media="all">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet"
	href="resources/assets/pages/waves/css/waves.min.css" type="text/css"
	media="all">
<!-- themify icon -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/icon/themify-icons/themify-icons.css">
<!-- font-awesome-n -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/font-awesome-n.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/font-awesome.min.css">
<!-- scrollbar.css -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/jquery.mCustomScrollbar.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/style.css">

<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/icon/themify-icons/themify-icons.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/icon/icofont/css/icofont.css">
<!-- morris chart -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/morris.js/css/morris.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/assets/css/jquery.mCustomScrollbar.css">
<style>
.btn-0 {
	border-radius: 2px;
    text-transform: capitalize;
	padding: 3px 5px;
	font-size: 13px;
}

.table td, .table th {
	padding: 10px;
}
</style>
</head>

<body>

	<%@ include file="../top.jsp"%>

	<div class="pcoded-content">
		<!-- Page-header start -->
		<div class="page-header">
			<div class="page-block">
				<div class="row align-items-center">
					<div class="col-md-8">
						<div class="page-header-title">
							<h5 class="m-b-10">회원조회</h5>
							<p class="m-b-0">Search for people who have signed up</p>
						</div>
					</div>
					<div class="col-md-4">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.ad"> <i
									class="fa fa-home"></i>
							</a></li>
							<li class="breadcrumb-item">회원조회</li>
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

						<!-- Hover table card start -->
						<div class="card">
							<div class="card-header">
								<h5>회원 조회</h5>
								<span>버튼을 클릭해서 해당하는 회원을 조회할 수 있습니다.</span>
								<div class="card-header-right">
									<ul class="list-unstyled card-option">
										<li><i class="fa fa fa-wrench open-card-option"></i></li>
										<li><i class="fa fa-window-maximize full-card"></i></li>
										<li><i class="fa fa-minus minimize-card"></i></li>
										<li><i class="fa fa-refresh reload-card"></i></li>
										<li><i class="fa fa-trash close-card"></i></li>
									</ul>
								</div>
								<button class="btn-0 waves-effect waves-light btn-inverse"
									onclick="location.href='member.ad'">전체</button>
								<button class="btn-0 waves-effect waves-light btn-success"
									onclick="location.href='member.ad?deactivate=0'">활성화</button>
								<button class="btn-0 waves-effect waves-light btn-danger"
									onclick="location.href='member.ad?deactivate=1'">비활성화</button>

							</div>
							<div class="card-block table-border-style">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Email</th>
												<th>Birth</th>
												<th>Gender</th>
												<th>Phone</th>
												<th>Address</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="member" items="${memberList }" varStatus="i">
												<tr>
													<th scope="row">${i.count }</th>
													<td>${member.name }</td>
													<td>${member.email }</td>

													<td><fmt:parseDate var="birth"
															value="${member.b_date }" pattern="yyyy-mm-dd" /> <fmt:formatDate
															value="${birth }" pattern="yyyy-mm-dd" /></td>

													<c:if test="${member.gender == 'woman' }">
														<td>여</td>
													</c:if>
													<c:if test="${member.gender == 'man' }">
														<td>남</td>
													</c:if>

													<td>${member.hp1 } - ${member.hp2 } - ${member.hp3 }</td>
													<td>${member.addr1 }</td>

													<c:if test="${member.deactivate == 0}">
														<td><label class="label label-inverse-success">활성화</label></td>
													</c:if>
													<c:if test="${member.deactivate == 1}">
														<td><label class="label label-inverse-danger">비활성화</label></td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- Hover table card end -->

					</div>
					<!-- Page-body end -->
				</div>
				<div id="styleSelector"></div>
			</div>
		</div>
	</div>

	<%@ include file="../bottom.jsp"%>

</body>
</html>
