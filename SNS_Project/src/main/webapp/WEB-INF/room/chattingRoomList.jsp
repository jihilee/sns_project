<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../write/style.jsp"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/bootstrap/css/bootstrap.css">	
	
<style>
	#toptoptop{
		margin-top:5px;
	}
</style>
<%@include file="/WEB-INF/top&bottom/top.jsp"%>

<script type="text/javascript">

   var chatlist = [];

    $('document').ready(function(){
       $('#creRoom').click(function(){
          //alert(1);
          var read_mno = $('#selectedFr').val();
          var room_no;
         
         //창 크기 지정
         var width = 550;
         var height = 550;
         
         //pc화면기준 가운데 정렬
         var left = (window.screen.width / 2) - (width/2);
         var top = (window.screen.height / 4);
         
         //윈도우 속성 지정
         var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=no, titlebar=yes, location=yes, titlebar=yes';
         
          //child form
         //parent form
          window.name = "chattingList";
         
       
         $.ajax({
            type : 'POST',
            url : 'getRoom_no.room',
            dataType : 'json',
            data : {
               read_mno : read_mno
            },
            success : function(data){
               room_no = data;
               //alert(read_mno +"/"+room_no);
               
               //연결하고싶은url
                var path= '<%=request.getContextPath()%>/getChattingRoom.chat?read_mno='+read_mno+'&room_no='+room_no;
         
               //등록된 url 및 window 속성 기준으로 팝업창을 연다.
               var pop = window.open(path, "chatting room", windowStatus);
               pop.focus();
            },
            error : function(){
               console.log('오류');
               return false;
            }
         });
       });//creRoom

       $('#cloRoom').click(function(){
          location.reload(true);
       });

    });//document
    
function gotochat(room_no,read_mno){
   /*  
       var room_no = $('input[name="room_no"]').val();
       var read_mno = $('input[name="read_mno"]').val();
       var send_mno = $('input[name="send_mno"]').val();
    */
      //alert("gotochat:"+room_no+"/"+read_mno);
      //창 크기 지정
      var width = 550;
      var height = 550;
      
      //pc화면기준 가운데 정렬
      var left = (window.screen.width / 2) - (width/2);
      var top = (window.screen.height / 4);
      
      //윈도우 속성 지정
      var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=no, titlebar=yes, location=yes, titlebar=yes';
      
       //연결하고싶은url
       var path= '<%=request.getContextPath()%>/getChattingRoom.chat?room_no='+room_no+'&read_mno='+read_mno;
   
       //child form
      //parent form
       window.name = "chattingList";
      //등록된 url 및 window 속성 기준으로 팝업창을 연다.
      var pop = window.open(path, "chatting room", windowStatus);
      pop.focus();
}

function delRoom(room_no,read_mno){
   //alert(room_no+"/"+read_mno);
   var yes = confirm('채팅방을 삭제하시겠습니까?');
   if(yes){
      $.ajax({
         type : 'post',
         url : 'deleteRoom.room',
         data : {
            room_no : room_no,
            read_mno : read_mno
         },
         dataType : "json",
         success : function(data){
            roomlist = data;
            location.reload(true);
         },
         error : function(data){
            console.log('오류');
            return false;
         }
      });
   }
   else{
      return false;
   }
}

</script>

<style>
   #chattingListCard{
      	width: 500px;
        margin: auto;
        margin-bottom: 20px;
   }
</style>




           <!--  chatting room list start -->
           <div class="col-sm-8" id="chattingListCard" style="margin-top:100px;">
               <div class="card table-card">
                   <div class="card-header">
                       <h5>채팅룸</h5>
                       <div class="card-header-right">
                           <ul>
                               <li data-toggle="modal" data-target="#exampleModal" id="insertChatRoom">
                               <i class="bi bi-back"></i>
                               </li>
                           </ul>
                       </div>
                   </div>
                   <div class="card-block">
                       <div class="table-responsive">
                           <table class="table table-hover m-b-0 without-header">
                               <tbody>
                               <!-- roomlist == 0 -->
                                <c:if test="${fn:length(roomlist) == 0 }">
                                   <tr>
                                      <td><h6> 채팅방이 존재하지 않습니다 </h6></td>
                                   </tr>
                                </c:if>
                                <!-- roomlist != 0 -->
                                <c:if test="${fn:length(roomlist) > 0 }">
                                     
                                   <c:forEach var="rlist" items="${roomlist }">
                                     <c:if test="${rlist.d_mno1 == 0 || rlist.d_mno2 == 0}">
                                      <tr>
                                            <c:if test="${rlist.m1_name eq login.name && rlist.d_mno1 == 0}">
                                               <td onclick="gotochat('${rlist.room_no}','${rlist.read_mno}')">
                                               <div class="d-inline-block align-middle">
                                                    <img src="<%= request.getContextPath() %>/resources/assets/images/members/${rlist.m2_profile}" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                     <div class="d-inline-block">
                                                         <h6>${rlist.m2_name}</h6>
                                                         <p class="text-muted f-w-700">${rlist.content }</p>
                                                     </div>
                                              </div>
                                              </td>
                                              <td class="text-right" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}'">
                                                     <p class="text-muted m-b-0">${rlist.time} </p>
                                                     <br>
                                                     <%-- rlist.mno2_lastvisit : ${rlist.mno2_lastvisit }
                                                     rlist.mno1_lastvisit : ${rlist.mno1_lastvisit }
                                                     rlist.time : ${rlist.time } --%>
                                                    <c:if test="${rlist.mno1_lastvisit < rlist.time}">
                                                       <i class="bi bi-send"></i>
                                                    </c:if>
                                              </td>
                                              <td class="text-right">
                                                  <div onclick="delRoom('${rlist.room_no}','${rlist.read_mno}')"><i class="bi bi-x-lg"></i></div>
                                                </td>
                                           </c:if>
                                          
                                           <c:if test="${rlist.m1_name ne login.name && rlist.d_mno2 == 0}">
                                                  <td onclick="gotochat('${rlist.room_no}','${rlist.read_mno}')">
                                               <div class="d-inline-block align-middle">
                                                    <img src="<%= request.getContextPath() %>/resources/assets/images/members/${rlist.m1_profile}" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                     <div class="d-inline-block">
                                                         <h6>${rlist.m1_name}</h6>
                                                         <p class="text-muted f-w-700">${rlist.content }</p>
                                                     </div>
                                              </div>
                                              </td>
                                              <td class="text-right" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}'">
                                                     <p class="text-muted m-b-0">${rlist.time} </p>
                                                     <br>
                                                     <%-- rlist.mno1_lastvisit : ${rlist.mno1_lastvisit }
                                                     rlist.mno2_lastvisit : ${rlist.mno2_lastvisit }
                                                     rlist.time : ${rlist.time } --%>
                                                    <c:if test="${rlist.mno2_lastvisit < rlist.time}">
                                                       <i class="bi bi-send"></i>
                                                    </c:if>
                                              </td>
                                               <td class="text-right">
                                                  <div onclick="delRoom('${rlist.room_no}','${rlist.read_mno}')"><i class="bi bi-x-lg"></i></div>
                                                 </td>
                                           </c:if>
                                      </tr>
                                   </c:if>
                                   </c:forEach>
                                 </c:if>
                                   
                               </tbody>
                           </table>
                       </div>
                   </div>
               </div>
           </div>

  
  
  
<!-- start modal -->
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" 
style="top:30%; left:30%; width:500px;">
  <div class="modal-dsialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">채팅방 개설하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">대화 상대를 선택해주세요 : </label>
           <select class="form-control" id="selectedFr">
                    <option value="">대화상대를 선택해주세요</option>
               <c:forEach var="m" items="${memList}">
                  <option value="${m.no }">${m.name }&nbsp;(${m.email })</option>
               </c:forEach>
            </select>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cloRoom">Close</button>
        <button type="button" class="btn btn-primary" id="creRoom">개설</button>
      </div>
    </div>
  </div>
</div>
<!-- modal end -->
  
<!--upload preview end -->								
<%@include file="/WEB-INF/top&bottom/bottom.jsp"%>
