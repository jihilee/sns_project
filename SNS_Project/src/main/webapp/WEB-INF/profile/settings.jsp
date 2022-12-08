<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!-- setting.jsp<br> -->

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
	width: 40%;
	margin-left: 35%;
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


<%@ include file="../top&bottom/top.jsp" %>

<div class="pcoded-inner-content">
	<div class="main-body">
		<div class="page-wrapper">
			<div class="page-body">
				<div class="row">

					<!-- 컨텐츠 -->
					<div class="col-sm-12">
						<div class="card" id="content">
							<div class="card-header">
								<h4>설정 및 개인정보</h4>
								<span></span>
								<hr>
								<table>
									<tr height="40px">
										<td><a href="modify1.mem"><font size="3px">회원정보
													수정</font></a></td>
									</tr>
									<tr>
										<td><a href="deactivate1.mem"><font size="3px">계정
													비활성화 및 삭제</font></a></td>
									</tr>
								</table>
								<!-- <a href="modify1.mem"><font size="3px">회원정보 수정</font></a><br>
														<a href="deactivate1.mem"><font size="3px">계정 비활성화 및 삭제</font></a> -->

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