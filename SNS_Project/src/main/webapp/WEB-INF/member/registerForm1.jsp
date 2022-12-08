<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- registerForm1.jsp<br> -->

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/assets/js/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("ready");
		
		//키다운했을 때
		$("input[name='email']").keydown(function(){
			//alert("키다운");
			$("#duplRes").empty();
		});
		
		//계속 버튼 눌렀을 때
		$("#goChk").click(function(){
			//alert("submit");
			if($("input[name='email']") == ""){
				alert("이메일을 입력하세요.");
			}else{
			
				$.ajax({
					url : "email_check_proc.mem",
					data : ({
						inputemail : $("input[name='email']").val()
					}),
					success : function(data){
						//alert(data);
						if(data == "cannot"){
							$("#duplRes").empty();
							$("#duplRes").append("<br><font color='red'>이미 사용중인 이메일입니다</font>");
							isChk = "";
						}else{
							f.submit();
						}
					}
				});//ajax
			
			}//else
			
		});
		
	});//ready
	

</script>


<style>
.err{
		font-size: 9pt;
		color : red;
		font-weight: bold;
}

</style>


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
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                	<!-- class="md-float-material form-material" -->
                    <form name="f" action="register1.mem" method="post">
                        <div class="text-center">
                            <img src="<%= request.getContextPath() %>/resources/assets/images/logo.png" alt="logo.png">
                        </div>
                        <div class="auth-box card">
                            <div class="card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">회원가입</h3>
                                    </div>
                                </div>

                                
                                <div class="form-group form-primary">
                                    <table style="width: 100%;">
                                    	<tr>
                                    		<td height="50px;">
                                    		사용할 이메일을 입력해주세요.
                                    		</td>
                                    	</tr>
                                    	<tr>
                                    		<td height="80px;" valign="top">
                                    		<input type="text" name="email" value="user1@gmail.com" style="width: 300px;"
                                    		 class="form-control" placeholder=".form-control">
                                    		<span id="duplRes"></span>
                                    		</td>
                                    	</tr>
                                    	<tr>
                                    		<td align="right">
                                    			<button type="button" class="btn btn-default waves-effect" 
			                                         onclick="javascript:location.href='login.mem'">취소</button>
		                                        <button type="button" id="goChk" class="btn btn-primary waves-effect waves-light">계속</button>
                                    		</td>
                                    	</tr>
                                    </table>
                                </div>
                               
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