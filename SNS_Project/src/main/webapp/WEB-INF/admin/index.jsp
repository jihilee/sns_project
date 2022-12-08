<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="https://use.fontawesome.com/releases/v6.2.0/css/all.css" rel="stylesheet">
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
	.text-c-subscriber {
		color: #406882;
	}
	.text-c-visiter {
		color: #B1D0E0;
	}
	</style>
	
</head>

<body>

<%@ include file="top.jsp" %>
                    
  <div class="pcoded-content">
      <!-- Page-header start -->
      <div class="page-header">
          <div class="page-block">
              <div class="row align-items-center">
                  <div class="col-md-8">
                      <div class="page-header-title">
                          <h5 class="m-b-10">대시보드</h5>
                          <p class="m-b-0">Welcome to SNS project</p>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <ul class="breadcrumb">
                          <li class="breadcrumb-item">
                              <a href="index.ad"> <i class="fa fa-home"></i> </a>
                          </li>
                          <li class="breadcrumb-item">대시보드</li>
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
                      <div class="row">
                          <!-- Material statustic card start -->
                          <div class="col-xl-6 col-md-12">
                              <div class="card mat-stat-card">
                                  <div class="card-block">
                                	  <!-- 가입자 수 -->
                                      <div class="row align-items-center b-b-default">
                                          <div class="col-sm-6 b-r-default p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fas fa-user-plus text-c-subscriber f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${today_member }</h5>
                                                      <p class="text-muted m-b-0">오늘 가입자수</p>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="col-sm-6 p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fas fa-users text-c-subscriber f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${total_member }</h5>
                                                      <p class="text-muted m-b-0">총 가입자수</p>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <!-- 탈퇴자 수 -->
                                      <div class="row align-items-center b-b-default">
                                          <div class="col-sm-6 b-r-default p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fas fa-user-times text-c-subscriber f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${today_leave }</h5>
                                                      <p class="text-muted m-b-0">오늘 탈퇴자수</p>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="col-sm-6 p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fas fa-solid fa-users-slash text-c-subscriber f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${total_leave }</h5>
                                                      <p class="text-muted m-b-0">총 탈퇴자수</p>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- 카카오 -->
                              <div class="card mat-clr-stat-card text-white yellow ">
		                                  <div class="card-block">
		                                      <div class="row">
		                                          <div class="col-3 text-center bg-c-yellow">
		                                              <img src="resources/assets/images/kakao.png" width="35px" height="35px" style="margin:20.6px 0px">
		                                          </div>
		                                          <div class="col-9 cst-cont">
		                                              <h5>${kakao }</h5>
		                                              <p class="m-b-0">카카오 가입자수</p>
		                                          </div>
		                                      </div>
		                                  </div>
		                              </div>
                          </div>
                                
                          <div class="col-xl-6 col-md-12">
                              <div class="card mat-stat-card">
                                  <div class="card-block">
                                      <!-- 방문자 수 -->
                                      <div class="row align-items-center b-b-default">
                                          <div class="col-sm-6 b-r-default p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fas fa-user-circle text-c-visiter f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${today_visit }</h5>
                                                      <p class="text-muted m-b-0">오늘 방문자수</p>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="col-sm-6 p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fas fa-calendar text-c-visiter f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${month_visit }</h5>
                                                      <p class="text-muted m-b-0">이번달 방문자수</p>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                  	  <!-- 게시글 수 -->
                                      <div class="row align-items-center b-b-default">
                                          <div class="col-sm-6 b-r-default p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fa-solid fa-pen text-c-visiter f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${today_write }</h5>
                                                      <p class="text-muted m-b-0">오늘 게시글수</p>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="col-sm-6 p-b-20 p-t-20">
                                              <div class="row align-items-center text-center">
                                                  <div class="col-4 p-r-0">
                                                      <i class="fa-regular fa-file-lines text-c-visiter f-24"></i>
                                                  </div>
                                                  <div class="col-8 p-l-0">
                                                      <h5>${total_write }</h5>
                                                      <p class="text-muted m-b-0">총 게시글수</p>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                               	  </div>
                          	  </div>
                          </div>
                          <!-- Material statustic card end -->

							<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
							<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
							<script>
							var chart1Label = [];
							var chart1woman = [];
							var chart1man = [];
							
							var chart2Label = [];
							var chart2cnt = [];
							
							$(document).ready(function(){
							
								$.ajax({
									url : 'chart.ad',
									type : 'POST',
									dataType : 'json',
									contentType : 'application/json;charset=utf-8',
									success : function(map) {
										console.log(map)
										
										if(map.chart1 != null && map.chart1 != ""){
											console.log("chart1")
											console.log(map.chart1)
											console.log(map.monthList)
											chart1Label = map.monthList;
											/*
											chart1woman.push({x:chart1Labels[0], y:0})
											chart1woman.push({x:chart1Labels[1], y:0})
											chart1woman.push({x:chart1Labels[2], y:0})
											chart1woman.push({x:chart1Labels[3], y:0})
											chart1woman.push({x:chart1Labels[4], y:0})
											chart1woman.push({x:chart1Labels[5], y:0})
											*/
											$.each(map.chart1, function(index, item){
												//alert(index+","+item);
												console.log(item.gender);
												console.log(item.year_month);
												if(item.gender == "woman"){
													chart1woman.push({x:item.year_month, y:item.count});
												}
												if(item.gender == "man"){
													chart1man.push({x:item.year_month, y:item.count});
												}
											});
											
											console.log(chart1Label)
											console.log(chart1woman)
											console.log(chart1man)
										}
										
										if(map.chart2 != null && map.chart2 != ""){
											console.log("chart2")
											console.log(map.chart2)
											
											$.each(map.chart2, function(index, item){
												//alert(index+","+item);
												console.log(item.age);
												console.log(item.cnt);
												
												chart2Label.push(item.age);
												chart2cnt.push(item.cnt);
											});
											
											console.log(chart2Label)
											console.log(chart2cnt)
										}
										
										barChart();
										lineChart();
									},
									error : function(jqXHR, textStatus, errorThrown){
										alert(textStatus + " : " + errorThrown);
									}
								});	
								
								
							})//ready
							
							function barChart(){
								console.log("barchart")
								console.log(chart1Label)
								console.log(chart1woman)
								console.log(chart1man)
							var ctx = $('#barchart').get(0).getContext('2d');
							var bardata =
							{
							    labels: chart1Label,
							    datasets:
							        [{
							        	labels: '여자',
							        	backgroundColor: '#F67280',
							            borderColor: 'rgba(255, 99, 132, 1.5)',
							            fill: false,
							            data: chart1woman
							        },
							        {
							        	labels: '남자',
							        	backgroundColor: '#748DA6', 
							            borderColor: 'rgba(54, 162, 235, 1.5)',
							            fill: false,
							            data: chart1man
							        }]
							};
							var baroptions = {
									//responsive: true,
									legend : {
										display: false
									},
									animation: false,
									tooltips: {
										mode: 'x',
										intersect: false,
							            displayColors: false, // 툴팁 바 컬러 표시 여부
							            titleFontColor: '#fff', // 툴팁 폰트 관련
							            titleAlign: 'center', // 툴팁 폰트 관련
							            bodyAlign : 'center',
							            callbacks: {
							            	beforeLabel: function(tooltipItem, data) {
							            		   var beforeLabel = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].x;
							            		   console.log('beforeLabel: '+beforeLabel);
							            		   return beforeLabel;
							            	},
							            	title: function(tooltipItem, data) {
							            		   //console.log('tooltipItem: '+tooltipItem);
							            		   //console.log('data: '+data);
							            		   //var title = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].x;
							            		   return '';
							            	},
							                label: function(tooltipItem, data) {
							                       var item = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].y;
							                       var label = data.datasets[tooltipItem.datasetIndex].labels;
							                       return label + ' : '+item + "명";
							            	}
							        	}
									},
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true,
												stepSize: 1,
												fontSize : 14,
											}
										}]
									}
							};
							var barChart = new Chart(ctx,{          
								type: 'bar',
								data: bardata,
								options: baroptions
							});
							}//bar chart
							
							function lineChart(){
								console.log("linechart")
								console.log(chart2Label)
								console.log(chart2cnt)
								//console.log("툴팁")
							    //console.log(chart2tooltip1)
							    //console.log(chart2tooltip2)
							    //console.log(chart2tooltip3)
							
							var ctx = $('#linechart').get(0).getContext('2d');
							var linedata =
							{
							    labels: ['~ 10대','20대','30대','40대','50대 ~'],
							    datasets:
							        [{
							        	labels: '방문자수',
							            borderColor: '#7FB77E',
							            fill: false,
							            data: chart2cnt
							        }]
							};
							var lineoptions = { 
									responsive: true,
									legend : {
										display: false
									},
									//animation: false,
									tooltips: {
							            displayColors: false, // 툴팁 바 컬러 표시 여부
							            titleFontColor: '#fff', // 툴팁 폰트 관련
							            titleAlign: 'center', // 툴팁 폰트 관련
							            callbacks: {
							            	label: function(tooltipItem, data) {
							                	   var item = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
							                	   //var label = data.datasets[tooltipItem.datasetIndex].labels[tooltipItem.index];
							                	   return '방문자수' + ' : '+ item + '명';
							        		}
							        	}
									},
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true,
												stepSize: 1,
												fontSize : 14,
											}
										}]
									}
							};
									
							var lineChart = new Chart(ctx,{          
								type: 'line',
								data: linedata,
								options: lineoptions
							});
							}//line chart
							
							</script>


                          <!-- Bar Chart Start -->
                          <div class="col-md-12 col-lg-6">
                              <div class="card">
                                  <div class="card-header">
                                      <h5>월별 가입자수 (성별)</h5>
                                      <div class="card-header-right">
                                          <ul class="list-unstyled card-option">
                                            <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                            <li><i class="fa fa-window-maximize full-card"></i></li>
                                            <li><i class="fa fa-minus minimize-card"></i></li>
                                            <li><i class="fa fa-refresh reload-card"></i></li>
                                            <li><i class="fa fa-trash close-card"></i></li>
                                          </ul>
                                      </div>
                                      <span>월별로 가입자수를 성별로 나누어서 나타냅니다. <br>(빨간색 : 여성, 파란색 : 남성)</span>
                                  </div>
                                  <div class="card-block">
                                      <div id="line-example">
                                        <canvas id="barchart" height="250" width="250"></canvas>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!-- Bar Chart Ends -->
                   
                          <!-- Line Chart Start -->
                          <div class="col-md-12 col-lg-6">
	                          <div class="card">
	                              <div class="card-header">
	                                  <h5>회원 방문자수 (나이)</h5>
	                                  <div class="card-header-right">
	                                      <ul class="list-unstyled card-option">
	                                        <li><i class="fa fa fa-wrench open-card-option"></i></li>
	                                        <li><i class="fa fa-window-maximize full-card"></i></li>
	                                        <li><i class="fa fa-minus minimize-card"></i></li>
	                                        <li><i class="fa fa-refresh reload-card"></i></li>
	                                        <li><i class="fa fa-trash close-card"></i></li>
	                                      </ul>
	                                  </div>
	                                  <span>오늘 방문자(회원만) 수를 나이대별로 나누어서 나타냅니다.</span><br>
	                              </div>
	                              <div class="card-block">
	                                  <div id="morris-bar-chart">
	                                  	<canvas id="linechart" height="250" width="250"></canvas>
	                                  </div>
	                              </div>
	                          </div>
                          </div>
                          <!-- Line Chart Ends -->

                          <!--  게시글 좋아요 start -->
                          <!--  고민하자 ... 어떻게 할지 ... -->
                          <!-- <div class="col-xl-12 col-md-12">
                            <div class="card table-card">
                              <div class="card-header">
                                <h5>게시글 좋아요 많은 순서</h5>
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
                              <div class="card-block">
                                <div class="table-responsive">
                                    <table class="table table-hover m-b-0 without-header">
                                      <tbody>
                                        <tr>
                                          <td>
                                            <div class="d-inline-block align-middle">
                                              작성자 그림?
                                              <img src="resources/assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                              <div class="d-inline-block">
                                                <h6>게시글 내용...?</h6>
                                                <p class="text-muted m-b-0">작성자</p>
                                              </div>
                                            </div>
                                          </td>
                                          <td class="text-right">
                                            <h6 class="f-w-700">$78.001<i class="fas fa-level-down-alt text-c-red m-l-10"></i></h6>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>
                                            <div class="d-inline-block align-middle">
                                              <img src="resources/assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                              <div class="d-inline-block">
                                                <h6>James Alexander</h6>
                                                <p class="text-muted m-b-0">Sales executive , EL</p>
                                              </div>
                                            </div>
                                          </td>
                                          <td class="text-right">
                                            <h6 class="f-w-700">$89.051<i class="fas fa-level-up-alt text-c-green m-l-10"></i></h6>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>
                                            <div class="d-inline-block align-middle">
                                              <img src="resources/assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                             <div class="d-inline-block">
                                                                 <h6>Shirley Hoe</h6>
                                                                 <p class="text-muted m-b-0">Sales executive , NY</p>
                                                             </div>
                                                         </div>
                                                     </td>
                                                     <td class="text-right">
                                                         <h6 class="f-w-700">$89.051<i class="fas fa-level-up-alt text-c-green m-l-10"></i></h6>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td>
                                                         <div class="d-inline-block align-middle">
                                                             <img src="resources/assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                             <div class="d-inline-block">
                                                                 <h6>Nick Xander</h6>
                                                                 <p class="text-muted m-b-0">Sales executive , EL</p>
                                                             </div>
                                                         </div>
                                                     </td>
                                                     <td class="text-right">
                                                         <h6 class="f-w-700">$89.051<i class="fas fa-level-up-alt text-c-green m-l-10"></i></h6>
                                                     </td>
                                                 </tr>
                                             </tbody>
                                         </table>

                                     </div>
                                 </div>
                             </div>
                           </div> -->
						   <!-- 게시글 좋아요 end -->
								
                      </div>
                  </div>
                  <!-- Page-body end -->
              </div>
              <div id="styleSelector"> </div>
          </div>
      </div>
  </div>
                    
<%@ include file="bottom.jsp" %>

</body>
</html>
