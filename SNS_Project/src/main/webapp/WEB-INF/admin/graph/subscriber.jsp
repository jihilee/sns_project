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
	.date {
		padding-left: 8px;
		padding-right: 8px;
		height: 35px;
		width: 80%;
	}
	.btn {
		border-radius: 2px;
	    text-transform: capitalize;
	    font-size: 15px;
	    padding: 6px 0px;
	    cursor: pointer;
	    height: 35px;
	    width: 20%;
	}
	</style>
	
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
                          <h5 class="m-b-10">가입자수 그래프 및 통계</h5>
                          <p class="m-b-0">You can see the data at a glance with a graph</p>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <ul class="breadcrumb">
                          <li class="breadcrumb-item">
                              <a href="index.ad"> <i class="fa fa-home"></i> </a>
                          </li>
                          <li class="breadcrumb-item">가입자수 그래프 및 통계</li>
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

							<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
							<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
							<script>
							$(document).ready(function(){
								
								//날짜 선택할때
								$('input[type="date"]').change(function(){
									//선택한 날짜
									var selected_date = $('input[type="date"]').val();
									//alert(selected_date); 
									//console.log(typeof selected_date) //string
									//var ymd = selected_date.split('-')
									//var year = ymd[0];
									//var month = ymd[1];
									//var day = ymd[2];
									//console.log(year+'년'+month+'월'+day+'일');
									
									var date = new Date(selected_date); //string to date
									console.log(date);
									var year = date.getFullYear();
									var month = date.getMonth()+1;
									var day = date.getDate();
									console.log(year+'년'+month+'월'+day+'일');
									
									//일주일 전 날짜
									var week_date = new Date(date.setDate(date.getDate() - 7));
									console.log(week_date);
									var y = week_date.getFullYear();
									var m = week_date.getMonth()+1;
									var d = week_date.getDate();
									console.log(y+'년'+m+'월'+d+'일');
								
									var str = y+'년 '+m+'월 '+d+'일' + ' ~ ' + year+'년 '+month+'월 '+day+'일'
									$('#period').html(str);
								}); //input[type=date].change
								
								$.ajax({
									url : 'subscriber.ad',
									type : 'POST',
									success : function(map) {
										console.log(map)
										
										//해당 월의 마지막날짜까지 넣기
										var last_date = new Date(map.year, map.month, 0);
										for(var i=1; i<=last_date.getDate(); i++) {
											chart1Label.push(i+"일");
											chart1.push(i); //숫자만 넣기
										}
										console.log(chart1Label);

										if(map.subscriber != null && map.subscriber != "") {
											console.log("subscriber chart")

											$.each(map.subscriber, function(index, item) {
												console.log(item.reg_date);
												var date = item.reg_date.split(" ")[0];
												console.log(date);
												var day = date.split("-")[2];
												day = day.replace(/(^0+)/, ""); //0으로 시작하는 문자열 0 없애기
												console.log(day);
												console.log("chart1Label - "+chart1Label[index]);
												
												console.log("index:"+index)
												chart1data.push({x:day+"일", y:item.cnt});
												
												console.log(item.cnt);
												//chart1data.push({x:day+"일", y:item.cnt});
											});
											
											console.log(chart1data);
										}

										lineChart();
										
										if(map.memberGender != null && map.memberGender != "") {
											console.log("member gender chart")
											
											var total = 0;
											$.each(map.memberGender, function(index, item){
												console.log(item.gender);
												console.log(item.cnt);
												total += item.cnt;
												
												chart2Label.push(item.gender);
												chart2data.push({x:item.gender,y:item.cnt});
											});
											
											chart2Label.push('total');
											chart2data.push({x:'total',y:total});
											console.log(chart2Label)
											console.log(chart2data)
										}
										
										barChart();
										
									},
									error : function(jqXHR, textStatus, errorThrown){
										alert(textStatus + " : " + errorThrown);
									}
								});	
								
							}); //ready
							
							var chart1 = [];
							var chart1Label = [];
							var chart1data = [];
							
							var chart2Label = [];
							var chart2data = [];

							//가입자수 선택 눌렀을 때
							function subscriber() {
							
								chart1Label = [];
								chart1data = [];
								
								$('#linechart').remove();
								$('#chartjs-line-chart').append('<canvas id="linechart" height="100" width="250"></canvas>');
								
								var year_month = $('input[type="month"]').val();
								console.log(year_month);
								var year = year_month.split("-")[0];
								var month = year_month.split('-')[1];
								//alert(year+"/"+month);
								
								$.ajax({
									url : 'subscriber.ad',
									type : 'POST',
									data : { ym : year_month },
									success : function(map) {
										console.log(map)
										
										//해당 월의 마지막날짜까지 넣기
										var last_date = new Date(year, month, 0);
										for(var i=1; i<=last_date.getDate(); i++) {
											chart1Label.push(i+"일");
										}
										console.log(chart1Label);

										if(map.subscriber != null && map.subscriber != "") {
											console.log("subscriber chart")

											$.each(map.subscriber, function(index, item) {
												console.log(item.reg_date);
												var date = item.reg_date.split(" ")[0];
												console.log(date);
												var day = date.split("-")[2];
												day = day.replace(/(^0+)/, ""); //0으로 시작하는 문자열 0 없애기
												console.log(day);
												console.log(item.cnt);
												chart1data.push({x:day+"일", y:item.cnt});
											});
											
											console.log(chart1data);
										}

										lineChart();
										
									},
									error : function(jqXHR, textStatus, errorThrown){
										alert(textStatus + " : " + errorThrown);
									}
								});	
								
							}//subscriber
							
							function lineChart(){
								console.log("linechart")
								console.log(chart1Label)
								console.log(chart1data)
							
							var ctx = $('#linechart').get(0).getContext('2d');
							var linedata =
							{
							    labels: chart1Label,
							    datasets:
							        [{
							        	labels: '가입자수',
							        	lineTension: 0, //직선
							            borderColor: '#8D9EFF',
							            fill: false,
							            data: chart1data
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
							            	beforeLabel: function(tooltipItem, data) {
							            		   var beforeLabel = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].x;
							            		   return beforeLabel;
							            	},
							            	title: function(context) {
							            		   console.log(context);
							            		   return '';
							            	},
							            	label: function(tooltipItem, data) {
							                	   var item = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].y;
							                	   //var label = data.datasets[tooltipItem.datasetIndex].labels[tooltipItem.index];
							                	   return '가입자수' + ' : '+ item + '명';
							        		}
							        	}
									},
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true,
												stepSize: 5,
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
							
							function barChart(){
								console.log("barchart")
								console.log(chart2Label)
								console.log(chart2data)

							var ctx = $('#barchart').get(0).getContext('2d');
							var bardata =
							{
								labels: chart2Label,
							    datasets:
							    	[{
							        	labels: '가입자수',
							            borderColor: '#8D9EFF',
							            fill: false,
							            data: chart2data
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
							            callbacks: {
							            	label: function(tooltipItem, data) {
							                	   var item = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].y;
							                	   //var label = data.datasets[tooltipItem.datasetIndex].labels[tooltipItem.index];
							                	   return '가입자수' + ' : '+ item + '명';
							        		}
							        	}
									},
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true,
												stepSize: 5,
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
							
							</script>
						  
						  <!-- Line Chart Start -->
                          <div class="col-md-12 col-lg-12">
	                          <div class="card">
	                              <div class="card-header">
	                                  <h5>가입자수</h5>
	                                  <div class="card-header-right">
	                                      <ul class="list-unstyled card-option">
	                                        <li><i class="fa fa fa-wrench open-card-option"></i></li>
	                                        <li><i class="fa fa-window-maximize full-card"></i></li>
	                                        <li><i class="fa fa-minus minimize-card"></i></li>
	                                        <li><i class="fa fa-refresh reload-card"></i></li>
	                                        <li><i class="fa fa-trash close-card"></i></li>
	                                      </ul>
	                                  </div>
	                                  <span>년도와 월을 선택하면 해당하는 월의 날짜별 가입자 수를 그래프로 볼 수 있습니다.</span><br>
	                                  <div class="col-md-6 col-lg-6">
	                                    <div class="row">
	                                  	    <input type="month" class="form-control date" value="${today }" max="${today }"/>
	                                  	    <button class="btn waves-effect waves-light btn-inverse btn-outline-inverse form-control" onclick="subscriber()">선택</button>
	                                    </div>
	                                  </div>
	                                  <span id="period"></span>
	                              </div>
	                              <div class="card-block">
	                                  <div id="chartjs-line-chart">
	                                  	<canvas id="linechart" height="100" width="250"></canvas>
	                                  </div>
	                              </div>
	                          </div>
                          </div>
                          <!-- Line Chart Ends -->

                          <!-- Bar Chart Start -->
                          <div class="col-md-12 col-lg-6">
	                          <div class="card">
	                              <div class="card-header">
	                                  <h5>전체 가입자수</h5>
	                                  <div class="card-header-right">
	                                      <ul class="list-unstyled card-option">
	                                        <li><i class="fa fa fa-wrench open-card-option"></i></li>
	                                        <li><i class="fa fa-window-maximize full-card"></i></li>
	                                        <li><i class="fa fa-minus minimize-card"></i></li>
	                                        <li><i class="fa fa-refresh reload-card"></i></li>
	                                        <li><i class="fa fa-trash close-card"></i></li>
	                                      </ul>
	                                  </div>
	                                  <span>전체 가입자 수를 성별로 나누어서 나타냅니다.</span><br>
	                              </div>
	                              <div class="card-block">
	                                  <div id="morris-bar-chart">
	                                  	<canvas id="barchart" height="150" width="250"></canvas>
	                                  </div>
	                              </div>
	                          </div>
                          </div>
                          <!-- Bar Chart Ends -->
                          
                          <div class="col-md-12 col-lg-6">
                              <div class="row">
                                  <!-- sale card start -->
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">어제 가입자수</h6>
                                              <h4 class="m-t-15 m-b-15"><i class="fa fa-user m-r-15 text-c-black"></i>${yesterday_subscriber }</h4>
                                              <p class="m-b-0">어제 가입자수는 <b>${yesterday_subscriber }명</b> 입니다.</p>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">오늘 가입자수</h6>
                                              <c:if test="${yesterday_subscriber < today_subscriber }">
                                              	<h4 class="m-t-15 m-b-15">
                                              		<i class="fa fa-arrow-up m-r-15 text-c-green"></i>${today_subscriber-yesterday_subscriber }
                                              	</h4>
                                              </c:if>
                                              <c:if test="${yesterday_subscriber == today_subscriber }">
                                              	<h4 class="m-t-15 m-b-15">
                                              		<i class="fa fa-user m-r-15 text-c-black"></i>${yesterday_subscriber-today_subscriber }
                                              	</h4>
                                              </c:if>
                                              <c:if test="${yesterday_subscriber > today_subscriber }">
                                              	<h4 class="m-t-15 m-b-15">
                                              		<i class="fa fa-arrow-down m-r-15 text-c-red"></i>${yesterday_subscriber-today_subscriber }
                                              	</h4>
                                              </c:if>
                                              <p class="m-b-0">오늘 가입자수는 <b>${today_subscriber }명</b> 입니다.</p>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="card bg-c-red total-card">
                                          <div class="card-block">
                                              <div class="text-left">
                                                  <h4>${min_subscriber }명</h4>
                                                  <p class="m-0">이번달 최저 가입자수</p>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="card bg-c-green total-card">
                                          <div class="card-block">
                                              <div class="text-left">
                                                  <h4>${max_subscriber }명</h4>
                                                  <p class="m-0">이번달 최고 가입자수</p>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">여성 가입자수</h6>
                                              <h4 class="m-t-15 m-b-15"><i class="fa-solid fa-venus m-r-15"></i>${woman }</h4>
                                              <p class="m-b-0">오늘 가입자수 중 여성의 수는 ${woman }명 입니다. </p>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">남성 가입자수</h6>
                                              <h4 class="m-t-15 m-b-15"><i class="fa-solid fa-mars m-r-15"></i>${man }</h4>
                                              <p class="m-b-0">오늘 가입자수 중 남성의 수는 ${man }명 입니다.</p>
                                          </div>
                                      </div>
                                  </div>
                                  <!-- sale card end -->
                              </div>
                          </div>
                          

                      </div>
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
s