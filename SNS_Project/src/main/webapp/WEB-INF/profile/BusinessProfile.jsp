<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/bootstrap/css/bootstrap.css">	


<head>
<title>Business Profile</title>

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
		url("<%=request.getContextPath()%>/resources/assets/images/members/${ login.background }");
	background-size: 1300px;
	background-position: center;
}

#profileHeader-profile {
	border-radius: 100px;
	margin-top: 110px;
	width: 200px;
	height: 200px;
}

#profileImgBtn{
	border-radius: 100px;
	width: 50px;
	height: 50px;
	margin-top: 250px;
	margin-left: -60px;
}

#profileHeader-name {
	font-size: 40px;
	color: black;
	margin-left: 220px;
	margin-top: -70px;
}

#bgImgBtn {
	margin-left: 1000px;
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
	width: 70%;
	margin-left: 150px;
}

/* 프로파일 컨텐트 */
#content1 {
	width: 500px;
}

#friendProfile {
	border-radius: 10px;
	width: 160px;
	height: 160px;
}

#friendProfile-td{
	padding-top: 10px;
	padding-left: 40px; 

}

#friendProfile2 {
	border-radius: 10px;
	width: 60px;
	height: 60px;
}
.mywrite-left .mywrite-right{
    float: left;
    margin-right:0px !important;   
}




</style>
<%@include file="/WEB-INF/top&bottom/top.jsp"%>
<%@include file="../write/style.jsp"%>		
<%@include file="../write/script.jsp"%>		

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
												<a href="updateImage.pro?img=profile"> 
													<c:if test="${ login.profile eq null }">
														<img id="profileHeader-profile"
															src="<%=request.getContextPath()%>/resources/assets/images/members/profile.png"
															alt="User-Profile-Image">
													</c:if> 
													<c:if test="${ login.profile ne null }">
														<img id="profileHeader-profile"
															src="<%= request.getContextPath() %>/resources/assets/images/members/${ login.profile }"
															alt="User-Profile-Image">
													</c:if>
												</a>
												<a href="updateImage.pro?img=profile">
													<img id="profileImgBtn"
																src="<%=request.getContextPath()%>/resources/assets/images/profile-upload.png"
																alt="User-Profile-Image">
												</a>
											</h5>
											<p id="profileHeader-name" class="m-b-0">${ login.name }</p>
											<p id="bgImgBtn">
												<input type="button" value="배경 사진 추가" class="btn btn-default waves-effect"
													onclick="javascript:location.href='updateImage.pro?img=background'">
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
<!-- Page-header end -->
<!-- ### //프로필 헤더 ### -->


<!-- ### 프로필 nav/컨텐트 ### -->
						<!-- nav -->
						<!-- Material tab card start -->
						<div class="card" id="mainNav">
							<div class="card-block">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs md-tabs" role="tablist" id="mainNavTab">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home3" role="tab">목록</a>
										<div class="slide"></div></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#profile3" role="tab">글쓰기</a>
										<div class="slide"></div></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#messages3" id="friendTab" role="tab">팔로우한계정들</a>
										<div class="slide"></div></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#settings3" id="pictureTab" role="tab">회사소개</a>
										<div class="slide"></div></li>
								</ul>
							</div>
						</div>
						<!-- Material tab card end -->
				
						<!-- Tab panes -->
					<div class="tab-content card-block">
							<div class="tab-pane active" id="home3" role="tabpanel">
								<div class="card" id="mainNavContent">
							<div class="row" style="justify-content: flex-center;">
								<!-- 소개 -->
										
										<div class="card-block">
											<div style="margin-top: 10px; margin-left: 10px;">${ login.intro }</div>
											
							
							
							
					<!-- Lists  -->
				<c:forEach var="wb" items="${lists }">
				<div class="col-sm-6">
                   <div class="card" id="writeBox">
                       <div class="card-header" id="writeBox">
   								<div style=" display: inline-block;" >
   									 <c:if test="${ wb.profile eq null }">
										<img id="navProfile"
											src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
											alt="User-Profile-Image" style="display: inline-block;">
									</c:if>
									<c:if test="${ wb.profile ne null }">
										<img id="navProfile"
										src="<%= request.getContextPath() %>/resources/assets/images/members/${ wb.profile }"
										alt="User-Profile-Image" style="display: inline-block;">
									</c:if> 
								</div>                  
								<span style="display: inline-block; vertical-align: top;">${wb.name}</span>
								<span class="badge bg-secondary" style=" vertical-align: top;">${wb.scope }</span>
							    <div class="dropdown">
							    <fmt:parseDate value="${wb.upload_date }" var="upload_date" pattern="yyyy-MM-dd"/>
							    <fmt:formatDate value="${upload_date}" var="upload_date" pattern="yyyy-MM-dd"/>
							    <span style="color: gray;">${upload_date}</span>
								<span style="display: inline-block; vertical-align: top; float: right;">
									<img  class="dropbtn" src="./resources/logo/dot.png" width="20px">
								      <div class="dropdown-content">
								        <a href="bnprofile.pro?no=${wb.no }">프로필</a> <!-- mypage로 이동 -->
								      </div>
								    </div>
								</span>
							    
								<span><a href="" style="text-decoration: none;">${wb.location }</a></span>
								<span style="display:inline-block;">
								<c:if test="${not empty wb.f_tag }">
									<c:set var="tag" value="${fn:split(wb.f_tag,',') }"/>
									<c:set var="fnum" value="${fn:split(friendsArr,',') }"/>
									<c:forEach var="tag" items="${tag }" varStatus="status">
										<c:forEach var="fn" items="${fnum }">
										<a href="profile.pro?no=${friendsArr[status.index]}">@${tag}</a>										
										</c:forEach>
									</c:forEach>
								</c:if>
								</span>
	                   	</div>
                    <div class="card-block">
                           <div class="container">
                           	<c:if test="${wb.contents ne null }">
                           	<p>${wb.contents }</p><br><br>
                           	<c:if test="${wb.link ne null }">
                           	<p><a href="${wb.link}">사이트 확인해보기</a></p>
                           	</c:if>
                           	</c:if>
                           	<br>
                           	<br>
                           	<c:if test="${wb.image ne null }">
 		
 		<!-- 이미지 시작 -->	
	        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
			    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
			    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			    crossorigin="anonymous"></script>
			  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			    crossorigin="anonymous"></script>
			  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			    crossorigin="anonymous"></script>
			
			
			  <div id="demo${wb.wno }" class="carousel slide" data-ride="carousel">
			    <div class="carousel-inner">
			      <!-- 슬라이드 쇼 -->
			        <!--가로-->
			        <%String imgurl = request.getContextPath()+"/resources/assets/images/upload/";  %>
					<c:set var="image" value="${fn:split(wb.image ,',')}"></c:set>
					<c:forEach var="img" items="${image}" varStatus="status">
						<c:if test="${status.count eq 1}">
							 <div class="carousel-item active">
								 <img class="d-block w-100" src="<%=imgurl %>${img }" alt="First slide">
							</div>
						</c:if>
						<c:if test="${status.count > 1}">
						 <div class="carousel-item">
							 <img class="d-block w-100" src="<%=imgurl %>${img }" alt="slide">
						</div>
						</c:if>
					<!-- 인디케이터 -->
				    <ul class="carousel-indicators">
				      <li data-target="#demo${wb.wno }" data-slide-to="0" class="active"></li> <!--0번부터시작-->
				      <li data-target="#demo${wb.wno }" data-slide-to="1"></li>
				      <li data-target="#demo${wb.wno }" data-slide-to="2"></li>
				    </ul>
			    <!-- 인디케이터 끝 -->
				</c:forEach>
			    </div>
			    <!-- / 슬라이드 쇼 끝 -->
			
			    <!-- 왼쪽 오른쪽 화살표 버튼 -->
			    <a class="carousel-control-prev" href="#demo${wb.wno }" data-slide="prev">
			      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			      <span class = "sr-only">Previous</span>
			    </a>
			    <a class="carousel-control-next" href="#demo${wb.wno }" data-slide="next">
			      <span class="carousel-control-next-icon" aria-hidden="true"></span>
			      <span class = "sr-only">Next</span>
			    </a>
			    <!-- / 화살표 버튼 끝 -->
			  </div>
  		</c:if>
  		<!-- 이미지끝 -->
  		
      
       </div>
</div>
<!-- id=writeBox  -->
	<div class="card-header comment">
		<span class="pcoded-micon"> 
									
		<span id="like" style="display: inline-block; margin-left:10px; ">
                                 <a href="javascript:return false;">
                                       <c:if test="${fn:contains(likedWnoLists, wb.wno)}">   
                                          <i id="a_like${wb.wno }" class="bi bi-heart-fill" onclick="minus_like(${wb.wno},${login.no })"
                                          ></i>
                                       </c:if>
                                       <c:if test="${fn:contains(likedWnoLists, wb.wno) eq false}">  
                                          <i id="b_like${wb.wno }" class="bi bi-heart" onclick="plus_like(${wb.wno},${login.no })" 
                                           ></i>
                                       </c:if>
                                    <i id="a_like${wb.wno }"  class="bi bi-heart-fill" onclick="minus_like(${wb.wno},${login.no })" style="display: none;"></i>
                                    <i id="b_like${wb.wno }" class="bi bi-heart" onclick="plus_like(${wb.wno},${login.no })" style="display: none;"></i>
                                 <i  class="bi bi-heart-fill" id="a_like${wb.wno }" style="display:none;" onclick="minus_like(${wb.wno},${login.no })" ></i> 
                                 </a>
                                    <span style="display:inline-block; color: #148CFF;" id="likesCount${wb.wno }">${wb.likes }</span>
                              </span>
										
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>	
			<script type="text/javascript">
				function plus_like(wno,no){
					//alert(wno+"/"+no);
					$.ajax({
						url : 'likes.wr',
						data : {"wno" : wno,
								"no" : no},
						type : 'get',
						success : function(data){
							//alert(data);
							$("#likesCount"+wno).empty();
							$('#likesCount'+wno).append(data);
							$('#b_like'+wno).attr('style','display:none;');
							//alert(1);
							$('#a_like'+wno).attr('style','display:inline;');
							//alert(2);
							$('#filledHeart').hide();
							$('#emptyHeart').hide();
						
						},
						error : function(){
							alert("좋아요 플러스 에러");
						}
					}); //ajax
				} //plus_like
				
			
				function minus_like(wno,no){
					//alert(wno+"/"+no);
					$.ajax({
						url : 'minusLikes.wr',
						data : {"wno" : wno,
								"no" : no},
						type : 'get',
						success : function(data){
							//alert(data);
							$("#likesCount"+wno).empty();
							$('#likesCount'+wno).append(data);
							$('#b_like'+wno).attr('style','display:inline;' );
							$('#a_like'+wno).attr('style','display:none;');
							$('#emptyHeart').hide();
							$('#filledHeart').hide();	
						},
						error : function(){
							alert("좋아요 마이너스에러 에러");
						}
					}); //ajax
				} //minus_like
             
               </script>
										

					<span id="bookmark" style="display: inline-block; margin-left:15px; ">
						<a href="javascript:return false;" style="text-decoration: none;">
							<c:if test="${fn:contains(checkedBooks,wb.wno) }">
								<i id="b_bookedmark${wb.wno }" class="bi bi-bookmark-check-fill" 
								onclick="bookmarkCancle(${wb.wno})" style="display:inline; color: #FFD732;"></i>
							</c:if>
							<c:if test="${fn:contains(checkedBooks,wb.wno) eq false }">
								<i id="b_bookmark${wb.wno }" class="bi bi-bookmark-dash" onclick="bookmarked(${wb.wno})"></i>
							</c:if>
							<i class="bi bi-bookmark-check-fill" id="a_bookmark${wb.wno }" style="display:none;" onclick="bookmarkCancle(${wb.wno})"></i>
							<i class="bi bi-bookmark-dash" id="b_bookmark${wb.wno }" style="display:none;" onclick="bookmarked(${wb.wno})"></i>
						</a>
					</span>
										
					<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>	
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
										
		<div style="float: right;">
			
		</div>
	</span>
</div>

<!-- #modify start -->	


	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>					
	<script type="text/javascript">
		var isRun = false;

		function modify(wno){
			if(isRun == true){
				return;
			}
			//alert(wno);
			isRun = true;
			
			$.ajax({
				url:'update.wr',
				data : {"wno":wno},
				type : 'get',
				success: function(map){
					//alert(map.contents);
					console.log(map.wno); 
					console.log(map.no);
					console.log(map.contents); 
					console.log(map.video); 
					console.log(map.image); 
					console.log(map.scope); 
					console.log(map.upload_date); 
					console.log(map.location); 
					console.log(map.address); 
					console.log(map.f_tag); 
					console.log(map.likes); 
					
					console.log("img1:"+map.img1);
					console.log(map.img2);
					console.log(map.img3);
					console.log("img4:"+map.img4);
					console.log("img5:"+map.img5);
				
					/*

					*/
					var value="";
					if(map.scope == "public"){
						value = "전체공개";
					}
					else if(map.scope == "onlyFriends"){
						value="친구만보기";
					}
					else {
						value="나만보기";
					}
					
					$('#scope').append("<option id='map_scope' value="+map.scope+">"+value+"</option>");
					
					$('input[name="no"]').attr('value',map.no);
					$('input[name="wno"]').attr('value',map.wno);
					$('#contents').append(map.contents);
					
					var url = '<%=request.getContextPath()%>/resources/assets/images/upload/';
					var vurl = '<%=request.getContextPath()%>/resources/assets/images/video/';
					if(map.img1 != null){
						$('#getImg').append('<ul id="ulGetImg"><li><img id="img1" class="getImgs"><li>');
						$('#img1').attr('src',url+map.img1);
					}
					if(map.img2 != null){
						$('#ulGetImg').append('<li><img id="img2" class="getImgs"><li>');
						$('#img2').attr('src',url+map.img2);
					}
					if(map.img3 != null){
						$('#ulGetImg').append('<li><img id="img3" class="getImgs"><li>');
						$('#img3').attr('src',url+map.img3);
					}
					if(map.img4 != null){
						$('#ulGetImg').append('<li><img id="img4" class="getImgs"><li>');
						$('#img4').attr('src',url+map.img4);
					}
					if(map.img1 != null){
						$('#getImg').append('</ul>');
						$('.beforeImg').show();
					}
					if(map.video != null){
						$('#getVideo').attr('src',vurl+map.video);
						$('.beforeVideo').show();
					}
					$('input[name="beforeImage"]').attr('value',map.image);
					$('input[name="beforeVideo"]').attr('value',map.video);
					$('select[name="scope"]').attr('value',map.scope);
					$('input[name="upload_date"]').attr('value',map.upload_date);
					$("#location").append(map.location+ " "); 
					$('input[name="location"]').attr('value',map.location);
					$('#map_location').attr('value',map.location);
					$('input[name="address"]').attr('value',map.address);
					$('#frinedsList').attr('value',map.f_tag);
					$('input[name="likes"]').attr('value',map.likes);
					$('#modifyWrite').modal('show');
					
				},
				error : function(){
					alert('에러여요');
				}
			});//ajax
			
			
		}
	
	</script>			
		
<!-- #modify end-->		
<!-- reply start -->



        
        <!--  <!-- reply end -->            
                </div>
            </div>

</c:forEach>
<!-- lists end -->	       
<!-- include위치랑 script위치 절대 바꾸면 안됨 -->             
   

<script type="text/javascript">

( /* i_att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  Insert_imageView = function (abc_zon, btn){
	//alert(1);
    var abczone = document.getElementById(i_att_zone);
    var imgfile1 = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;margin:auto;'
                  + 'width:150px;height:120px;margin:5px;border:1px #368AFF;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:15px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:#368AFF;color:#ffffff;border: 1px #ffffff;';
  
    imgfile1.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
    // 탐색기에서 드래그앤 드롭 사용
    abczone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    abczone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
  
    abczone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
    }, false)
    

    
    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        abczone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        imgfile1.files = dt.files;
        var p = ele.parentNode;
        abczone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('abc_zone', 'imgfile1') //imgfile or videofile 

</script>
</div>
</div>
									
							</div>
							</div>
							
							<div class="tab-pane" id="profile3" role="tabpanel">
								<div class="card" id="mainNavContent">
								 <div class="card-header">
											<h5>게시글 작성</h5>
										</div>
									<div class="col-sm-8" id="writeBox" style="margin-top: 80px;">
                     <form name="wForm" action="bnwrite.wr" method="post" enctype="multipart/form-data">
                        <div class="card" style="padding-left: 10px;">
                        
                         <div class="card-header" style="height:40px;">
                             <h6 class="card-title" style="height:40px; padding-left: 10px;"><strong>#광고를 상세히 입력하세요</strong></h6>
                           </div> 
                          
                           <div class="card-header">
                                <div class="waves-effect waves-light" style="display: inline-block;">
                                             <c:if test="${ login.profile eq null }">
                                          <img id="sideProfile"
                                             src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
                                             alt="User-Profile-Image" style="display: inline-block; ">
                                    </c:if>
                                    <c:if test="${ login.profile ne null }">
                                      <img id="sideProfile"
												src="<%=request.getContextPath()%>/resources/assets/images/members/${ login.profile }"
                                       alt="User-Profile-Image" style="display: inline-block;">
                                    </c:if> 
                                         </div>
                                 <input type="hidden" value="${login.no }" name="no">
                              <div style="display: inline-block; vertical-align: top;">
                                <span style="font-size: 12pt; padding-left: 5px;">&nbsp;&nbsp;${login.name }</span><br>
                                 &nbsp;&nbsp;
                                 <input type="hidden" name="scope" class="form-select" value="public" readonly >전체공개
                                   
                              </div>
                              </div>
                            
                           </div>
                           <div class="card-block" >
                              <textarea name="contents" placeholder="${login.name }님, 어떤 게시물을 올릴 예정이신가요?"
                                 rows="10" cols="300" class="form-control"
                                 style="resize: none;"></textarea>
   
                              <div class="container" style="float: right;">
                              <br><br>
                                 
                                 <!-- 이미지  -->
                                    <a href="" style="text-decoration: none;"> <img src="resources/logo/image2.png"
                                       width="40px" id="img">
                                    </a> 
                                    <input type="file" accept=".jpg, .png" multiple name="Insert_images" id="imgfile" style="display: none;"> 
                                    
                                
                                 <!-- url  -->
                                    <img src="resources/logo/url2.png"
                                       width="40px" id="url" onclick="image()">
                                    
                                    <input type="url" accept=""  placeholder="https://example.com"  name="link" style="display;">
                                    
                                    <div style='float: right;'>
                                       <input type="submit" value="등록" class="btn btn-primary" id="uploadBtn" ><br><br>
                                    </div>
                             	 </div>
                           </div> 
                           </form>
  	 <!-- upload image size and type test start-->
<%@include file="../write/script.jsp"%>		
	<!-- upload image size and type test end-->

	<!--upload preview start -->
		<div id='Insert_image_preview'>
			<div id='abc_zon' data-placeholder='파일을 첨부 하려면 버튼을 클릭하거나 드래그앤드롭 하세요'>
			 	<div style="display: none;" class='video-prev' class="pull-right">
		    	   <video height="100" width="180" class="video-preview" autoplay muted controls="controls"/>
				 </div>
			</div>
		</div>
	</div> 
	</div>
	</div>
	
							<div class="tab-pane" id="messages3" role="tabpanel">
								
								<%-- 
								<div class="card" id="mainNavContent">
									<div class="card-block">
										<h5>좋아요</h5>
										
									</div>
								</div>
								<div class="card" id="mainNavContent">
									<div class="card-block">
										<h5>북마크</h5>
										
									</div>
								</div> --%>
							
							
							
							
								
							<!-- 게시글 탭 -->
					<!-- 		</div> -->
						
							<div class="tab-pane" id="profile3" role="tabpanel">
								<p class="m-0">
									<%-- <%@ include file="myWriteList.jsp" %> --%>
									<!-- 회색 버튼이 사라져요 ㅠㅠ -->
								</p>
							</div>
							
							<!-- 친구 탭 -->
							<div class="tab-pane" id="messages3" role="tabpanel">
								<!-- 친구 추천 -->
								<!-- <div class="card" id="mainNavContent">
									<div class="card-block">
										<h5>친구 추천</h5>
										
										<div class="card-block">
											<div class="table-responsive">
												<a href="profile.pro?no=9">### 9번 회원 프로필 ###</a>
												<a href="profile.pro?no=2">### 2번 회원 프로필 ###</a>
											</div>
										</div>
										
									</div>
								</div> -->
								<!-- //친구 추천 -->
								<!-- 친구 요청 -->
								<div class="card" id="mainNavContent">
									<div class="card-block">
										<h5>친구 요청</h5>
										
										<div class="card-block">
											<div class="table-responsive">
												<table class="table table-hover m-b-0 without-header">
													<tbody>
														<c:if test="${ waitsList eq null }">
															<center><h6>친구 요청이 없습니다</h6></center>
														</c:if>
														<c:forEach var="wait" items="${ waitsList }">
															<tr>
																<td>
																	<div class="d-inline-block align-middle">
																		<c:if test="${ wait.profile eq null }">
																			<a href="profile.pro?no=${ wait.no }"><img
																				id="friendProfile2"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/profile.png"
																				alt="User-Profile-Image"></a>
																		</c:if>
																		<c:if test="${ wait.profile ne null }">
																			<a href="profile.pro?no=${ wait.no }"><img
																				id="friendProfile2"
																				src="<%= request.getContextPath() %>/resources/assets/images/members/${ wait.profile }"
																				alt="user image"
																				class="img-radius img-40 align-top m-r-15"></a>
																		</c:if>
																		<div class="d-inline-block">
																			<h6>
																				<a href="profile.pro?no=${ wait.no }">${ wait.name }</a>
																			</h6>
																			<!-- <p class="text-muted m-b-0">ales executive , NY</p> -->
																		</div>
																	</div>
																</td>
																<td class="text-right">
																	<h6 class="f-w-700">
																		<input type="button" value="친구 수락" class="btn btn-primary waves-effect waves-light" 
																			onclick="javascript:location.href='accept.fr?no=${ wait.no }'"><br>
																		<input type="button" value="친구 거절" class="btn btn-default waves-effect"
																			onclick="javascript:location.href='refuse.fr?no=${ wait.no }'">
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
								<!-- //친구 요청 -->
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
																			<a href="profile.pro?no=${ friend.no }"><img
																				id="friendProfile2"
																				src="<%=request.getContextPath()%>/resources/assets/images/members/profile.png"
																				alt="User-Profile-Image"></a>
																		</c:if>
																		<c:if test="${ friend.profile ne null }">
																			<a href="profile.pro?no=${ friend.no }"><img
																				id="friendProfile2"
																				src="<%= request.getContextPath() %>/resources/assets/images/members/${ friend.profile }"
																				alt="user image"
																				class="img-radius img-40 align-top m-r-15"></a>
																		</c:if>
																		<div class="d-inline-block">
																			<h6>
																				<a href="profile.pro?no=${ friend.no }">${ friend.name }</a>
																			</h6>
																			<!-- <p class="text-muted m-b-0">Sales executive , NY</p> -->
																		</div>
																	</div>
																</td>
																<td class="text-right">
																	<h6 class="f-w-700">
																		<input type="button" value="친구 끊기" class="btn btn-default waves-effect" 
																			onclick="javascript:location.href='cancel.fr?no=${ friend.no }'">
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
								</div>
							
							<div class="tab-pane" id="settings3" role="tabpanel">
								
								<div class="card" id="mainNavContent">
                           <div class="card-block">
               <div id="map" style="width: 100%; height: 400px;"></div>
            <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ddeba899945d357cf074efe3300b31&libraries=services"></script>
            <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('서울시 마포구 신촌로 176 중앙빌라 5층', function(result, status) {

            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">BLUE BIRD</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });    
            </script>
                             
                      <br><br><br>       
                      <h6>BLUE BIRD SNS(Social Network Service) 소셜 네트워크 서비스로 웹 상에서 사회적 네트워크를  구축하여 사람들이
                          각자의 의견과 생각,경험,관점,의견,대화 등 서로 공유할 수 있도록 만든 SNS기반 서비스 웹 입니다.
                          </h6>
                      
                      <h6>회사대표:나경 회사대표 번호:010-7777-7777  회사위치:서울시 마포구 신촌로 176 중앙빌라 5층</h6>
	
				</div>
				</div>
				</div>
						
			
<!-- ### //프로필 컨텐트 ### -->
<!-- ### // nav 이외 영역 ###	 -->
					<div class="card"></div>
					<div class="card"></div>
					<div id="styleSelector"></div>
<%@include file="/WEB-INF/top&bottom/bottom.jsp"%>