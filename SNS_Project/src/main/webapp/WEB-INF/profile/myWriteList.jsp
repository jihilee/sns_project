<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
    
<!-- Lists  -->
<%@include file="../write/AllModal.jsp" %>
<%@include file="../write/style.jsp" %>
<%@include file="../write/script.jsp" %>
<c:forEach var="wb" items="${lists }" varStatus="statusNm">

<div class="col-xl-6 col-md-12 mywrite-left" style="margin-left:350px;">
                   <div class="card" id="writeBox">
                       <div class="card-header" id="writeBox">
   								<div style=" display: inline-block;" >
   									 <c:if test="${ wb.profile eq null }">
										<img class="write_profile"
											src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
											alt="User-Profile-Image" style="display: inline-block;">
									</c:if>
									<c:if test="${ wb.profile ne null }">
										<img class="write_profile"
										src="<%= request.getContextPath() %>/resources/assets/images/members/${ wb.profile }"
										alt="User-Profile-Image" style="display: inline-block;">
									</c:if> 
								</div>                  
								<span style="display: inline-block; vertical-align: top;">${wb.name}</span>
								<span class="badge bg-secondary" style=" vertical-align: top;">${wb.scope }</span>
							    <div class="dropdown">
								<span style="display: inline-block; vertical-align: top; float: right;">
									<img  class="dropbtn" src="./resources/logo/dot.png" width="20px">
								      <div class="dropdown-content">
								        <a href="profile.pro?no=${wb.no }">프로필</a> <!-- mypage로 이동 -->
								        <a href="#">친구추가</a> <!-- alert창으로 확인 -->
								        <a href="#">신고</a>	<!-- alert창에서 신고사유 radio로 선택 후 확인 -->
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
                           	<p>${wb.contents }</p>
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
  		
  		<!-- video -->
       	<%String videourl = request.getContextPath()+"/resources/assets/images/video/"; %>
       	<c:if test="${wb.video ne null }">
       	<video class="showVideo" src="<%=videourl %>${wb.video }" autoplay loop muted controls ></video>
       	</c:if>
       </div>
</div>
<!-- id=writeBox  -->
	<div class="card-header comment">
		<span class="pcoded-micon"> 
									
		<span id="like" style="display: inline-block; margin-left:10px; ">
				<a href="javascript:return false;">
					<i  id="filledHeart"
						<c:if test="${fn:contains(likedWnoLists, wb.wno)}">   
							class="bi bi-heart-fill" onclick="minus_like(${wb.wno},${login.no })"
						</c:if>
					></i>
					<i id="emptyHeart"
						<c:if test="${fn:contains(likedWnoLists, wb.wno) eq false}">  
							class="bi bi-heart" onclick="plus_like(${wb.wno},${login.no })" 
						</c:if>
					 ></i>
					<i id="a_like${wb.wno }"  class="bi bi-heart-fill" onclick="minus_like(${wb.wno},${login.no })" style="display: none;"></i>
					<i id="b_like${wb.wno }" class="bi bi-heart" onclick="plus_like(${wb.wno},${login.no })" style="display: none;"></i>
				<i  class="bi bi-heart-fill" id="a_like${wb.wno }" style="display:none;" onclick="minus_like(${wb.wno},${login.no })" ></i> 
				</a>
					<span style="display:inline-block; color: #148CFF;" id="likesCount${wb.wno }">${wb.likes }</span>
			</span>
										
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>	
			<script type="text/javascript">
				function plus_like(wno,no){
					alert(wno+"/"+no);
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
					alert(wno+"/"+no);
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
										
					<span id="chat" style="display: inline-block; margin-left:15px; ">
						<a href="" style="text-decoration: none;">
							<i class="bi bi-messenger" id="clickedChat" onclick="clickChat(${wb.wno})"></i>
						</a> 
					</span>
					
					<span id="bookmark" style="display: inline-block; margin-left:15px; ">
						<a href="javascript:return false;" style="text-decoration: none;">
							<c:if test="${fn:contains(checkedBooks,wb.wno) }">
								<i id="b_bookedmark${wb.wno }" class="bi bi-bookmark-check-fill" 
								onclick="bookmarkCancle(${wb.wno})" style="display:inline; color: #FFD732;"></i>
							</c:if>
							<c:if test="${fn:contains(checkedBooks,wb.wno) eq false }">
								<i id="b_bookmark${wb.wno }" class="bi bi-bookmark-dash" onclick="bookmarked(${wb.wno})"></i>
							</c:if>
							<i class="bi bi-bookmark-check-fill" id="a_bookmark${wb.wno }" style="display:none;" onclick="bookmarked(${wb.wno})"></i>
							<i class="bi bi-bookmark-dash" id="b_bookmark${wb.wno }" style="display:none;" onclick="bookmarkCancle(${wb.wno})"></i>
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
										
		<%-- <div style="float: right;">
			<c:if test="${login.no eq wb.no}"> <!-- 로그인된 회원 번호와 작성자 번호가 일치하는지 확인 -->
				<input type="hidden" name="wno" value="" id="wno">
				<input type="button" onclick="javascript:modify('${wb.wno }')" class="btn btn-outline-primary btn-sm" value="수정">
				<input type="button" class="btn btn-outline-danger btn-sm " value="삭제" onclick="location.href='delete.wr?no=${wb.no}&wno=${wb.wno}&image=${wb.image }&video=${wb.video }'">
			</c:if>
		</div> --%>
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



         <div class="card-header none">
            <table>
               <tr id="plus${wb.wno }"></tr>
               <c:forEach var="j" items="${clists }">
                  <c:if test="${wb.wno eq j.wno}">
               <tr>
                  <th width="70px">${j.name }</th>
                  <td>${j.c_contents }</td>
                  <td width="180px" align="right" style="color: #909090c7;">
                     ${j.c_upload_date }</td>
               </tr>
                  </c:if>
               </c:forEach>
               <tr>
                  <td colspan="3"><a href="" onClick="detailPost(${wb.wno},${login.no })"
                     class="more" data-toggle="modal" data-target="#detailPost">댓글
                        더보기..</a></td>
               </tr>
            </table>
         </div>
         <div class="card-header none comment">
            <div class="row">
               <div class="col-sm-8" style="left : 12px; top:10px;">
                  <div class="form-group form-default form-static-label">
                     <input type="text" id="c_contents_${wb.wno }" name="c_contents"
                        class="form-control" placeholder="댓글달기.."> 
                        <span class="form-bar"></span>
                  </div>
               </div>
               <input type="button" name="post" value="게시" style="top:12px;"
                  onClick="post('${wb.wno }')"
                  class="post btn waves-effect waves-light btn-inverse btn-outline-inverse">
            </div>
         </div>
         <!-- reply end -->            
                </div><!-- card end -->
            </div>
</c:forEach>