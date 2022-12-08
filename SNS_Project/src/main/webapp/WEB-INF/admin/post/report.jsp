<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>
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
	.table td, .table th {
    	padding: 10px;
    }
    .table {
    	border-bottom: 0.5px solid #dee2e6;
    }
    .report-count {
    	padding: 0px;
    	margin: 0px;
    }
    .write_profile {
	   border-radius: 100px;
	   width: 60px;
	   height: 60px;
	}
	.modal-backdrop.show{
	   opacity : 0;
	}
	
	.map-modal-body {
	   padding-right: 0px;
	   padding-left: 270px;
	   margin-right: 0px;
	}
	.center {
		text-align: center;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	.tableHeader {
	    display: inline-block;
	    width: 100%;
	}
	nav {
		padding: 0px !important;
	}
	</style>
	
	<script>
	
	//게시글
	function detailPost(wno){
         //alert('no : '+no)
         //alert('wno : '+wno)
         $('input[name="wno"]').val(wno)
         //$('#post').show()
         //$('#updatepost').hide()
         //$('#commentpost').hide()
         //$('input[name="c_contents"]').val('')
         var str='';
         
         $.ajax({
             url :"detail.wr",
             data: {wno:wno},
             type:"post",
             dataType:"json",
             success:function(data){
                //alert('data. length : '+data.length)
                 $('#allcomments *').remove();
                
                for(var i=0;i<data.length;i++){
                   
                   var re_step = select_re_step(data[i].cno);
                   var likes_no = check_Likes(data[i].cno,data[i].wno);
                   
                   str +='<tr height="20px">';
                   str +='<th align="left">'+data[i].name+'</th>';
                   str +='<td align="left" colspan="2">'+data[i].c_contents+'</td>';
                   str +='<td align="right" style="color: #909090c7;">'+data[i].c_upload_date+'</td>';
                   
                   str +='<td align="right"><a href="javascript:return false;" style="text-decoration: none;">';
                   
                   if(likes_no != null){
                      
                      str +='<i id="update_filledHeart'+data[i].wno+data[i].cno+'" class="bi bi-heart-fill"';
                      str +='onclick="detail_cancleLike('+data[i].wno+','+data[i].cno+')" style="display:inline; color: #ff0018;"></i>';

                   }
                   if(likes_no == null){
                      str += '<i id="update_emptyHeart'+data[i].wno+data[i].cno+'" class="bi bi-heart" onclick="detail_plusLike('+data[i].wno+','+data[i].cno+')"></i>';
                   }
                   
                   str +='<i class="bi bi-heart-fill" id="detail_alike'+data[i].wno+data[i].cno+'" style="display:none;" onclick="detail_cancleLike('+data[i].wno+','+data[i].cno+')"></i>';
                   str +='<i class="bi bi-heart" id="detail_blike'+data[i].wno+data[i].cno+'" style="display:none;" onclick="detail_plusLike('+data[i].wno+','+data[i].cno+')"></i>';
                   str +='</a></td>';
                   
                   /*
                   if(no==data[i].mno){
                      str +='<td align="right">';
                      str +='<div class="dropdown">';
                      str +='<button type="button" class="btn p-0 dropdown-toggle hide-arrow dropmenu" data-bs-toggle="dropdown">';
                      str +='<i class="bx bx-dots-vertical-rounded"></i>';
                      str +='</button>';
                      str +='<div class="dropdown-menu">';
                      str +='<button type="button" class="dropdown-item delete" onclick="updateComment('+data[i].cno+','+data[i].wno+',\''+data[i].c_contents+'\')">';
                      str +='수정 </button>';
                      str +='<button type="button" class="dropdown-item delete" onclick="deleteComment('+data[i].cno+','+data[i].wno+')">';
                      str +='삭제 </button>';
                      str +='</div>';
                      str +='</div>';
                      str +='</td>';
                   }
                   
                   if(no != data[i].mno){
                      str +='<td align="right">';
                      str +='</td>';
                   }
                   */
                   str +='<td align="right">';
                   str +='</td>';
                   str +='</tr>';
                   str +='<tr id="reply_tr'+data[i].cno+'">';
                   str +='<td></td>';
                   //str +='<td colspan="4" class="plus-comment"><a onClick="replyComment('+no+','+data[i].cno+','+data[i].wno+','+data[i].ref+','+data[i].re_step+','+data[i].re_level+',\''+data[i].name+'\')" style="color:#909090c7; font-weight: bold;">댓글달기('+re_step+')</a></td>';
                   str +='</tr>';
                   

                }
                   $('#allcomments').append(str);
                   
             },
             error:function(request,status,error){
              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
          })
          $.ajax({
             url : "detailPost_img_video.wr",
             data :{wno : wno},
             type:"post",
             dataType:"json",
             success: function(map){
                //console.log(map.contents)
                $('#detailcontents').html(map.contents) 
                $('#detailName').html(map.name) 
                $('#detailLocation').html(map.location) //위치
                $('#detailF_tag').html(map.f_tag) //친구태그
                
                var url = '<%=request.getContextPath()%>/resources/assets/images/upload/';
                var vurl = '<%=request.getContextPath()%>/resources/assets/images/video/';
                var purl = '<%=request.getContextPath()%>/resources/assets/images/members/';
                
                //removeAllchild('#activeImg');
                if(map.img1 != null){
                  console.log(map.img1)
                      $('#activeImg').append('<img class="d-block w-100" alt="First slide" id="img1">');
                      $('#img1').attr('src',url+map.img1);
                    }
                    if(map.img2 != null){
                       console.log(map.img2)
                      $('#activeImg').after('<div class="carousel-item" id="itemImg"><img class="d-block w-100" alt="slide" id="img2"></div>');
                      $('#img2').attr('src',url+map.img2);
                    }
                    if(map.img3 != null){
                       console.log(map.img3)
                      $('#activeImg').after('<div class="carousel-item" id="itemImg"><img class="d-block w-100" alt="slide" id="img3"></div>');
                      $('#img3').attr('src',url+map.img3);
                    }
                    if(map.img4 != null){
                      $('#activeImg').after('<div class="carousel-item" id="itemImg"><img class="d-block w-100" alt="slide" id="img4"></div>');
                      $('#img4').attr('src',url+map.img4);
                    }
                    if(map.img1 != null){
                      $('#detailImg').show();
                    }
	                 if(map.video != null){
	                      $('#getvideo').attr('src',vurl+map.video);
	                      $('#before_Video').show();
	                    }
	                 if(map.profile != null){
	                     $('#detail_profile').attr('src',purl+map.profile);           
	                 }
	                 if(map.profile == null){
	                     $('#detail_profile').attr('src',purl+'profile.png');         
	                 }
                 
             }
          })
       }
	
	 //댓글 하트 클릭 취소
     function detail_cancleLike(wno,cno){
        $.ajax({
           url : "detail_cancleLike.wr",
           data : {wno : wno,
                   cno : cno},
           type : "post",
           dataType :"json",
           success : function(data){
              $('#update_filledHeart'+wno+cno).hide();
                 $('#update_emptyHeart'+wno+cno).hide();
                 $('#detail_blike'+wno+cno).show();
                 $('#detail_alike'+wno+cno).hide();
                 $('#detail_blike'+wno+cno).attr('style','display:inline;'); 
           }
        })
     }
     
     	//댓글 하트 클릭
        function detail_plusLike(wno,cno){
           //alert('wno : '+wno+","+'cno : '+cno)
           $.ajax({
              url : "detail_plusLike.wr",
              data : { cno : cno,
                      wno : wno },
              type :"post",
              dataType:"json",
              success: function(data){
                 //alert('detail_plusLike 성공 : '+data)
                 $('#update_filledHeart'+wno+cno).hide();
                 $('#update_emptyHeart'+wno+cno).hide();
                 $('#detail_blike'+wno+cno).hide();
                 $('#detail_alike'+wno+cno).show();
                 $('#detail_alike'+wno+cno).attr('style','display:inline; color: #ff0018;');                 
              }
           })
        }
        
      //댓글 하트
      function check_Likes(cno,wno){
         var likes_no;
         $.ajax({
            url : "check_Likes.wr",
            data : {cno:cno,
                    wno:wno},
            type :"post",
            dataType :"json",
            async: false,
            success : function(data){
               //alert('check_Likes ajax : '+data)
               likes_no = data;
            }
         })
         return likes_no;
      }
      
      //모달 닫기
      function closeDetailPost(){
         $('#before_Video').hide();
         $('#detailImg').hide();
      }
      
      function select_re_step(cno){
         var maxnum;
         $.ajax({
            url : "select_re_step.wr",
            data :{ cno : cno},
            async: false,
            success : function(data){
               maxnum = data;
            }
         })
         return maxnum;
      }
      
	
	//신고횟수
	function reportCount(wno) {
		
		$.ajax({
			url: 'reportCount.ad',
			data: {wno : wno},
			type: 'post',
			dataType: 'json',
			success: function(list) {
				//alert(list);
				$('#report_count').empty();
				for(var i=0; i<list.length; i++) {
					console.log(list[i].report_mname+" , "+list[i].reason);
					var num = i+1;
					var str = '<tr><td>'+num+'</td><td>'+list[i].report_mname+'</td><td>'+list[i].reason+'</td>';
					$('#report_count').append(str);					
				}
			},
			error: function(request,status,result) {
				console.log(status+' : '+result);
			}
			
		});
	}
	
	</script>
	      
</head>

<body>
	
<%@ include file="../top.jsp" %>       

  <div class="pcoded-content">
      <!-- Page-header start -->
      <div class="page-header">
          <div class="page-block">
              <div class="row align-items-center">
                  <div class="col-md-8">
                      <div class="page-header-title">
                          <h5 class="m-b-10">신고 게시글</h5>
                          <p class="m-b-0">Manage reported posts</p>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <ul class="breadcrumb">
                          <li class="breadcrumb-item">
                              <a href="index.ad"> <i class="fa fa-home"></i> </a>
                          </li>
                          <li class="breadcrumb-item">신고 게시글</li>
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
	                          <h5>신고 게시글 조회</h5>
	                          <span>신고를 당한 게시글들을 조회할 수 있습니다.</span>
	                          <span>신고글에 대해 자세히 보고 싶으면 해당하는 행을 클릭하세요. 신고 횟수를 클릭하면 신고한 사람과 이유가 나옵니다. 휴지통을 클릭하면 해당 게시글이 삭제됩니다.</span>
	                          <div class="card-header-right">
	                              <ul class="list-unstyled card-option">
	                                  <li><i class="fa fa fa-wrench open-card-option"></i></li>
	                                  <li><i class="fa fa-window-maximize full-card"></i></li>
	                                  <li><i class="fa fa-minus minimize-card"></i></li>
	                                  <li><i class="fa fa-refresh reload-card"></i></li>
	                                  <li><i class="fa fa-trash close-card"></i></li>
	                              </ul>
	                          </div>
	                      </div>
	                      <div class="card-block table-border-style">
	                          <div class="table-responsive">
	                              <table class="table table-hover">
	                                  <thead>
	                                      <tr>
	                                          <th>#</th>
	                                          <th>신고당한 사람</th>
	                                          <th>신고당한 게시글번호</th>
	                                          <th class="center">신고 횟수</th>
	                                          <th class="center">게시글 삭제</th>
	                                      </tr>
	                                  </thead>
	                                  <tbody>
	                                  	<c:forEach var="report" items="${reportList }" varStatus="i">
	                                      <tr>
	                                          <th scope="row" onclick="detailPost(${report.wno })" data-toggle="modal" data-target="#reportPost">${i.count }</th>
	                                          <td onclick="detailPost(${report.wno })" data-toggle="modal" data-target="#reportPost">${report.reported_mname }</td>
	                                          <td onclick="detailPost(${report.wno })" data-toggle="modal" data-target="#reportPost">${report.wno } 번 게시글</td>
	                                          <td class="center" onclick="reportCount(${report.wno })" data-toggle="modal" data-target="#reportCount">${report.cnt } 건</td>
	                                          <td class="center"><a href="deleteReport.ad?wno=${report.wno }"><i class="ti-trash"></i></a></td>
	                                      </tr>
	                                    </c:forEach>
	                                  </tbody>
	                              </table>
	                          </div>
	                      </div>
	                  </div>
	                  <!-- Hover table card end -->
	                  
	                  <!-- detailPost 모달 -->
					  <!-- The Modal -->
					  <div class="modal fade" id="reportPost">
					     <div class="modal-dialog Large modal-lg modal-dialog-centered">
					        <div class="modal-content">
					  
					           <!-- Modal Header -->
					           <div class="modal-header">
					              <div class="box" style="background: #BDBDBD; display: inline-block;">
					                 <img class="write_profile" src=""
					                    id="detail_profile" style="display: inline-block;">
					              </div>
				  	              <table class="tableHeader">
					                 <tr>
					                 	<!-- 이름 -->
					                    <td colspan="2" id="detailtd" style="padding-left: 10px;">
					                       <h4 class="modal-title" id="detailName"
					                          style="vertical-align: middle;">&nbsp;&nbsp;</h4>
					                    </td>
					                 </tr>
					                 <tr>
					                 	<!-- 지도 -->
					                    <td><i class="ti-location-pin" id="icon"></i></td>
					                    <td id="detailLocation"></td>
					                 </tr>
					                 <tr>
					                    <td id="detailF_tag" colspan="2"></td>
					                 </tr>
					              </table>
					              <button type="button" class="detailclose" data-dismiss="modal">&times;</button>
					           </div>
					
				  	           <!-- Modal body -->
					           <div id="modal-body">
					              <div class="row">
					                 <!-- 게시글 부분 -->
					                 <div class="col-xl-6 col-md-12">
					                    <div class="card table-card">
					                       <div class="card-header">
					                          <div class="container">
					                          	<h5>게시글</h5>
					                             <p id="detailcontents"></p>
					                          </div>
					                          <div class="container" id="detailImg" style="display: none;">
					                             <br> <br>
					  
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
					                             <script>
					                             $('.carousel').carousel({
					                           	 	interval : 2000
					                             	//기본 5초 2000
					                             })
					                             </script>
					
			  		                             <div id="demo" class="carousel slide" data-ride="carousel">
					                                <div class="carousel-inner">
					                                   <!-- 슬라이드 쇼 -->
					                                   <!--가로-->
					                                   <div class="carousel-item active" id="activeImg"></div>
					                                   <!-- 인디케이터 -->
					                                   <ul class="carousel-indicators">
					                                      <li data-target="#demo" data-slide-to="0" class="active"></li>
					                                      <!--0번부터시작-->
					                                      <li data-target="#demo" data-slide-to="1"></li>
					                                      <li data-target="#demo" data-slide-to="2"></li>
					                                   </ul>
					                                   <!-- 인디케이터 끝 -->
					                                </div>
					                                <!-- / 슬라이드 쇼 끝 -->
					
					                                <!-- 왼쪽 오른쪽 화살표 버튼 -->
					                                <a class="carousel-control-prev" href="#demo"
					                                   data-slide="prev"> <span
					                                   class="carousel-control-prev-icon" aria-hidden="true"></span>
					                                   <span class="sr-only">Previous</span>
					                                </a> <a class="carousel-control-next" href="#demo"
					                                   data-slide="next"> <span
					                                   class="carousel-control-next-icon" aria-hidden="true"></span>
					                                   <span class="sr-only">Next</span>
					                                </a>
					                                <!-- / 화살표 버튼 끝 -->
					
  				  	                             </div>
					                             <!-- 이미지끝 -->
					                          </div>
					                          <div class="container" id="before_Video" style="display: none;">
					                             <!-- video -->
					                             <video id="getvideo" autoplay loop muted controls></video>
					                          </div>
					                       </div>
					                    </div>
					                 </div>
					                 <!-- 게시글 부분 끝 -->
					                 <!-- 댓글 부분 시작 -->
					                 <div class="col-xl-6 col-md-12">
					                   <div class="card table-card">
					                     <div class="card-header">
					                     	<div class="container">
					                          	<h5>댓글</h5>
					                             <p id="detailcontents"></p>
					                        </div>
					                        <table width="100%" id="allcomments">
					
					                        </table>
					                        <input type="hidden" name="ref"> 
					                        <input type="hidden" name="re_step"> 
					                        <input type="hidden" name="re_level">
					                        <input type="hidden" name="no">
					                        <br> <br>
					                        <!-- 
					                        <div class="row">
					                           <div class="col-sm-8">
					                              <div class="form-group form-default form-static-label">
					                                 <input type="text" name="c_contents" class="form-control"
					                                    placeholder="댓글달기.." onClick="c_contents()"> <span
					                                    class="form-bar"></span>
					                              </div>
					                           </div>
					                           <input type="hidden" name="cno"> 
					                           <input type="hidden" name="wno"> 
					                           <input type="button" name="post" id="post"
					                              value="게시" onClick="detailPost_Comment()"
					                              style="display: none;"
					                              class="post btn waves-effect waves-light btn-inverse btn-outline-inverse">
					                           <input type="button" name="post" id="commentpost" value="답글게시"
					                              onClick="CommentPost_Comment()" style="display: none;"
					                              class="post btn waves-effect waves-light btn-inverse btn-outline-inverse">
					                           <input type="button" name="updatepost" id="updatepost"
					                              value="수정" style="display: none;"
					                              onClick="detailPost_UpdateComment()"
					                              class="post btn waves-effect waves-light btn-inverse btn-outline-inverse">
					                        </div>
					                         -->
					                     </div>
					                   </div>
					                 </div>
					                 <!-- 댓글 부분 끝 -->
					              </div>
					           </div>
					
					           <!-- Modal footer -->
					           <div class="modal-footer">
					              <button type="button" class="btn" data-dismiss="modal"
					                 onClick="closeDetailPost()">닫기</button>
					           </div>
					
			  		        </div>
					     </div>
					  </div>
	                  
	                  
	                  <!-- 신고 횟수 Modal start -->
					  <div class="modal fade" id="reportCount">
					   <div class="modal-dialog modal-lg modal-dialog-centered">
					      <div class="modal-content">
					
					         <!-- Modal Header -->
					         <div class="modal-header">
					            <h4 class="modal-title">신고 상세보기</h4>
					            <button type="button" class="close" data-dismiss="modal">&times;</button>
					         </div>
					
					         <!-- Modal body -->
					         <div id="modal-body">
					            <table class="table report-count">
	                                  <thead>
	                                      <tr>
	                                          <th>#</th>
	                                          <th>신고한 사람</th>
	                                          <th>신고한 이유</th>
	                                      </tr>
	                                  </thead>
	                                  <tbody id="report_count">
	                                  	  <!-- ajax로 넣기 -->
	                                  </tbody>
	                              </table>
					         </div>
					
					         <!-- Modal footer -->
					         <div class="modal-footer">
					            <button type="button" class="btn" data-dismiss="modal">닫기</button>
					         </div>
					
					      </div>
					   </div>
					  </div> 
                      <!-- 신고 횟수 Modal end -->
                      
                  </div>
                  <!-- Page-body end -->
              </div>
              <div id="styleSelector"> </div>
          </div>
      </div>
  </div>
                    
<%@ include file="../bottom.jsp" %>

</body>
</html>
