<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="en">

<!-- 메일 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#btnSubmit").click(function(){
			alert(1);
			$.ajax({
				url : "findPassword.mem",
				type : "POST",
				data : {
					name : $("input[name='name']").val(),
					email : $("input[name='email']").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}


<style>
.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}

td {
	height: 50px;
}

#hp {
	width: 30%;
	float: left;
}

#spanHp, #email {
	float: left;
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
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />

      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="Codedthemes" />
      <!-- Favicon icon -->

      <link rel="icon" href="<%= request.getContextPath() %>/resources/assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/assets/icon/icofont/css/icofont.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/assets/css/style.css">
  </head>

  <body themebg-pattern="theme1">
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

    <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->

                        <form:form commandName="member" name="f" action="findPassword.mem" method="post">
                            <div class="text-center">
                                <img src="<%= request.getContextPath() %>/resources/assets/images/logo.png" alt="logo.png">
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">비밀번호 찾기</h3>
                                        </div>
                                    </div>
                                    
                                   
                                    <table>
										<tr>
											
											<td width="30%">이메일</td>
											<td width="60%"><input type="text" name="email"
												value="user1@gmail.com" class="form-control"
												placeholder="이메일"></td>
										</tr>
										<tr>
											<td>이름</td>
											<td><input type="text" name="name" value="user1"
												class="form-control" placeholder="이름"></td>
										</tr>
										<tr valign="top">
											<td>핸드폰번호</td>
											<td><input type="text" name="hp1" value="010" id="hp"
												class="form-control" placeholder=".form-control"> <span
												id="spanHp">&nbsp;-&nbsp;</span> <input type="text"
												name="hp2" value="1234" id="hp" class="form-control"
												placeholder=".form-control"> <span id="spanHp">&nbsp;-&nbsp;</span>
												<input type="text" name="hp3" value="1234" id="hp"
												class="form-control" placeholder=".form-control"> 
											</td>
										</tr>
										<%-- <tr>
											<td>비밀번호</td>
											<td><input type="text" name="password"
												value="${ member.password }" class="form-control"
												placeholder="4~10자 영문 대 소문자, 숫자"> <form:errors
													cssClass="err" path="password"></form:errors></td>
										</tr> --%>
										
									</table>
									
									
									<div class="row m-t-30">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">비밀번호 찾기</button>
										<!-- <button type="button" id="btnSubmit"
											class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">비밀번호 찾기</button> -->
										<button type="button" class="btn btn-default waves-effect"
											style="width: 410px; margin-top: -15px;"
											onclick="javascript:location.href='login.mem'">취소</button>
									</div>
									</div>
                                    </form:form>
                                    
   

                                    <%-- <hr/>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <p class="text-inverse text-left m-b-0">Thank you.</p>
                                            <p class="text-inverse text-left"><a href="index.html"><b>Back to website</b></a></p>
                                        </div>
                                        <div class="col-md-2">
                                            <img src="<%= request.getContextPath() %>/resources/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                        </div>
                                    </div> --%>
                                </div>
                            </div>
                        </form>
                        <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
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
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/js/jquery/jquery.min.js "></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="<%= request.getContextPath() %>/resources/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/js/common-pages.js"></script>
</body>

</html>