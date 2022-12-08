<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>


<!DOCTYPE html>
<html lang="en">


<style>
#navProfile {
	border-radius: 100px;
	width: 40px;
	height: 40px;
}

#sideProfile {
	border-radius: 100px;
	width: 80px;
	height: 80px;
}

#content {
	width: 50%;
	margin-left: 15%;
}

.select_img {
	margin-top: 10px;
	margin-bottom: 10px;
	overflow: hidden;
	height: 160px;
	width: 500px;
}

#img {
	margin-top: -20%;
}
</style>

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
	content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="Codedthemes" />
<!-- Favicon icon -->
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.ico"
	type="image/x-icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/pages/waves/css/waves.min.css"
	type="text/css" media="all">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/assets/icon/themify-icons/themify-icons.css">
<!-- feather icon -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/assets/icon/feather/css/feather.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/assets/css/jquery.mCustomScrollbar.css">
</head>

<body>
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="loader-track">
			<div class="preloader-wrapper">
				<div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			
			<!-- ### nav 이외의 영역 ### -->
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					
					<div class="pcoded-content">
						<!-- Page-header start -->

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">
										<div class="row">

											<!-- 컨텐츠 -->
											<div class="col-sm-12">
												<div class="card" id="content">
													<div class="card-header">
														<center><h1>환영합니다!</h1>
														
														<hr>
														<br>
														<div>
															<p class="text-center">
																<font size="4px">${ login.name }</font>&nbsp;님의 로그인 성공<br> 
																이메일 주소는 <font size="4px">${ login.email }</font>&nbsp;입니다.
															</p>
														</div>
														<br>
														<div class="d-grid gap-2">
															<button type="button" class="btn btn-primary btn-lg"
																onclick="location.href='myprofile.pro'">시작하기</button>
																<!-- <button type="button" class="btn btn-primary btn-lg"
																onclick="location.href='kakaoLogout.mem'">카카오 로그아웃</button> -->
														</div>
														</center>

														<div class="card-block">
															<p>
																<!-- <font size="3px">소개를 입력해주세요</font> -->

															</p>
														</div>
													</div>
												</div>
												<!-- //컨텐츠 -->


											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="styleSelector"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Warning Section Starts -->
		<!-- Older IE warning message -->
		<!--[if lt IE 10]>
        <div class="ie-warning">
            <h1>Warning!!</h1>
            <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
            <div class="iew-container">
                <ul class="iew-download">
                    <li>
                        <a href="http://www.google.com/chrome/">
                            <img src="assets/images/browser/chrome.png" alt="Chrome">
                            <div>Chrome</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.mozilla.org/en-US/firefox/new/">
                            <img src="assets/images/browser/firefox.png" alt="Firefox">
                            <div>Firefox</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.opera.com">
                            <img src="assets/images/browser/opera.png" alt="Opera">
                            <div>Opera</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.apple.com/safari/">
                            <img src="assets/images/browser/safari.png" alt="Safari">
                            <div>Safari</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                            <img src="assets/images/browser/ie.png" alt="">
                            <div>IE (9 & above)</div>
                        </a>
                    </li>
                </ul>
            </div>
            <p>Sorry for the inconvenience!</p>
        </div>
    <![endif]-->
		<!-- Warning Section Ends -->
		<!-- Required Jquery -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resources/assets/js/jquery/jquery.min.js "></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resources/assets/js/popper.js/popper.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
		<!-- waves js -->
		<script
			src="<%=request.getContextPath()%>/resources/assets/pages/waves/js/waves.min.js"></script>
		<!-- jquery slimscroll js -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/pcoded.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/vertical/vertical-layout.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<!-- Custom js -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resources/assets/js/script.js"></script>