<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/assets/css/style.css">

<style>
::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-thumb {
  background-color: #0084FF;
  border-radius: 2px;
}


body {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.chathtml{
	height: 100%;
    width: 100%;
    margin: auto,5px;
    padding: 0;
    overflow: hidden;
}
.chatBox {
	width: 500;
	margin: auto;
    height: 400px;
    max-height: 500px;
    display: flex;
    flex-direction: column;
    overflow: hidden;
}
.chatWrap {
	margin-top: 10px;
    flex: auto;
    max-height: calc(100% - 60px);
    background: #FFFFFF;
    overflow: auto;
}

#chatHeader {
    text-align: center;
    font-size: 17px;
    font-weight: 900;
    border-bottom: 1px solid #ddd;
    padding-top:20px;
    padding-bottom:20px;
}

.chatLog {
    height: 400px;
    width : 96%;
    overflow-y: auto;
    flex: auto;
    max-height: 100%;
    overflow:auto;
}

.myMsg {
    text-align: right;
}

.anotherMsg {
    text-align: left;
    margin-bottom: 5px;
}

.msg {
    display: inline-block;
    border-radius: 15px;
    padding: 7px 15px;
    margin-bottom: 10px;
    margin-top: 5px;

}

.anotherMsg > .msg {
    background-color: #f1f0f0;

}

.myMsg > .msg {
    background-color: #0084FF;
    color: #fff;
}

.anotherName {
    font-size: 12px;
    display: block;
}

#chatForm {
    display: block;
    width: 100%;
    height: 50px;
    border-top: 2px solid #f0f0f0;
    margin-right:15px;
}

#sendMsg {
    width: 85%;
    height: calc(100% - 1px);
    border: none;
    padding-bottom: 0;
}

#sendMsg {
    outline: none;
}

#chatForm > input[type=submit] {
    outline: none;
    border: none;
    background: none;
    color: #0084FF;
    font-size: 14px;
}
</style>

<title>chatting room</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$('document').ready(function(){
	document.getElementById('chatscrollbot').scrollTop = document.getElementById('chatscrollbot').scrollHeight;
	
	$('#sendBtn').click(function(){
		var room_no = $('input[name="room_no"]').val();
		var read_mno = $('input[name="read_mno"]').val();
		var send_mno = $('input[name="send_mno"]').val();
		var content = $('input[name="content"]').val();
		//alert(room_no+"/"+content+"/"+read_mno+"/"+send_mno);
		
		//alert(1);
		//console.log('123');
		$.ajax({
			type : 'POST',
			url : 'insertMsg.chat',
			dataType : 'json',
			data : {
				room_no : room_no,
				send_mno : send_mno,
				read_mno : read_mno,
				content : content
			},
			success : function(data){
				chatList = data;
				location.reload(true);
			},
			error : function(){
				console.log('오류');
				return false;
			},
			complete : function(){
				setInterval(function() {
				  location.reload();
			 	 	}, 2000);	 
			}
		});
		
	});//sendBtn
	
});//ready	 

setInterval(function() {
	  location.reload();
	 	}, 5000);	 
	 	
function delContent(no,room_no){
	var yes = confirm('메세지를 삭제하시겠습니까?');
	if(yes){
		$.ajax({
			type : 'post',
			url : 'deleteMsg.chat',
			data : {
				no : no,
				room_no : room_no
			},
			dataType : "json",
			success : function(data){
				chatList = data;
				location.reload(true);
			},
			error : function(data){
				colsole.log('오류');
				return false;
			}
		});
	}
	else{
		return false;
	}
}

 	
</script>


<body style="background-color:#FFF;">

<div class="chathtml">
    	<!-- chatting room name -->
		<div id="chatHeader">
	    	${cb.m1_name }와 ${cb.m2_name}의 채팅방
		</div>
		<!-- chatting room name end  -->
		<!-- chatting msg -->
		
<section class="chatBox">
<section class="chatWrap" id="chatLog">
		<div class="chatLog" id="chatscrollbot">
		<!-- chatting list by room_no -->
		  	<c:forEach var="clist" items="${chatList }">
		  		<!-- m1 == login.name -->
		  		<c:if test="${clist.m1_name eq login.name }">
			   		<!-- my msg -->
			   		<div class="myMsg" id="msgismine">
						<font style="font-size:xx-small;">${clist.chattime }</font>
						<span class="msg" ondblclick="return delContent('${clist.no }','${clist.room_no }')"> ${clist.content }</span> 
					</div>
				</c:if>
				<c:if test="${clist.m1_name ne login.name }">
					<!-- another msg -->
					<div class="anotherMsg">
			  			<div class="d-inline-block align-middle" >
			   				<img src="<%= request.getContextPath() %>/resources/assets/images/members/${clist.m1_profile}"
			   					alt="user image" class="img-radius img-40 align-top m-r-15">
							<div class="d-inline-block">
						 		<span class="anotherName d-inline-block">${clist.m1_name }</span>
						 		<span class="msg"> ${clist.content }</span> 
						 		<span style="font-size:xx-small;">${clist.chattime }</span>
		   				 	</div>
		  				</div>
					</div>
		        </c:if>
		    </c:forEach>
		</div>
		<!-- chatting msg end -->

</section> <!-- chatWrap -->
   
		<!-- send msg -->
	   <form id="chatForm">
			<input type="text" autocomplete="off" size="30" name="content" id="sendMsg" placeholder="메시지를 입력하세요" style="width:400px" >
			
			<input type="hidden" name="room_no" id="room_no" value="${cb.room_no }">
			<c:if test="${cb.send_mno ne login.no }">
				<input type="hidden" name="send_mno" id="send_mno" value="${cb.read_mno }">
				<input type="hidden" name="read_mno" id="read_mno" value="${cb.send_mno }">
			</c:if>
			<c:if test="${cb.send_mno eq login.no }">
				<input type="hidden" name="send_mno" id="send_mno" value="${cb.send_mno }">
				<input type="hidden" name="read_mno" id="read_mno" value="${cb.read_mno }">
			</c:if>
	  		<input type="submit" value="보내기" id="sendBtn">
		</form>  
		<!-- send msg end -->
		
</section> <!-- chatBox -->
</div> <!-- chatWrap -->
</body>

