<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
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
    
<!-- 나경 디테일 아이콘 -->
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
      integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
      crossorigin="anonymous"></script>
<!-- 나경 디테일 아이콘 끝 -->

<!-- modal -->
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- icon sgy  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    
    
    <!-- Favicon icon -->
    <link rel="icon" href="<%=request.getContextPath() %>/resources/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/font-awesome.min.css">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/style.css">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  
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
/* 11.15 */
.pcoded[theme-layout="vertical"] .pcoded-header[pcoded-header-position="fixed"] {
    position: fixed;
    z-index: 1028;
    height: 70;
}
.header-navbar .navbar-wrapper .navbar-container .nav-right {
    float: right;
    margin-top: -15;
}
/*  11.15 */

#navProfile {
   border-radius: 100px;
   width: 40px;
   height: 40px;
}

.img-fluid {
    max-width: 80%;
    margin-left: -50;
    height: auto;
}
#sideProfile {
   border-radius: 100px;
   width: 80px;
   height: 80px;
}
a{
   text-decoration: none;
}
#wrap{
   width:100%;
   margin:0 auto;
   overflow:hidden;
}
div > p{
   float : left;
   margin-left:5px;
}
.img1{
   display:block;
}
span > i{
   float:left;
}
#icon{
   padding: 5px 5px;
   margin:5px 5px;
}
.comment {
    padding: 5px !important;
}
.body{
   padding-right:0px !important;
}
</style>
</head>

<body class="body">
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
    <!-- header start -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
            <nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">
                    <div class="navbar-logo">
                        <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <div class="mobile-search waves-effect waves-light">
                            <div class="header-search">
                                <div class="main-search morphsearch-search">
                                    <div class="input-group">
                                        <span class="input-group-prepend search-close"><i class="ti-close input-group-text"></i></span>
                                        <input type="text" class="form-control" placeholder="Enter Keyword">
                                        <span class="input-group-append search-btn"><i class="ti-search input-group-text"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="home.wr">
                            <img class="img-fluid" src="resources/logo/bluebird.png" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options waves-effect waves-light">
                            <i class="ti-more"></i>
                        </a>
                    </div>
                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>
              
                        </ul>
                        <ul class="nav-right" id="toptoptop">
                            <li class="user-profile header-notification">
                                <a href="#!" class="waves-effect waves-light">
                                    <c:if test="${ login.profile eq null }">
                                 <img id="navProfile"
                                    src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
                                    alt="User-Profile-Image">
                           </c:if>
                           <c:if test="${ login.profile ne null }">
                              <img id="navProfile"
                              src="<%= request.getContextPath() %>/resources/assets/images/members/${ login.profile }"
                              alt="User-Profile-Image">
                           </c:if> 
                                    <span>${login.name }</span>
                                   <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li class="waves-effect waves-light">
                                        <a href="settings.pro">
                                            <i class="ti-settings"></i> 설정 및 개인정보
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                         <c:if test="${login.business eq 0 }">
                                        <a href="myprofile.pro">
                                            <i class="ti-user"></i> 내 프로필
                                        </a>
                                        </c:if>
                                         <c:if test="${login.business eq 1 }">
                                        <a href="bnprofile.pro">
                                            <i class="ti-user"></i> 내 프로필
                                        </a>
                                        </c:if>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="chattingRoomList.room">
                                            <i class="ti-email"></i> 메시지
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="logout.mem">
                                            <i class="ti-layout-sidebar-left"></i> 로그아웃
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="">
                                <div class="main-menu-header">
						 <c:if test="${login.business eq 0 }">
                                    <a href="myprofile.pro"> <!-- class="img-80 img-radius" -->
                           <c:if test="${ login.profile eq null }">
                                 <img id="sideProfile"
                                    src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
                                    alt="User-Profile-Image">
                           </c:if>
                           <c:if test="${ login.profile ne null }">
                           <img id="sideProfile"
                              src="<%= request.getContextPath() %>/resources/assets/images/members/${ login.profile }"
                              alt="User-Profile-Image">
                           </c:if>
                           <h6 style="color: #fff;">${login.name }</h6>
                           </a>
				    </c:if>
					<c:if test="${login.business eq 1 }">
                              <a href="bnprofile.pro"> <!-- class="img-80 img-radius" -->
                           <c:if test="${ login.profile eq null }">
                                 <img id="sideProfile"
                                    src="<%= request.getContextPath() %>/resources/assets/images/members/profile.png"
                                    alt="User-Profile-Image">
                           </c:if>
                           <c:if test="${ login.profile ne null }">
                           <img id="sideProfile"
                              src="<%= request.getContextPath() %>/resources/assets/images/members/${ login.profile }"
                              alt="User-Profile-Image">
                           </c:if>
                           <h6 style="color: #fff;">${login.name }</h6>
                           </a>
                           </c:if>
                                </div>
                                <div class="main-menu-content">
                                    <ul>
                                        <li class="more-details">
                                            <a href="myprofile.pro"><i class="ti-user"></i>내 프로필</a>
                                            <a href="#!"><i class="ti-settings"></i>설정</a>
                                            <a href="logout.mem"><i class="ti-layout-sidebar-left"></i>로그아웃</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="pcoded-navigation-label">Home</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="home.wr" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext">홈</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <div class="pcoded-navigation-label">Search Tag</div>
                            <div class="p-15 p-b-0" style="margin-left:5px;">
                                <script>
                               function searchPostByTag(){
                                  //alert(1);
                                  var tag_name = $('#search_tag_name').val();
                                  alert('#'+tag_name+'로 검색한 글입니다'); 
                                  location.href="home.wr?tag_name="+tag_name;
                                  
                               }
                               </script>
                            
                              <form class="form-material">
                                   <table>
                                   <tr><td width=90%>
                                   <div class="form-group form-primary">
                                     <input type="text" id="search_tag_name" class="form-control">
                                     <span class="form-bar"></span>
                                     <label class="float-label"><i class="fa fa-search m-r-10"></i>검색</label>
                                  </div>
                                  </td><td width=10%>
                                    <i class="bi bi-check-lg" onclick="searchPostByTag()"></i>
                                  </td></tr></table>
                              </form>
                            </div>
                            <div class="pcoded-navigation-label">Chart And Maps</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="chattingRoomList.room" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-email"></i><b>M</b></span>
                                        <span class="pcoded-mtext">메시지</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="bookmarkList.pro" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="bi bi-bookmarks"></i><b>M</b></span>
                                        <span class="pcoded-mtext">북마크</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <div class="pcoded-navigation-label">소식</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="view.nt" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-email"></i><b>M</b></span>
                                        <span class="pcoded-mtext">공지사항</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="">
                                    <a href="view.evt" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="bi bi-bookmarks"></i><b>M</b></span>
                                        <span class="pcoded-mtext">이벤트</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            </div>
                            <div class="pcoded-navigation-label">Pages</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-id-badge"></i><b>A</b></span>
                                        <span class="pcoded-mtext">계정</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="login.mem">
                                            <a href="login.mem" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">로그인</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="auth-sign-up.html" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">회원가입</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="sample-page.html" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-layout-sidebar-left"></i><b>S</b></span>
                                                <span class="pcoded-mtext">고객센터</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                        <!-- Page-header end -->