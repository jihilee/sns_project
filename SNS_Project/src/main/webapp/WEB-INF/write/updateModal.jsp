<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
    <style>
    
/* start jh hashtag style */
ul {
  padding: 16px 0;
}

ul li {
  display: inline-block;
  margin: 0 3px;
  font-size: 14px;
  letter-spacing: -.5px;
}

ul li.tag-item {
  padding: 2px 4px;
  background-color: #F6F6F6;
  color: #448AFF;
}

.tag-item:hover {
  background-color: #448AFF;
  color: #FFFFFF;
}

.del-btn {
  font-size: 12px;
  font-weight: bold;
  cursor: pointer;
  margin-left: 8px;
}

#tagbox{
  display: inline-block;
  margin: 3px 3px;
  font-size: 14px;
  letter-spacing: -.5px;
  padding: 2px 4px;
  background-color: #F6F6F6;
  color: #448AFF;
}
#tagbox:hover{
  background-color: #448AFF;
  color: #FFFFFF;
}
/* end jh hashtag */
    
#modifyWrite {
    max-height:800px;
    overflow-y:auto;
}
    
 #uselectFriends{
 	color:	#148CFF;
 }
    
 #getVideo{
    width: 40%;
    height: 40%;
    object-fit: fill;
    padding-left: 15px;
}   
 .update_video-preview{
    width: 40%;
    height: 40%;
    object-fit: fill;
    padding-left: 15px;
}   
   
#ulocation{
   color: blue;
   display: inline-block;
}
   .getImgs{
      width : 150px;
   }
   ul{
      list-style:none;
   }
   .beforeImg{
      max-width:500px; 
      width:500px; 
      height:150px;
      
   }
   #getImg ul{ 
      white-space:nowrap; 
       overflow-x: auto; 
       text-align:center;
       margin-right:50;
   }
   #getImg ul li{
      display:inline-block; 
      padding: 5px;
   }

    </style>
  </head>
  <body>
 
    <!-- first modal -->
      <div class="modal fade" id="modifyWrite"  aria-hidden="true" >
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content" style="width: 510px; padding: 5px; margin-left: 150px;">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">&nbsp;&nbsp;&nbsp;게시글 수정하기</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="javascript:location.reload()">×</button>
        </div>
   
          <!-- first card start(write) -->                  
                  <div class="col-sm-8">
                     <form name="updateForm" id="uptag-form" action="update.wr" method="post" enctype="multipart/form-data">
                        <div class="card" style="width:500px; right:16px;">
                           <div class="card-header">
                              <div style="display: inline-block; vertical-align: top;">
                                 <input type="text" value="${login.name }" id="readOnlyInput" readonly="readonly" class="form-control"> <!-- session.getAttribute(로그인정보) -->
                                 <input type="hidden" id="no" name="no">
                                 <input type="hidden" name="wno" id="wno"> 
                              </div>
                              <div style="display: inline-block;">
                                 <select name="scope" id="scope" class="form-select" onclick="javascript:allScope()">
                                 </select>
                                 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>               
                                 <script type="text/javascript">
                                 
                                    function allScope(){
                                       var value = $('#map_scope').val();
                                       
                                       //alert(value);
                                       
                                       if(value == "public"){
                                          //alert(1);    
                                          $('#scope option[value="onlyMe"]').remove();
                                          $('#scope option[value="onlyFriends"]').remove();
                                          $('#public').remove();
                                          var options = '<option id="onlyMe" value="onlyMe">나만보기</option>'
                                                      +'<option id="onlyFriends" value="onlyFriends">친구만보기</option>';
                                          $('#scope').append(options); 
                                       }
                                       else if(value == "onlyMe"){
                                          //alert(2);   
                                          $('#onlyMe').remove();
                                          $('#scope option[value="public"]').remove();
                                          $('#scope option[value="onlyFriends"]').remove();
                                          $('#scope').append('<option id="onlyFriends" value="onlyFriends">친구만보기</option>');
                                          $('#scope').append('<option id="public" value="public">전체공개</option>');
                                       }
                                       else { //onlyFriends
                                          //alert(3); 
                                          $('#onlyFriends').remove();
                                          $('#scope option[value="onlyMe"]').remove();
                                          $('#scope option[value="public"]').remove();
                                          $('#scope').append('<option id="onlyMe" value="onlyMe">나만보기</option>');
                                          $('#scope').append('<option id="public" value="public">전체공개</option>');
                                          
                                       }
                                       
                                       $('#scope').on("change",function(){
                                    	  //alert(1); 
                                    	  //alert($('#scope').val());
                                    	  if($('#scope').val() == $('#onlyMe').val()){
	                                    	  $('#map_scope').attr('value',$('#onlyMe').val());
	                                    	  $('#map_scope').html('나만보기');
                                    	  }
                                    	  if($('#scope').val() == $('#public').val()){
	                                    	  $('#map_scope').attr('value',$('#public').val());
	                                    	  $('#map_scope').html('전체공개');
                                    	  }
                                    	  if($('#scope').val() == $('#onlyFriends').val()){
	                                    	  $('#map_scope').attr('value',$('#onlyFriends').val());
	                                    	  $('#map_scope').html('친구만보기');
                                    	  }
                                   
                                       });
                                       
                                    }
                                    
                                    
                                    </script>
                                 <input type="hidden" name="upload_date" id="upload_date">
                              </div>
                              <div class="form-group row">
                                        <div class="col-sm-6">
                                              <input type="button" name="button"
                                                 class="btn btn-primary btn-sm waves-effect waves-light"
                                                 value="내 위치" id="updateMap" style=" vertical-align: top; margin-top: 5px;">
                                              <input type="button" name="button" style="display:none;" id="clicked_updateMap" data-toggle="modal" data-target="#myModal" style=" vertical-align: top; margin-top: 5px;">
                                                 <span id="ulocation" style="display: none;"></span>
                                              <input type="hidden" name="location">
                                              <input type="hidden" name="address">
                                              <input type="hidden" name="likes">
                                              <input type="text" name="check" style="display:none;" >
                                              
                                              <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                                    <script>
                                    $('#updateMap').click(function(){
                                        $('#clicked_updateMap').click();
                                        upmap();
                                        $('input[name="check"]').attr('value','1');
                                        $('#modifyWrite').attr('style','display: block; z-index:1000;');
                                     })
                                     </script>
                                        </div>
                                     </div>
                           </div>
                           <div class="card-block" >
                           <!-- 수정전 이미지 -->
                                <div class="beforeImg" style="display:none; ">
                                 <div id="getImg">
                                 
                                 </div>
                              </div>
                           <!-- 수정전 동영상  -->
                              <div class="beforeVideo" style="display:none; ">
                                 <div>
                                    <video id="getVideo" autoplay loop muted controls ></video>
                                 </div>
                              </div>
                              <textarea name="contents" id="contents" placeholder="${login.name }님, 무슨생각을 하고 계신가요?"
                                 rows="7" cols="100" class="form-control"
                                 style="resize: none; margin-top:15px;"></textarea>
   
                         <!-- jh hashtag  -->
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>                     
//jh hashtag script
$('document').ready(function(){

  var tag = {};
  counter = 0;

  // 태그를 추가한다.
  function addTag(value) {
    tag[counter] = value; // 태그를 Object 안에 추가
    console.log(tag[counter]);
    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
  }

  // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
  function marginTag() {
    return Object.values(tag).filter(function(word) {
        return word !== "";
      });
  }
  
//서버에 제공
  $("#uptag-form").on("submit", function (e) {
      var value = marginTag(); // return array
      //alert(value);
      $("#up_rdTag").val(value); 
      $(this).submit();
  });

  $("#update_tag").on("keyup", function (e) {
      var self = $(this);
      console.log("keypress");

      // input 에 focus 되있을 때 스페이스바 입력시 구동
      if (e.keyCode == 32) {
        
         counter = $(".tag-item").length;
         //alert(counter);
         
       $(".tag-item #tag_v").each(function(index, element) {
          tag[index] = $(this).text();
          counter = index;
          counter++;
          console.log(tag[index]);
       });
         
         
        var tagValue = $.trim(self.val()); // 값 가져오기
        //alert(tagValue);
        // 값이 없으면 동작 안합니다.
        if (tagValue != "") {

          // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
          var result = Object.values(tag)
            .filter(function (word) {
              return word === tagValue;
            })

          // 태그 중복 검사
          if (result.length == 0) {
            $("#update_tag-list")
              .append("<li class='tag-item'><span id='tag_v'>" + tagValue + "</span><span class='del-btn' idx='" + counter + "'>x</span></li>");
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
                           <input type="text" size="7" id="update_tag" placeholder="스페이스바로 해시태그를 등록해주세요"  class="form-control" style="margin-top:-15px;">
                           <input type="hidden" value="" name="up_rdTag" id="up_rdTag">
                           <ul class="form-group" id="update_tag-list">
                              <!-- <li class='tag-item'>"+map.tag1+"<span class='del-btn' idx='"+0+"'>x</span></li> -->
                           </ul>
                        </div>    
                     <!-- end jh hashtag  -->  
   
   
                              <div class="container" style="float: right; margin-top: -30px;">
                                 
                                 <!-- 이미지  -->
                                 <input type="file" accept=".jpg, .png" multiple style="display:none;" id="uimage" name="uimage">
                                    <a href="" style="text-decoration: none;">
                                     <img src="resources/logo/img.png" width="40px" id="uimg">
                                    </a> 
                                    <input type="text" name="beforeImage" style="display: none;"> 
                                    
                                    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                                    <script>
                                       
                                       $('#uimg').click(function (e) {
                                                 document.updateForm.uimg.value = document.getElementById( 'uimg' ).src;
                                                 e.preventDefault();
                                                 $('#uimage').click();
                                                 $('#img_preview').click();
                                          });   
                                    </script>
                           
                                 <!-- 비디오 -->   
                                    <a href="" style="text-decoration: none;"> 
                                       <img src="resources/logo/video.png" width="40px" id="uvideoclick">
                                    </a> 
                                    <input type="file" class="update_upload-video-file" accept=".mp4" id="uvideofile" style="display: none;" name="uvideo">
                                    <input type="text" name="beforeVideo"  style="display: none;">
                                 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                                 <script>

                                       $('#uvideoclick').click(function (e) {
                                              document.updateForm.uvideoclick.value = document.getElementById( 'uvideoclick' ).src;
                                              e.preventDefault();
                                              $('#uvideofile').click();
                                              $('#video_preview').click();
                                       });   
                                    
                                 </script>
                                 <!-- 친구태그 -->
                                    <a href="" style="text-decoration: none;"> 
                                        <img src="resources/logo/friends.png" width="40px" id="ufriends">
                                    </a> 
                                    <input type="button" id="friendstag" style="display: none;" data-toggle="modal" data-target="#friendsModal"> 
                                    <input type="text" name="f_tag" id="uf_tag" style="display:none;">
                                    <a id="uselectFriends" style="display: inline-block;"></a>
                                    
                                    <input type="button" id="ufriendstag" style="display: none;" data-toggle="modal" data-target="#updateFriendsModal"> 
                                    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                                    <script>
   
                                       $('#ufriends').click(function (e) {
                                                 document.updateForm.ufriends.value = document.getElementById( 'ufriends' ).src;
                                                 e.preventDefault();
                                                 $('#ufriendstag').click();
                                          });                                           
                                    </script>
                                    <!-- Friends_Tag Modal 시작 -->
  
                                    <div style='float: right;'>
                                       <input type="submit" value="수정" class="btn btn-primary">
                                    </div>
                              </div>
                              
                           </form>
                                 
<!--upload preview start -->
      <input id="video_preview"  type="button" onclick="clickVideoPreview()"  style="display: none;">
      <div style="display: none;" class='update_video-prev' class="pull-right">
          <video height="100" width="180" class="update_video-preview" autoplay muted controls/>
       </div>
      <div id='image_preview'>
      <input id="img_preview" type="button" onclick="clickImagePreview()" style="display: none;">
         <div id='u_att_zone'
            data-placeholder='파일을 첨부 하려면 버튼을 클릭하거나 드래그앤드롭 하세요'>
            </div>
      </div>   
      
<script type="text/javascript">
function clickImagePreview(){
   //alert(3);
( /* u_att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(u_att_zone, btn){
    var attZone = document.getElementById(u_att_zone);
    var imgfile = document.getElementById(btn);
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
)('u_att_zone', 'uimage') //imgfile or videofile 

}
</script>

<script>
function clickVideoPreview(){

   $(function() {
       $('.update_upload-video-file').on('change', function(){
         if (isVideo($(this).val())){
           $('.update_video-preview').attr('src', URL.createObjectURL(this.files[0]));
           $('.update_video-prev').show();
         }
         else
         {
           $('.update_upload-video-file').val('');
           $('.update_video-prev').hide();
           alert("비디오 파일만 선택 가능합니다.")
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
}
</script>
<!--upload preview end -->                     
         
         </div>
      </div> 
   <!-- first card end -->                        
   </div>
</div>
<!-- 모달끝  -->      


<!--지도 The Modal -->
<div class="modal fade" id="myModal">
   <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">&nbsp;&nbsp;&nbsp;내 위치 수정</h4>
            <button type="button" class="close" data-dismiss="modal" onclick="myModalClose()">&times;</button>
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
                  <input type="hidden" name="myposition" id="umyposition">
                  <input type="hidden" name="myaddress" id="umyaddress">

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
            function upmap(){
               //alert('upmap');
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
                     //alert("keyword="+keyword);
                   /* if (!keyword.replace(/^\s+|\s+$/g, '')) {
                       alert('키워드를 입력해주세요!');
                       return false;
                   } */
               
                   // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                   ps.keywordSearch( keyword, placesSearchCB); 
                   //alert(2);
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
                            
                            document.getElementById('umyposition').value = title;
                            document.getElementById('umyaddress').value = road;
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
                      
                      document.getElementById('umyposition').value = place;
                      document.getElementById('umyaddress').value = address;
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
                     document.getElementById('umyposition').value=null;
                     document.getElementById('umyaddress').value=null;
                     
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
            }
               </script>
         </div>

         <!-- Modal footer -->
         <div class="modal-footer">
            <button type="button" class="close" data-dismiss="modal" onclick="myModalClose()">닫기</button>
            <button type="button" class="close" data-dismiss="modal" onClick="location()">확인</button>
         </div>

      </div>
   </div>
</div>


<!-- 지도 끝 -->


<div class="modal fade" id="updateFriendsModal"  aria-hidden="true" style="width: 500px; margin: auto;">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">&nbsp;&nbsp;&nbsp;친구 태그하기</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="updateFriendsModalClose() ">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form class="mb-3" name="myform" id="myform" method="post">
   <fieldset class="filedset1">
   </fieldset>
   <div>
         <div>
        <label for="ufrinedsList">태그하고싶은 친구</label>
        <input name="uchosenFriends" multiple list="ufrinedsList" type="email" placeholder="친구아이디 검색(여러명 선택시 ','를 사용하세요)" class="form-control">
        <datalist id="ufrinedsList" style="display: none;" class="form-control">
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
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateFriendsModalClose()" id="utagFriends">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
   $('#utagFriends').click(function(){
      $("#uselectFriends").empty();
      $("#uf_tag").empty();
      //alert("chosenFreinds="+$('input[name="chosenFriends"]').val());
      $('#uselectFriends').append("@"+$('input[name="uchosenFriends"]').val());
      $('#uf_tag').attr('value',$('input[name="uchosenFriends"]').val());
   }); //tagFriends

</script>
<!-- 모달끝  -->      

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>               
    <script>
    function myModalClose(){ 
         $('#myModal').modal('hide');
     	$('#modifyWrite').attr('style','display: block;');
    }
      function modifyWriteClose() {
         location.reload();
      }
      function updateFriendsModalClose() {
         $('#updateFriendsModal').modal('hide');
      }
</script>