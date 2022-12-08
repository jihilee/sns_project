<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>

<!--위치 표시 지도 The Modal -->
<div class="modal fade" id="find_map">
   <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">&nbsp;&nbsp;&nbsp;위치 정보</h4>
            <button type="button" class="close" data-dismiss="modal"  onclick="myModalClose()">&times;</button>
         </div>

         <!-- Modal body -->
         <div class="map-modal-body" style="padding-right:10px; padding-left:10px;">
            <div class="map_wrap" style="padding-left: 40px;">
               <div id="findmap"
                  style="width: 100%; height: 400px;"></div>
               <p>
                  <button id="relayout_btn">지도 새로고침</button>
                  *지도새로고침을 눌러주세요*
               </p>
                  <input type="hidden" id="aa">
               
            </div>
            <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ddeba899945d357cf074efe3300b31&libraries=services"></script>
            <script>
            function find_location(wno){
            	
            	var findLocation = $('#findLocation'+wno).val();
            	$('#aa').val(findLocation)
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});
				
				var mapContainer = document.getElementById('findmap'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 
				
				//장소
				var findLocation = document.getElementById('aa').value;
            	console.log(findLocation)
            	
				// 키워드로 장소를 검색합니다
				ps.keywordSearch(findLocation, placesSearchCB); 
            	
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();
				
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
            	
				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x) 
				    });
				
				    // 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				        infowindow.open(map, marker);
				    });
				
				
				//find_relayout
				$('#relayout_btn').click(function(){
					
					map.relayout();
					map.setCenter(new kakao.maps.LatLng(place.y, place.x))
					map.setLevel(3)
				})
				}
            }	
				
            
				</script>
		</div>

         <!-- Modal footer -->
         <div class="modal-footer">
            <button type="button" class="btn" data-dismiss="modal" name="ok">확인</button>
         </div>

      </div>
   </div>
</div>

<!-- 신고 modal -->
<div class="modal fade" id="report">
   <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
           <h4 class="modal-title">게시글 신고</h4>
           <button type="button" onclick="deleteRadio()" class="close" data-dismiss="modal">&times;</button>
         </div>

         <!-- Modal body -->
         <form action="report.wr" method="post" name="myform">
         <div id="modal-body" class="modal-body">
            <div class="row">
               <div class="col-xl-12 col-md-12">
                  <div class="card table-card reportModal">
                     <div class="card-header">
                        <div class="container">
                      <h5>신고 사유를 선택하세요.</h5>
                        </div>
                     </div>
                     <div class="card-block padding-0">
                       <div class="table-responsive">
                           <input type="hidden" name="wno" value=""> <!-- 게시글 번호 -->
                           <input type="hidden" name="report_mno" value="${login.no }"> <!-- 신고한 사람 -->
                           <table class="table">
                             <tr>
                        <td onclick="selectRadio(1)"><input type="radio" name="reason" value="스팸" id="1"><label for="1">&nbsp;&nbsp;스팸&nbsp;&nbsp;</label></td>
                             </tr>
                             <tr>
                        <td onclick="selectRadio(2)"><input type="radio" name="reason" value="나체 이미지 또는 성적 행위" id="2"><label for="2">&nbsp;&nbsp;나체 이미지 또는 성적 행위&nbsp;&nbsp;</label></td>
                             </tr>
                             <tr>
                        <td onclick="selectRadio(3)"><input type="radio" name="reason" value="괴롭힘 또는 따돌림" id="3"><label for="3">&nbsp;&nbsp;괴롭힘 또는 따돌림&nbsp;&nbsp;</label></td>
                             </tr>
                             <tr>
                        <td onclick="selectRadio(4)"><input type="radio" name="reason" value="폭력물" id="4"><label for="4">&nbsp;&nbsp;폭력물&nbsp;&nbsp;</label></td>
                             </tr>
                             <tr>
                        <td onclick="selectRadio(5)"><input type="radio" name="reason" value="거짓정보" id="5"><label for="5">&nbsp;&nbsp;거짓정보&nbsp;&nbsp;</label></td> 
                             </tr>
                             <tr onclick="selectRadio(6)">
                        <td><input type="radio" name="reason" value="기타" id="6">&nbsp;&nbsp;기타:<input class="form-control" type="text" name="reason" value="" onkeydown="selectRedio(6)"></td>
                             </tr>
                           </table>
                       </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- Modal footer -->
         <div class="modal-footer">
            <button type="button" class="btn" data-dismiss="modal" onclick="deleteRadio()">취소</button>
            <button type="submit" class="btn" onclick="checkRadio()">확인</button>
         </div>
         </form>

       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
       <script type="text/javascript">
          function selectRadio(radio) {
             //alert(radio);
             $('input[type="radio"]').attr("checked",false);
             $('input[type="text"]').val("");
             //버튼 체크
             $('#'+radio).attr("checked",true);
          }
          
          function deleteRadio() {
             //alert("delete")
             $('input[type="radio"]').attr("checked",false);
          }
          
          function checkRadio() {
             if($('input[type="radio"]').is(":checked") == false) {
                return false;
             }
             
             if($('input[type="text"]').val() == "") {
                return false;
             }
          }
       </script>


      </div>
   </div>
</div>
<!-- 신고 끝 -->

<!-- detailPost 모달 -->
<!-- The Modal -->
<div class="modal fade" id="detailPost">
   <div class="modal-dialog Large modal-lg modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <div class="box" style="display: inline-block;">
               <img class="profile" id="detail_profile" src=""
                  style="display: inline-block;">
            </div>
            <table class="tableHeader">
               <tr>
                  <td colspan="2" id="detailtd" style="padding-left: 10px;">
                     <h4 class="modal-title" id="detailName"
                        style="vertical-align: middle;">&nbsp;&nbsp;</h4>
                  </td>
               </tr>
               <tr>
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
         <div id="modal-body" class="modal-body">
            <div class="row">
               <!-- 사진 부분 시작 -->
               <div class="col-xl-6 col-md-12">
                  <div class="card table-card">
                     <div class="card-header">
                        <div class="container">
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
                           <video id="getvideo" style="width: 100%; height: 100%; object-fit: fill; padding-left: 15px;" autoplay loop muted controls></video>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- 사진 부분 끝 -->
               <!-- 댓글 부분 시작 -->
               <div class="col-xl-6 col-md-12">
                  <div class="card table-card">
                     <div class="card-header">
                        <table width="100%" id="allcomments">

                        </table>
                        <input type="hidden" name="ref"> 
                        <input type="hidden" name="re_step"> 
                        <input type="hidden" name="re_level">
                        <input type="hidden" name="no">
                        <br> <br>
                        <div class="row">
                           <div class="col-sm-8">
                              <div class="form-group form-default form-static-label">
                                 <input type="text" name="c_contents" class="form-control"
                                    placeholder="댓글달기.." onClick="c_contents()"> <span
                                    class="form-bar"></span>
                              </div>
                           </div>
                           <input type="hidden" name="cno"> <input type="hidden"
                              name="wno"> <input type="button" name="post" id="post"
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


<!--지도 The Modal -->
<div class="modal fade" id="myModal">
   <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">&nbsp;&nbsp;&nbsp;내 위치 등록</h4>
            <button type="button" class="close" data-dismiss="modal"  onclick="myModalClose()">&times;</button>
         </div>

         <!-- Modal body -->
         <div class="map-modal-body">
            <div class="map_wrap">
               <div id="map"
                  style="width: 500px; height: 400px; position: relative; overflow: hidden;"></div>
               <p>
                  <button onclick="relayout()">지도 새로고침</button>
                  *지도새로고침을 눌러주세요*
               </p>
                  <div id="clickLatlng"></div> 
                  <input type="hidden" name="myposition" id="myposition">
                  <input type="hidden" name="myaddress" id="myaddress">

               <div id="menu_wrap" class="bg_white">
                  <div class="option">
                     <div>
                        <form onsubmit="searchPlaces(); return false;">
                           키워드 : <input type="text" value="" id="keyword" size="15">
                           <button type="submit">검색하기</button>
                        </form>
                     </div>
                  </div>
                  <hr>
                  <ul id="placesList"></ul>
                  <div id="pagination"></div>
               </div>
            </div>

            <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ddeba899945d357cf074efe3300b31&libraries=services"></script>
            <script>
               // 마커를 담을 배열입니다
               var markers = [];
               
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                   mapOption = {
                       center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                       level: 2 // 지도의 확대 레벨
                   };  
               
               // 지도를 생성합니다    
               var map = new kakao.maps.Map(mapContainer, mapOption); 
               
               // 장소 검색 객체를 생성합니다
               var ps = new kakao.maps.services.Places();  
               
               // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
               var infowindow = new kakao.maps.InfoWindow({zIndex:1});
               
               // 키워드로 장소를 검색합니다
               searchPlaces();
               
               function relayout() {    
                   
                   // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
                   // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
                   // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
                   map.relayout();
               }
               
               function setCenter() {            
                   // 이동할 위도 경도 위치를 생성합니다 
                   var moveLatLon = new kakao.maps.LatLng(37.566826, 126.9786567);
                   
                   // 지도 중심을 이동 시킵니다
                   map.setCenter(moveLatLon);
               }
               
               // 키워드 검색을 요청하는 함수입니다
               function searchPlaces() {
                  //alert(1)
                   var keyword = document.getElementById('keyword').value;
               
                   /* if (!keyword.replace(/^\s+|\s+$/g, '')) {
                       alert('키워드를 입력해주세요!');
                       return false;
                   } */
               
                   // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                   ps.keywordSearch( keyword, placesSearchCB); 
               }
               
               // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
               function placesSearchCB(data, status, pagination) {
                   if (status === kakao.maps.services.Status.OK) {
               
                       // 정상적으로 검색이 완료됐으면
                       // 검색 목록과 마커를 표출합니다
                       displayPlaces(data);
               
                       // 페이지 번호를 표출합니다
                       displayPagination(pagination);
               
                   } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
               
                       alert('검색 결과가 존재하지 않습니다.');
                       return;
               
                   } else if (status === kakao.maps.services.Status.ERROR) {
               
                       alert('검색 결과 중 오류가 발생했습니다.');
                       return;
               
                   }
               }
               
               // 검색 결과 목록과 마커를 표출하는 함수입니다
               function displayPlaces(places) {
                  
                   var listEl = document.getElementById('placesList'), 
                   menuEl = document.getElementById('menu_wrap'),
                   fragment = document.createDocumentFragment(), 
                   bounds = new kakao.maps.LatLngBounds(), 
                   listStr = '';
                   
                   // 검색 결과 목록에 추가된 항목들을 제거합니다
                   removeAllChildNods(listEl);
               
                   // 지도에 표시되고 있는 마커를 제거합니다
                   removeMarker();
                   for ( var i=0; i<places.length; i++ ) {
                       // 마커를 생성하고 지도에 표시합니다
                       var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                           marker = addMarker(placePosition, i), 
                           itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
               
                       // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                       // LatLngBounds 객체에 좌표를 추가합니다
                       bounds.extend(placePosition);
               
                       // 마커와 검색결과 항목에 mouseover 했을때
                       // 해당 장소에 인포윈도우에 장소명을 표시합니다
                       // mouseout 했을 때는 인포윈도우를 닫습니다
                       (function(marker, title,road) {
                          
                          kakao.maps.event.addListener(marker, 'click', function() {
                               
                               var message = '클릭한 장소는 ' + title + ' 입니다 ';
                            
                            var resultDiv = document.getElementById('clickLatlng'); 
                            resultDiv.innerHTML = message;
                            
                            document.getElementById('myposition').value = title;
                            document.getElementById('myaddress').value = road;
                           });
                          
                       })(marker, places[i].place_name,places[i].road_address_name);
               
                       fragment.appendChild(itemEl);
                   }
               
                   // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                   listEl.appendChild(fragment);
                   menuEl.scrollTop = 0;
               
                   // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                   map.setBounds(bounds);
               }
               
               function add(place,address){
                  var check = confirm(place+" 추가하시겠습니까?")
                  
                  if(check==true){
                     var message = '선택한 장소는 ' + place + ' 입니다 ';
                      
                      var resultDiv = document.getElementById('clickLatlng'); 
                      resultDiv.innerHTML = message;
                      
                      document.getElementById('myposition').value = place;
                      document.getElementById('myaddress').value = address;
                  }
               }
               
               
               // 검색결과 항목을 Element로 반환하는 함수입니다
               function getListItem(index, places) {
               
                   var el = document.createElement('li'),
                   itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                               '<div class="info">' +
                               '   <h5>' + places.place_name + '</h5>';
                  
                   if (places.road_address_name) {
                       itemStr += '    <span>' + places.road_address_name + '</span>' +
                                   '   <span class="jibun gray">' +  places.address_name  + '</span>';
                   } else {
                       itemStr += '    <span>' +  places.address_name  + '</span>'; 
                   }
                                
                     itemStr += '  <span class="tel">' + places.phone  + '</span>';
                               
                     itemStr += '  <input type="button" value="추가하기" onclick="add(\''+places.place_name+'\',\''+places.road_address_name+'\')"></div>';  
               
                   el.innerHTML = itemStr;
                   el.className = 'item';
               
                   return el;
               }
               
               // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
               function addMarker(position, idx, title) {
                   var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                       imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                       imgOptions =  {
                           spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                           spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                           offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                       },
                       markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                           marker = new kakao.maps.Marker({
                           position: position, // 마커의 위치
                           image: markerImage 
                       });
               
                   marker.setMap(map); // 지도 위에 마커를 표출합니다
                   markers.push(marker);  // 배열에 생성된 마커를 추가합니다
               
                   return marker;
               }
               
               // 지도 위에 표시되고 있는 마커를 모두 제거합니다
               function removeMarker() {
                   for ( var i = 0; i < markers.length; i++ ) {
                       markers[i].setMap(null);
                   }   
                   markers = [];
               }
               
               // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
               function displayPagination(pagination) {
                   var paginationEl = document.getElementById('pagination'),
                       fragment = document.createDocumentFragment(),
                       i; 
               
                   // 기존에 추가된 페이지번호를 삭제합니다
                   while (paginationEl.hasChildNodes()) {
                       paginationEl.removeChild (paginationEl.lastChild);
                   }
               
                   for (i=1; i<=pagination.last; i++) {
                       var el = document.createElement('a');
                       el.href = "#";
                       el.innerHTML = i;
               
                       if (i===pagination.current) {
                           el.className = 'on';
                       } else {
                           el.onclick = (function(i) {
                               return function() {
                                   pagination.gotoPage(i);
                               }
                           })(i);
                       }
               
                       fragment.appendChild(el);
                   }
                   paginationEl.appendChild(fragment);
               }
               
               // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
               // 인포윈도우에 장소명을 표시합니다
               function displayInfowindow(marker, title) {
                  //alert('title : '+title)
                   var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
               
                   infowindow.setContent(content);
                   infowindow.open(map, marker);
               }
               
                // 검색결과 목록의 자식 Element를 제거하는 함수입니다
               function removeAllChildNods(el) {   
                   while (el.hasChildNodes()) {
                       el.removeChild (el.lastChild);
                   }
               }
                /* =================직접 장소 지정================= */
                // 지도를 클릭한 위치에 표출할 마커입니다
                  var marker = new kakao.maps.Marker({ 
                      // 지도 중심좌표에 마커를 생성합니다 
                      position: map.getCenter() 
                  }); 
                  // 지도에 마커를 표시합니다
                  marker.setMap(map);
                  
                  // 지도에 클릭 이벤트를 등록합니다
                  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                      
                     
                     //clickLatlng 초기화
                     document.getElementById('myposition').value=null;
                     document.getElementById('myaddress').value=null;
                     
                     removeAllChildNods(document.getElementById('clickLatlng'));
                     
                      // 클릭한 위도, 경도 정보를 가져옵니다 
                      var latlng = mouseEvent.latLng; 
                      
                      // 마커 위치를 클릭한 위치로 옮깁니다
                      marker.setPosition(latlng);
                      
                      /* var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                      message += '경도는 ' + latlng.getLng() + ' 입니다';
                      
                      var resultDiv = document.getElementById('clickLatlng'); 
                      resultDiv.innerHTML = message; */
                      
                  });
               </script>
         </div>

         <!-- Modal footer -->
         <div class="modal-footer">
            <button type="button" class="btn" data-dismiss="modal" onclick="myModalClose()">닫기</button>
            <button type="button" class="btn" data-dismiss="modal" name="ok">확인</button>
         </div>

      </div>
   </div>
</div>


<!-- 지도 끝 -->


<!-- Friends_Tag Modal 시작 -->
  <div class="modal fade" id="friendsModal" style="width: 500px; margin: auto;">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">&nbsp;&nbsp;&nbsp;친구 태그하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form class="mb-3" name="myform" id="myform" method="post">
   <fieldset class="filedset1">
   </fieldset>
   <div>
   		<div>
		  <label for="friendsList">태그하고싶은 친구</label>
		  <input name="chosenFriends" multiple list= "frinedsList" type="email" placeholder="친구아이디 검색(여러명 선택시 ','를 사용하세요)" class="form-control">
		  <datalist id="frinedsList" style="display: none;" class="form-control">
		  	<c:set var="friends" value="${fn:split(fname,',')}" />
			<c:forEach var="friend" items="${friends}" varStatus="i" >
			    <option value="${friend}">
			</c:forEach>
		  </datalist>
		</div>
   	
   </div>
      </form>      
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" id="tagFriends">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$('#tagFriends').click(function(){
		$("#selectFriends").empty();
		$("#f_tag").empty();
		//alert($('input[name="chosenFriends"]').val());
		$('#selectFriends').append("@"+$('input[name="chosenFriends"]').val());
		$('#f_tag').attr('value',$('input[name="chosenFriends"]').val());
	}); //tagFriends

</script>
<!-- 모달끝  -->		