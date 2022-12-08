<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="../write/AllModal.jsp" %>
<!-- mypage.jsp<br> -->

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

#mypageHeader {
	height: 370px;
	background-image:
		url("<%=request.getContextPath()%>/resources/assets/images/members/${ login.background }");
}

#mypageProfile {
	border-radius: 100px;
	margin-top: 110px;
	width: 200px;
	height: 200px;
}

.profile {
	border-radius: 100px;
	width: 60px;
	height: 60px;
}

#mypageName {
	font-size: 40px;
	color: black;
	margin-left: 220px;
	margin-top: -70px;
}

#bgImgBtn {
	margin-left: 1000px;
	margin-top: -30px;
}

#intro {
	width: 500px;
}

#friendList {
	width: 500px;
}
video {
    width: 100%;
    height: 400px;
    object-fit: fill;
}
.tableHeader {
    display: inline-block;
    width: 100%;
}
.post{
	height:33px;
	font-size: 7pt;
	text-align:center;
	background-color:#fff;
	vertical-align:top;
	padding-left :10px !important;
	padding-top :5px !important;
	width:50px;
}
</style>

<%@ include file="./../write/script.jsp" %>

<%@ include file="../top&bottom/top.jsp"%>
<!-- ### 1 끝 ### -->
<!-- ### 2 메인 ### -->
<div class="pcoded-content">
	<!-- ### 2-1 메인 해더 ### -->
	<!-- Page-header start -->
	<div id="mypageHeader" class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">
							<!-- class="img-80 img-radius" -->
							<a href="updateImage.pro?img=profile"> <c:if
									test="${ login.profile eq null }">
									<img id="mypageProfile"
										src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
										alt="User-Profile-Image">
								</c:if> <c:if test="${ login.profile ne null }">
									<img id="mypageProfile"
										src="<%= request.getContextPath() %>/resources/assets/images/members/${ login.profile }"
										alt="User-Profile-Image">
								</c:if>
							</a>
						</h5>
						<p id="mypageName" class="m-b-0">${ login.name }</p>
						<p id="bgImgBtn">
							<input type="button" value="배경 사진 추가"
								onclick="javascript:location.href='updateImage.pro?img=background'">
						</p>
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

	<!-- ### 2-2 메인 컨텐츠 ### -->
	<!-- nav -->
	<!-- Material tab card start -->
	<div class="card">
		<div class="card-block">
			<!-- Row start -->
			<div class="row m-b-30">
				<div class="col-lg-12 col-xl-6">

					<!-- Nav tabs -->
					<ul class="nav nav-tabs md-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#home3" role="tab">게시물</a>
							<div class="slide"></div></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#profile3" role="tab">정보</a>
							<div class="slide"></div></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#messages3" role="tab">친구</a>
							<div class="slide"></div></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#settings3" role="tab">사진</a>
							<div class="slide"></div></li>
					</ul>
				</div>
			</div>
			<!-- Row end -->
		</div>
	</div>
	<!-- Material tab card end -->

	<!-- Lists  -->
	<c:forEach var="wb" items="${lists }" varStatus="statusNm">

		<div class="col-sm-4" style="float: left;">
			<div class="card" id="writeBox">
				<div class="card-block" onClick="detailPost(${wb.wno})" style="height: 500px;" data-toggle="modal" data-target="#detailPost">
					<div class="container">
						<c:if test="${wb.contents ne null }">
							<p>${wb.contents }</p>
						</c:if>
						<br> <br>
						<c:if test="${wb.image ne null }">

							<!-- 이미지 시작 -->
							<link rel="stylesheet"
								href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
								integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
								crossorigin="anonymous">
							<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
								integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
								crossorigin="anonymous"></script>
							<script
								src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
								integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
								crossorigin="anonymous"></script>
							<script
								src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
								integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
								crossorigin="anonymous"></script>


							<div id="demo${wb.wno }" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<!-- 슬라이드 쇼 -->
									<!--가로-->
									<%String imgurl = request.getContextPath()+"/resources/assets/images/upload/";  %>
									<c:set var="image" value="${fn:split(wb.image ,',')}"></c:set>
									<c:forEach var="img" items="${image}" varStatus="status">
										<c:if test="${status.count eq 1}">
											<div class="carousel-item active">
												<img class="d-block w-100" src="<%=imgurl %>${img }"
													alt="First slide">
											</div>
										</c:if>
										<c:if test="${status.count > 1}">
											<div class="carousel-item">
												<img class="d-block w-100" src="<%=imgurl %>${img }"
													alt="slide">
											</div>
										</c:if>
										<!-- 인디케이터 -->
										<ul class="carousel-indicators">
											<li data-target="#demo${wb.wno }" data-slide-to="0"
												class="active"></li>
											<!--0번부터시작-->
											<li data-target="#demo${wb.wno }" data-slide-to="1"></li>
											<li data-target="#demo${wb.wno }" data-slide-to="2"></li>
										</ul>
										<!-- 인디케이터 끝 -->
									</c:forEach>
								</div>
								<!-- / 슬라이드 쇼 끝 -->

								<!-- 왼쪽 오른쪽 화살표 버튼 -->
								<a class="carousel-control-prev" href="#demo${wb.wno }"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next" href="#demo${wb.wno }"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
								<!-- / 화살표 버튼 끝 -->
							</div>
						</c:if>
						<!-- 이미지끝 -->

						<!-- video -->
						<%String videourl = request.getContextPath()+"/resources/assets/images/video/"; %>
						<c:if test="${wb.video ne null }">
							<video class="showVideo" src="<%=videourl %>${wb.video }"
								autoplay loop muted controls></video>
						</c:if>
					</div>
				</div>
				<div class="card-header comment">
					<span class="pcoded-micon"> 
						<span id="bookmark" style="display: inline-block; margin-left: 15px;"> 
						<a href="javascript:return false;" style="text-decoration: none;">
						<c:if test="${fn:contains(checkedBooks,wb.wno) }">
							<i id="b_bookedmark${wb.wno }" class="bi bi-bookmark-check-fill"
							onclick="bookmarkCancle(${wb.wno})" style="display: inline; color: #FFD732;"></i>
						</c:if> 
						<c:if test="${fn:contains(checkedBooks,wb.wno) eq false }">
							<i id="b_bookmark${wb.wno }" class="bi bi-bookmark-dash" onclick="bookmarked(${wb.wno})"></i>
						</c:if> 
						<i class="bi bi-bookmark-check-fill" id="a_bookmark${wb.wno }"
								style="display: none;" onclick="bookmarked(${wb.wno})"></i> 
						<i class="bi bi-bookmark-dash" id="b_bookmark${wb.wno }"
								style="display: none;" onclick="bookmarkCancle(${wb.wno})"></i>
						</a>
						</span>
					</span>

					<script type="text/javascript"
						src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
					<script type="text/javascript">
						function bookmarked(wno){
							//alert(wno);
							$.ajax({
								url : "bookmarked.wr",
								data : {wno : wno},
								type:"post",
						        dataType:"json",
								success : function(data){
									//alert('bookmark : '+data);
									$('#b_bookedmark'+wno).hide()
									$('#b_bookmark'+wno).hide()
									$('#a_bookmark'+wno).attr('style','display:inline; color: #FFD732;' );
									$('#b_bookmark'+wno).attr('style','display:none;');
								},
								error : function(){
									alert("북마크 에러");
								}
							}); //ajax
						}//bookmarked
						
						function bookmarkCancle(wno){
							//alert('bookmarkCancle : '+wno);
							$.ajax({
								url : 'bookmarkCancle.wr',
								data : {wno : wno},
								type : 'get',
								success : function(data){
									//alert(data);
									$('#b_bookedmark'+wno).hide()
									$('#b_bookmark'+wno).hide()
									$('#a_bookmark'+wno).attr('style','display:none;' );
									$('#b_bookmark'+wno).attr('style','display:inline;');
								},
								error : function(){
									alert("북마크 캔슬에러");
								}
							}); //ajax
						} //bookmarkCancle
					</script>
				</div>

			</div>
			<!-- card end -->
		</div>
	</c:forEach>

	<!-- lists end -->

</div>
<%@ include file="../top&bottom/bottom.jsp"%>