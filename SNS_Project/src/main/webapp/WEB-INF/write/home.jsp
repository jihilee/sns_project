<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/top&bottom/top.jsp"%>
<%@ include file="style.jsp"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/bootstrap/css/bootstrap.css">	

<!-- first card start(write) -->						
						<div class="col-sm-8" id="writeBox" style="margin-top: 80px;">
							<form name="wForm" id="tag-form" action="insert.wr" method="post" enctype="multipart/form-data"> <!-- jh id="tag-form" 추가 -->
								<div class="card" style="margin-left:15px; width:500px;">
									<div class="card-header" style="height:40px;">
									  <h6 class="card-title" style="height:40px; padding-left: 10px"><strong>게시글 작성하기</strong></h6>
									</div>
									<div class="card-header">
									  	<div class="waves-effect waves-light" style="display: inline-block;">
			                                    <c:if test="${ login.profile eq null }">
														<img class="write_profile"
															src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
															alt="User-Profile-Image" style="display: inline-block;">
												</c:if>
												<c:if test="${ login.profile ne null }">
													<img class="write_profile"
													src="<%= request.getContextPath() %>/resources/assets/images/members/${ login.profile }"
													alt="User-Profile-Image" style="display: inline-block;">
												</c:if> 
			                                </div>
											<input type="hidden" value="${login.no }" name="no">
										<div style="display: inline-block; vertical-align: top;">
											<span style="font-size: 12pt; padding-left: 5px;">${login.name }</span>
											<select name="scope" class="form-select" style="height: 30px; font-size: 9pt;">
												<option value="public" />전체공개
												<option value="onlyFriends"/>친구만
												<option value="onlyMe"/>나만보기
											</select>
										</div>
										<div class="form-group row">
					                         <div class="col-sm-6">
					                         		<a href="" data-toggle="modal"  data-target="#myModal" style="margin-top: 5px; text-decoration: none;" > 
						                         		<i class="bi bi-geo-alt-fill"></i>
					                         		</a>
					                                  <span id="location" style="display: inline-block;"></span>
					                               <input type="hidden" name="location" id="location">
					                               <input type="hidden" name="address" id="address">
					                         </div>
					                      </div>
									</div>
									<div class="card-block" >
										<textarea name="contents" placeholder="${login.name }님, 무슨생각을 하고 계신가요?"
											rows="7" cols="100" class="form-control"
											style="resize: none;"></textarea>
<!-- jh hashtag  -->
<script>
//jh hashtag script
$('document').ready(function(){

	  var tag = {};
	  var counter = 0;

	  // 태그를 추가한다.
	  function addTag(value) {
	    tag[counter] = value; // 태그를 Object 안에 추가
	    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	  }

	  // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	  function marginTag() {
	    return Object.values(tag).filter(function(word) {
	        return word !== "";
	      });
	  }
	  
	//서버에 제공
	  $("#tag-form").on("submit", function (e) {
	      var value = marginTag(); // return array
	      //alert(value);
	      $("#rdTag").val(value); 
	      $(this).submit();
	  });

	  $("#tag").on("keyup", function (e) {
	      var self = $(this);
	      console.log("keypress");

	      // input 에 focus 되있을 때 스페이스바 입력시 구동
	      if (e.keyCode == 32) {

	        var tagValue = $.trim(self.val()); // 값 가져오기

	        // 값이 없으면 동작 안합니다.
	        if (tagValue != "") {

	          // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
	          var result = Object.values(tag)
	            .filter(function (word) {
	              return word === tagValue;
	            })

	          // 태그 중복 검사
	          if (result.length == 0) {
	            $("#tag-list")
	              .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
	            addTag(tagValue);
	            self.val("");
	          } else {
	            alert("태그값이 중복됩니다.");
	          }
	        }
	        e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
	      }
	    });

	  // 삭제 버튼
	  // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
	  $(document).on("click", ".del-btn", function (e) {
	      var index = $(this).attr("idx");
	      tag[index] = "";
	      $(this).parent().remove();
	   });
	  
	});

//end jh hashtag script
</script>

					                     <br>
					                     <div class="tr_hashTag_area">
					                        <input type="text" size="7" id="tag" placeholder="스페이스바로 해시태그를 등록해주세요"  style="margin-top:-15px;" class="form-control">
					                        <input type="hidden" value="" name="rdTag" id="rdTag">
					                        <ul class="form-group" id="tag-list"></ul>
					                     </div>    
<!-- end jh hashtag  -->    
										<div class="container" style="float: right; margin-top: -30px;">
											
											<!-- 이미지  -->
												<a href="" style="text-decoration: none;"> <img src="resources/logo/img.png"
													width="40px" id="img">
												</a> 
												<input type="file" accept=".jpg, .png" multiple name="Insert_images" id="imgfile" style="display: none;"> 
												
											<!-- 비디오 -->	
												<a href="" style="text-decoration: none;"> 
													<img src="resources/logo/video.png" width="40px" id="videoclick">
												</a> 
												<input type="file" class="upload-video-file" accept=".mp4" id="videofile" style="display: none;" name="Insert_video">
												
											<!-- 친구태그 -->
												<a href="" style="text-decoration: none;"> 
													 <img src="resources/logo/friends.png" width="40px" id="friends">
												</a> 
												<input type="button" id="friendstag" style="display: none;" data-toggle="modal" data-target="#friendsModal"> 
												<input type="text" name="f_tag" id="f_tag" style="display:none;">
												<a href="" id="selectFriends" style="display: inline-block;"></a>
												 <!-- url  -->
											<c:if test="${login.business eq 1 }"> 
                                   			 <img src="resources/logo/url2.png"  width="40px" id="url" onclick="image()">
                                   			 <input type="url"  placeholder="https://example.com"  name="link" style="display;">
                                   			 </c:if>
												<div style='float: right;'>
													<input type="submit" value="등록" class="btn btn-primary" id="uploadBtn" >
												</div>
										</div>
										
									</form>
								

							
									
<!-- upload image size and type test start-->
<%@ include file = "script.jsp" %>
<!-- upload image size and type test end-->

<!--upload preview start -->
		<div id='Insert_image_preview'>
			<div id='i_att_zone' data-placeholder='파일을 첨부 하려면 버튼을 클릭하거나 드래그앤드롭 하세요'>
			 	<div style="display: none;" class='video-prev' class="pull-right">
		    	   <video height="100" width="180" class="video-preview" autoplay muted controls="controls"/>
				 </div>
			</div>
		</div>
	</div> 
</div>
<!-- first card end -->		
<%@include file="./AllModal.jsp"%>
	
	      		

<!-- Lists  -->
<c:forEach var="wb" items="${lists }" varStatus="statusNm">

<div class="col-sm-8">
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
							    <fmt:parseDate value="${wb.upload_date }" var="upload_date" pattern="yyyy-MM-dd"/>
							    <fmt:formatDate value="${upload_date}" var="upload_date" pattern="yyyy-MM-dd"/>
							    <span style="color: gray;">${upload_date}</span>
								<span style="display: inline-block; vertical-align: top; float: right;">
									<img  class="dropbtn" src="./resources/logo/dot.png" width="20px">
								      <div class="dropdown-content">
								        <a href="profile.pro?no=${wb.no }">프로필</a> <!-- mypage로 이동 -->
											<c:if test="${fn:contains(friendsList,wb.no) eq false || fn:contains(friendsList,login.no) eq false }">
										        <a href="request.fr?no=${wb.no }">친구추가</a> <!-- alert창으로 확인 -->
											</c:if>							        
								        <a href="" onclick="javascript:report('${wb.wno}');" data-toggle="modal" data-target="#report" >신고</a>	<!-- alert창에서 신고사유 radio로 선택 후 확인 -->
								      </div>
								    </div>
								</span>
							    
								<span><a href="" id="find_loca" onClick="find_location(${wb.wno})" style="text-decoration: none;" data-toggle="modal" data-target="#find_map">${wb.location }</a></span>
								<input type="hidden" value="${wb.location }" id="findLocation${wb.wno }">
								<span style="display:inline-block;">
								<c:if test="${not empty wb.f_tag }">
									<c:set var="tag" value="${fn:split(wb.f_tag,',') }"/>
									<c:forEach var="tag" items="${tag }" varStatus="status">
										<c:if test="${tag eq login.name }">
		                                 <a href="myprofile.pro">@${tag}</a>
		                              </c:if>
										<c:forEach var="friendsList" items="${friendsList }">
											<c:if test="${tag eq friendsList.name}">
												<a href="profile.pro?no=${friendsList.no}">@${tag}</a>										
											</c:if>
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
  		
  		<!-- video -->
       	<%String videourl = request.getContextPath()+"//resources/assets/images/video/"; %>
       	<c:if test="${wb.video ne null }">
       	<video class="showVideo" src="<%=videourl %>${wb.video }" autoplay loop muted controls ></video>
       	</c:if>
       	
       	<!-- jh post tag list -->
        <script>
           function getClickedTag(tag_name){
              alert("'#"+tag_name+"'로 찾은 게시물입니다'");
              location.href="home.wr?tag_name="+tag_name;
           }
        
        </script>  
        
          <c:forEach var="ptag" items="${ptList }">
             <c:if test="${ptag.wno eq wb.wno }">
                <div id="tagbox" onclick="getClickedTag('${ptag.tag_name }')">
                   #${ptag.tag_name }
                </div>
                </c:if>
          </c:forEach>
          <!-- end jh post tag list  -->
       	
       	
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
                                          $('#b_like'+wno).hide();
                                          $('#a_like'+wno).hide();
                                          $('#b_like'+wno).attr('style','display:none;');
                                          //alert(1);
                                          $('#a_like'+wno).attr('style','display:inline;');
                                          //alert(2);
                                          $("#likesCount"+wno).empty();
                                          $('#likesCount'+wno).append(data);
                                       
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
                                          $('#b_like'+wno).hide();
                                          $('#a_like'+wno).hide();   
                                          $('#b_like'+wno).attr('style','display:inline;' );
                                          $('#a_like'+wno).attr('style','display:none;');
                                          $("#likesCount"+wno).empty();
                                          $('#likesCount'+wno).append(data);
                                       },
                                       error : function(){
                                          alert("좋아요 마이너스에러 에러");
                                       }
                                    }); //ajax
                                 } //minus_like

                                 function clickChat(read_mno){
                                    alert("gotochat:"+read_mno);
                                   
                                  //창 크기 지정
                                  var width = 550;
                                  var height = 550;
                                  
                                  //pc화면기준 가운데 정렬
                                  var left = (window.screen.width / 2) - (width/2);
                                  var top = (window.screen.height / 4);
                                  
                                  //윈도우 속성 지정
                                  var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=no, titlebar=yes, location=yes, titlebar=yes';
                                  
                                   //연결하고싶은url
                                   var path= '<%=request.getContextPath()%>/getChattingRoom.chat?read_mno='+read_mno;
                               
                                   //child form
                                  //parent form
                                   window.name = "chattingList";
                                  //등록된 url 및 window 속성 기준으로 팝업창을 연다.
                                  var pop = window.open(path, "chatting room", windowStatus);
                                  pop.focus();
                                  
                                 } 
                              </script>
										
					<c:if test="${login.no ne wb.no}">
		               <span id="chat" style="display: inline-block; margin-left:15px; ">
		                  <a href="" style="text-decoration: none;">
		                     <i class="bi bi-messenger" id="clickedChat" onclick="clickChat('${wb.no}')"></i>
		                  </a> 
		               </span>
	               </c:if>
					
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
			<c:if test="${login.no eq wb.no}"> <!-- 로그인된 회원 번호와 작성자 번호가 일치하는지 확인 -->
				<input type="hidden" name="wno" value="" id="wno">
				<input type="button" onclick="javascript:modify('${wb.wno }')" class="btn btn-outline-primary btn-sm" value="수정">
				<input type="button" class="btn btn-outline-danger btn-sm " value="삭제" onclick="deleteWrite('${login.no}','${wb.wno}','${wb.image }','${wb.video }')">
			</c:if>
		</div>
	</span>
</div>

<!-- #modify start -->	


	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>					
	<script type="text/javascript">
		var isRun = false;
		
		function deleteWrite(no,wno,image,video){
			//alert(no+"/"+wno+"/"+image+"/"+video);
			if(!confirm('게시물을 삭제하시겠습니까?')){
				return
			}
			else{
				location.href='delete.wr?no='+no+'&wno='+wno+'&image='+image+'&video='+video;
			}
		}

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
					/* jh hashtag */
		            console.log("tag1:"+map.tag1);
		            console.log("tag2:"+map.tag2);
		            console.log("tag3:"+map.tag3);
		            console.log("tag4:"+map.tag4);
		            console.log("tag5:"+map.tag5);
		            console.log("tag6:"+map.tag6);
		            console.log("tag7:"+map.tag7);
		            console.log("tag8:"+map.tag8);
		            console.log("tag9:"+map.tag9);
		            console.log("tag10:"+map.tag10);
		            /* end jh hashtag */
					
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
					
					 /* jh */
		               if(map.tag1 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag1+"</span><span class='del-btn' idx='"+0+"'>x</span></li>");
		               }
		               if(map.tag2 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag2+"</span><span class='del-btn' idx='"+1+"'>x</span></li>");
		               }
		               if(map.tag3 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag3+"</span><span class='del-btn' idx='"+2+"'>x</span></li>");
		               }
		               if(map.tag4 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag4+"</span><span class='del-btn' idx='"+3+"'>x</span></li>");
		               }
		               if(map.tag5 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag5+"</span><span class='del-btn' idx='"+4+"'>x</span></li>");
		               }
		               if(map.tag6 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag6+"</span><span class='del-btn' idx='"+5+"'>x</span></li>");
		               }
		               if(map.tag7 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag7+"</span><span class='del-btn' idx='"+6+"'>x</span></li>");
		               }
		               if(map.tag8 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag8+"</span><span class='del-btn' idx='"+7+"'>x</span></li>");
		               }
		               if(map.tag9 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag9+"</span><span class='del-btn' idx='"+8+"'>x</span></li>");
		               }
		               if(map.tag10 != null){
		               $('#update_tag-list').append("<li class='tag-item'><span id='tag_v'>"+map.tag10+"</span><span class='del-btn' idx='"+9+"'>x</span></li>");
		               }
		                 /* end jh */
					
					$('input[name="beforeImage"]').attr('value',map.image);
					$('input[name="beforeVideo"]').attr('value',map.video);
					$('select[name="scope"]').attr('value',map.scope);
					$('input[name="upload_date"]').attr('value',map.upload_date);
					$("#ulocation").append(map.location+ " "); 
					if(map.location != null){
						$("#ulocation").attr('style','display:inline-block; vertical-align: top;'); 
					}
					$('input[name="location"]').attr('value',map.location);
					$('#map_location').attr('value',map.location);
					$('input[name="address"]').attr('value',map.address);
					$('#uselectFriends').append(map.f_tag);
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
               <div class="col-sm-8" style="left : 12px; top:10px; display: inline-block;">
                  <div class="form-group form-default form-static-label">
                     <input type="text" id="c_contents_${wb.wno }" name="c_contents"
                        class="form-control" placeholder="댓글달기.."> 
                        <span class="form-bar"></span>
                  </div>
               </div>
               <input type="button" name="post" value="게시" style="left : 12px; top:10px; height:37px; width:140px;
               display: inline-block;"
                  onClick="post('${wb.wno }')"
                  class="post btn waves-effect waves-light btn-inverse btn-outline-inverse">
            </div>
         </div>
         <!-- reply end -->            
                </div><!-- card end -->
            </div>
</c:forEach>

<!-- lists end -->             
<!-- include위치랑 script위치 절대 바꾸면 안됨 -->             
<%@include file="./updateModal.jsp"%>

<script type="text/javascript">

( /* i_att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  Insert_imageView = function (i_att_zone, btn){
	//alert(1);
    var attZone = document.getElementById(i_att_zone);
    var imgfile = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;margin:auto;'
                  + 'width:150px;height:120px;margin:5px;border:1px #368AFF;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:15px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:#368AFF;color:#ffffff;border: 1px #ffffff;';
  
    imgfile.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
  
    attZone.addEventListener('drop', function(e){
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
        attZone.appendChild(makeDiv(img, file));
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
        imgfile.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('i_att_zone', 'imgfile') //imgfile or videofile 

</script>

<script>
$(function() {
    $('.upload-video-file').on('change', function(){
      if (isVideo($(this).val())){
        $('.video-preview').attr('src', URL.createObjectURL(this.files[0]));
        $('.video-prev').show();
      }
      else
      {
        $('.upload-video-file').val('');
        $('.video-prev').hide();
        alert("비디오 파일 형식만 선택 가능합니다.")
      }
    });
});

// If user tries to upload videos other than these extension , it will throw error.
function isVideo(filename) {
    var ext = getExtension(filename);
    switch (ext.toLowerCase()) {
    case 'mp4':
        // etc
        return true;
    }
    return false;
}

function getExtension(filename) {
    var parts = filename.split('.');
    return parts[parts.length - 1];
}
</script>
<!--upload preview end -->								
<%@include file="/WEB-INF/top&bottom/bottom.jsp"%>
