<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!-- mypage.jsp<br> -->

<!DOCTYPE html>
<html lang="en">

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">
function goFriendTab(){
   //alert(1);
   $("#friendTab").click();
   
}
function goPictureTab(){
   //alert(1);
   $("#pictureTab").click();
   
}
</script>

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

/* 프로파일 헤더 */
#profileHeader {
	height: 370px;
	background-image:
		url("<%=request.getContextPath()%>/resources/assets/images/members/${ member.background }");
	background-size: 1300px;
	background-position: center;
}

#profileHeader-profile {
	border-radius: 100px;
	margin-top: 110px;
	width: 200px;
	height: 200px;
}

#profileHeader-name {
	font-size: 40px;
	color: black;
	margin-left: 220px;
	margin-top: -70px;
}

#bgImgBtn {
	margin-left: 140%;
	margin-top: -50px;
}

/* 프로파일 nav */
#mainNav{
	height: 60px;
}

#mainNavTab{
	margin-top: -20px;
}

#mainNavContent{
	width: 50%;
	margin-left: 25%;
}

/* 프로파일 컨텐트 */
#content1 {
	width: 1000px;
	margin-left: 25%;
}

#friendProfile {
	border-radius: 10px;
	width: 160px;
	height: 160px;
}

#friendProfile-td{
	padding-top: 10px;
	padding-left: 80px; 

}

#friendProfile2 {
	border-radius: 10px;
	width: 60px;
	height: 60px;
}


</style>

<%@ include file="../top&bottom/top.jsp" %>

<!-- ### 프로필 ### -->
					<div class="pcoded-content">
<!-- ### 프로필 헤더 ### -->
						<!-- Page-header start -->
						<div id="profileHeader" class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">
												<!-- class="img-80 img-radius" -->
												<a href="">
													<c:if test="${ member.profile eq null }">
														<img id="profileHeader-profile"
														src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
														alt="User-Profile-Image">
													</c:if>
													<c:if test="${ member.profile ne null }"> 
														<img id="profileHeader-profile"
														src="<%= request.getContextPath() %>/resources/assets/images/members/${ member.profile }"
														alt="User-Profile-Image">
													</c:if>
												</a>
											</h5>
											<p id="profileHeader-name" class="m-b-0">${ member.name }</p>
											<c:if test="${ fn:contains(mywaits, member.no) }">
												<p id="bgImgBtn"><input type="button" value="친구 수락" class="btn btn-primary waves-effect waves-light"
													onclick="javascript:location.href='accept.fr?no=${ member.no }'"></p>
											</c:if>
											
											<c:if test="${ fn:contains(uwaits, login.no) }">
												<p id="bgImgBtn"><input type="button" value="신청 취소" class="btn btn-default waves-effect"
													style="background-color:#EAEAEA;"
													onclick="javascript:location.href='withdraw.fr?no=${ member.no }'"></p>
											</c:if>
											<c:if test="${ fn:contains(ufriends, login.no) }">
												<p id="bgImgBtn"><input type="button" value="친구 끊기" class="btn btn-default waves-effect"
												style="background-color:#EAEAEA;"
													onclick="javascript:location.href='cancel.fr?no=${ member.no }'"></p>
											</c:if>
											<c:if test="${ fn:contains(ufriends, login.no) eq false }">
												<c:if test="${ fn:contains(uwaits, login.no) eq false }">
													<c:if test="${ fn:contains(mywaits, member.no) eq false }">
														<p id="bgImgBtn"><input type="button" value="친구 신청" class="btn btn-primary waves-effect waves-light"
															onclick="javascript:location.href='request.fr?no=${ member.no }'"></p>
													</c:if>
												</c:if>
											</c:if>
										</div>
									</div>
									<!-- <div class="col-md-4">
										<ul class="breadcrumb">
											<li class="breadcrumb-item"><a href="index.html"> <i
													class="fa fa-home"></i>
											</a></li>
											<li class="breadcrumb-item"><a href="#!">Sample page</a>
											</li>
										</ul>
									</div> -->
								</div>
							</div>
						</div>
						<!-- Page-header end -->
<!-- ### 2-1 끝 ### -->
<!-- ### //프로필 헤더 ### -->


<!-- ### 프로필 nav/컨텐트 ### -->
						<!-- nav -->
						<!-- Material tab card start -->
						<div class="card" id="mainNav">
							<div class="card-block">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs md-tabs" role="tablist" id="mainNavTab">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home3" role="tab">정보</a>
										<div class="slide"></div></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#profile3" role="tab">게시물</a>
										<div class="slide"></div></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#messages3" id="friendTab" role="tab">친구</a>
										<div class="slide"></div></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#settings3" id="pictureTab" role="tab">사진</a>
										<div class="slide"></div></li>
								</ul>
							</div>
						</div>
						<!-- Material tab card end -->

						<!-- Tab panes -->
						<div class="tab-content card-block">
						<!-- 정보 탭 -->
							<div class="tab-pane active" id="home3" role="tabpanel">
								<!-- 소개 -->
								<div id="content1" class="col-xl-6 col-md-12">
									<div class="card table-card">
										<div class="card-header">
											<h5>소개</h5>
										</div>
										<div class="card-block">
											<div style="margin-top: 10px; margin-left: 10px;">${ member.intro }</div>
										</div>
									</div>
								</div>
								<!-- 사진 -->
								<!-- <div id="content1" class="col-xl-6 col-md-12">
									<div class="card table-card">
										<div class="card-header">
											<h5>사진</h5>
											<div class="card-header-right">
												<a href="javascript:goPictureTab()"><font color="#4374D9">모든 사진 보기</font></a>
											</div>
										</div>
										<div class="card-block">
											<p>사진 리스트</p>
										</div>
									</div>
								</div> -->
								<!-- 친구 -->
								<div id="content1" class="col-xl-6 col-md-12">
									<div class="card table-card">
										<div class="card-header">
											<h5>친구</h5>
											<br> 친구 ${ fn:length(friendsList) }명
											<div class="card-header-right">
												<a href="javascript:goFriendTab()"><font color="#4374D9">모든 친구 보기</font></a>
											</div>
										</div>
										<div class="card-block">
											<div class="table-responsive">
												<table>
													<tbody>
														<tr>
														<c:forEach var="friend" items="${ friendsList }" varStatus="i">
															<c:if test="${ i.count <= 4 }">
																<td id="friendProfile-td">
																		<c:if test="${ friend.profile eq null }">
																			<c:if test="${ friend.no eq login.no }">
																				<a href="myprofile.pro"><img
																				id="friendProfile"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/profile.png"
																				alt="User-Profile-Image"></a>
																			</c:if>
																			<c:if test="${ friend.no ne login.no }">
																				<a href="profile.pro?no=${ friend.no }"><img
																				id="friendProfile"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/profile.png"
																				alt="User-Profile-Image"></a>
																			</c:if>
																		</c:if>
																		<c:if test="${ friend.profile ne null }">
																			<c:if test="${ friend.no eq login.no }">
																				<a href="myprofile.pro"><img
																				id="friendProfile"
																				src="<%= request.getContextPath() %>/resources/assets/images/members/${ friend.profile }"
																				alt="user image"
																				class="img-radius img-40 align-top m-r-15"></a>
																			</c:if>
																			<c:if test="${ friend.no ne login.no }">
																				<a href="profile.pro?no=${ friend.no }"><img
																				id="friendProfile"
																				src="<%= request.getContextPath() %>/resources/assets/images/members/${ friend.profile }"
																				alt="user image"
																				class="img-radius img-40 align-top m-r-15"></a>
																			</c:if>
																		</c:if>
																			<br><a href="profile.pro?no=${ friend.no }"><h6>${ friend.name }</h6></a>
																</td>
																<c:if test="${ i.count == 2 }">
																	</tr>
																	<tr>
																</c:if>
															</c:if>	
														</c:forEach>
													</tbody>
												</table>
												
												<c:if test="${ fn:length(friendsList) > 4 }">
													<hr>
													<div align="center">
														<a href="javascript:goFriendTab()"><font color="#4374D9">친구 더보기</font></a>
													</div>
												</c:if>

											</div>
										</div>
									</div>
								</div>
								<!-- //친구 -->
							
							
							
								
							<!-- 게시글 탭 -->
							</div>
							<div class="tab-pane" id="profile3" role="tabpanel">
								<%@ include file="myWriteList.jsp" %>
							</div>
							
							<!-- 친구 탭 -->
							<div class="tab-pane" id="messages3" role="tabpanel">
								<!-- 친구 -->
								<div class="card" id="mainNavContent">
									<div class="card-block">
										<h5>친구</h5>
										
										<div class="card-block">
											<div class="table-responsive">
												<table class="table table-hover m-b-0 without-header">
													<tbody>
														<c:if test="${ friendsList eq null }">
															<center><h6>표시할 친구가 없습니다</h6></center>
														</c:if>
														<c:forEach var="friend" items="${ friendsList }">
															<tr>
																<td>
																	<div class="d-inline-block align-middle">
																		<c:if test="${ friend.profile eq null }">
																			<c:if test="${ friend.no eq login.no }"> <!-- 로그인 유저인 경우 -->
																				<a href="myprofile.pro"><img
																				id="friendProfile2"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/profile.png"
																				alt="User-Profile-Image"></a>
																			</c:if>
																			<c:if test="${ friend.no ne login.no }"> <!-- 로그인 유저 아닌 경우 -->
																				<a href="profile.pro?no=${ friend.no }"><img
																				id="friendProfile2"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/profile.png"
																				alt="User-Profile-Image"></a>
																			</c:if>
																		</c:if>
																		<c:if test="${ friend.profile ne null }">
																			<c:if test="${ friend.no eq login.no }"> <!-- 로그인 유저인 경우 -->
																				<a href="myprofile.pro"><img
																				id="friendProfile2"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/${ friend.profile }"
																				alt="User-Profile-Image"></a>
																			</c:if>
																			<c:if test="${ friend.no ne login.no }"> <!-- 로그인 유저 아닌 경우 -->
																				<a href="profile.pro?no=${ friend.no }"><img
																				id="friendProfile2"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/${ friend.profile }"
																				alt="User-Profile-Image"></a>
																			</c:if>
																		</c:if>
																		<div class="d-inline-block">
																			<h6>
																				&nbsp;&nbsp;&nbsp;<a href="profile.pro?no=${ friend.no }">${ friend.name }</a>
																			</h6>
																			<!-- <p class="text-muted m-b-0">Sales executive , NY</p> -->
																		</div>
																	</div>
																</td>
																<td class="text-right">
																	<h6 class="f-w-700">
																		<input type="button" value="프로필 보기" class="btn btn-primary waves-effect waves-light" 
																			style="margin-left: 50%;"
																			onclick="javascript:location.href='profile.pro?no=${ friend.no }'">
																	</h6>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										
									</div>
								</div>
								<!-- //친구 -->	
							
							<!-- 사진 탭 -->
							</div>
							<div class="tab-pane" id="settings3" role="tabpanel">
                        <p class="m-0">
                        <div class="card" id="mainNavContent" style="width:70% !important; margin-left:180px; margin-right:5px;">
	                        <div class="card-block">
	                        	<div class="container" style="float: left;">
									<div class="carousel-inner" style="float: left;">
				                        <c:forEach var="i" items="${lists }" varStatus="statusNm">
											<%String imgurl = request.getContextPath()+"/resources/assets/images/upload/";  %>
											<c:set var="image" value="${fn:split(i.image ,',')}"/>
											<c:forEach var="img" items="${image}" varStatus="status">
												<c:if test="${status.count ne 0}">
						                           <img class="d-block w-100" src="<%=imgurl %>${img }"
												 		id="myPhoto" onClick="detailPost(${i.wno},${login.no })" data-toggle="modal" data-target="#detailPost"
												 		style="float: left; width:300px !important; height:350px; padding-right:10px; padding-top:10px;">
												</c:if>
											</c:forEach>
	                        			</c:forEach>
	                        		</div>
			                     </div>
	                        </div>
                        </div>
                        </p>
                     </div>
						</div>
						
					</div>
<!-- ### //프로필 컨텐트 ### -->
<!-- ### // nav 이외 영역 ###	 -->
					<div class="card"></div>
					<div class="card"></div>
					<div id="styleSelector"></div>
				</div>
			</div>
		</div>
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
</body>

</html>