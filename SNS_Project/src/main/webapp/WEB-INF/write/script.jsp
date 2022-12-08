<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<script type="text/javascript"
      src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

//혜린 신고
function report(wno) {
   //alert(wno);
   $('input[name="wno"]').val(wno);
}

   //나경 댓글 시작
   		$('#uploadBtn').click(function(){
      		if($('input[name="Insert_images"]').val() == "" && $('input[name="Insert_video"]').val() == "" && $('textarea[name="contents"]').val() == ""){
      			alert('게시물을 작성하지 않았습니다.');
      			return false;
      		}
         });		
   
   
      function detailPost(wno,no){
          //alert('no : '+no)
         //alert('wno : '+wno)
         $('input[name="wno"]').val(wno)
         $('#post').show()
         $('#updatepost').hide()
         $('#commentpost').hide()
         $('input[name="c_contents"]').val('')
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
                   str +='<th>'+data[i].name+'</th>';
                   str +='<td colspan="2">'+data[i].c_contents+'</td>';
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
                   str +='</tr>';
                   str +='<tr id="reply_tr'+data[i].cno+'">';
                   str +='<td></td>';
                   str +='<td colspan="4" class="plus-comment"><a onClick="replyComment('+no+','+data[i].cno+','+data[i].wno+','+data[i].ref+','+data[i].re_step+','+data[i].re_level+',\''+data[i].name+'\')" style="color:#909090c7; font-weight: bold;">댓글달기('+re_step+')</a></td>';
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
                $('#detailLocation').html(map.location)
                $('#detailF_tag').html(map.f_tag)
                
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
      
     //댓글 하트 취소
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
     
     	//댓글 하트
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
     	
      //댓글 하트 눌렀는지
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
      
      /* function c_contents(){
         var c_contents = $('input[name="c_contents"]').val();
         var pattern ='@';
         $('input[name="c_contents"]').keyup(function(){
            if(c_contents.indexOf(pattern) != -1){ //포함한다면
               $('#post').hide()
               $('#commentpost').show()
               $('#updatepost').hide()
            }else{
               $('#post').show()
               $('#commentpost').hide()
               $('#updatepost').hide()
            }
         })
      } */
      
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
      
      function doubleReplyComment(wno,ref,re_step,re_level,name){
         $('input[name="c_contents"]').val('@'+name)
         $('input[name="wno"]').val(wno)
         $('input[name="ref"]').val(ref)
         $('input[name="re_step"]').val(re_step)
         $('input[name="re_level"]').val(re_level)
         $('#post').hide()
         $('#updatepost').hide()
         $('#commentpost').show()
         
      }
      
      function replyComment(no,cno,wno,ref,re_step,re_level,name){
         //alert('replyComment_no : '+no)
         $('input[name="c_contents"]').val('@'+name)
         //alert('wno : '+wno+' cno :'+cno+' ref:'+ref+' re_step :'+re_step+' re_level :'+re_level)
         $('input[name="wno"]').val(wno)
         $('input[name="cno"]').val(cno)
         $('input[name="no"]').val(no)
         $('input[name="ref"]').val(ref)
         $('input[name="re_step"]').val(re_step)
         $('input[name="re_level"]').val(re_level)
         $('#post').hide()
         $('#updatepost').hide()
         $('#commentpost').show()
         
         var str ='';
         $.ajax({
            url :"re_step_list.wr",
            data :{cno : cno},
            type:"post",
            dataType:"json",
            success : function(data){
               for(var i=0;i<data.length;i++){
                  
                  str +='<tr id="re_step_list">';
                  str +='<td></td>';
                  str +='<th><a onClick="doubleReplyComment('+data[i].wno+','+data[i].ref+','+data[i].re_step+','+data[i].re_level+',\''+data[i].name+'\')">'+data[i].name+'<a></th>';
                  str +='<td>'+data[i].c_contents+'</td>';
                  str +='<td align="right" style="color: #909090c7;">'+data[i].c_upload_date+'</td>';
                  
                  str +='<td align="right"><a href="javascript:return false;" style="text-decoration: none;">';                  
                  str +='<i class="bi bi-heart" id="detail_blike'+data[i].wno+','+data[i].cno+'" style="display:inline;" onclick="detail_plusLike('+data[i].wno+','+data[i].cno+')"></i>';
                  str +='<i class="bi bi-heart-fill" id="detail_alike'+data[i].wno+','+data[i].cno+'" style="display:none;" onclick="detail_cancleLike('+data[i].wno+','+data[i].cno+')"></i>';               
                  str +='</a></td>';
                  
                  if(no == data[i].mno){
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
                  
                  str +='</tr>';

               }
                  $('#reply_comment *').remove()
                  $('#re_step_list *').remove()
                  $('#reply_tr'+ref).before(str)
            }
         })
      }
      
      //답글게시 클릭
      function CommentPost_Comment(){
         //alert('click')
         var c_contents = $('input[name="c_contents"]').val()
         var wno = $('input[name="wno"]').val()
         var cno = $('input[name="cno"]').val()
         var ref = $('input[name="ref"]').val()
         var re_step = $('input[name="re_step"]').val()
         var re_level = $('input[name="re_level"]').val()
         
         var str='';
         $.ajax({
            url :"replyComment.wr",
            data : {wno : wno,
                  c_contents : c_contents,
                  ref : ref,
                  re_step : re_step,
                  re_level : re_level},
            success : function(data){
               var arr = data.split(',');
               var wno=arr[0];
               var c_contents=arr[1];
               var c_upload_date=arr[2];
               var name=arr[3];
               var cno=arr[4];
               var ref=arr[5];
               var re_level=arr[6];
               var re_step=arr[7];
               
               str +='<tr id="reply_comment">';
               str +='<td></td>';
               str +='<th><a onClick="replyComment('+cno+','+wno+','+ref+','+re_step+','+re_level+',\''+name+'\')">'+name+'<a></th>';
               str +='<td>'+c_contents+'</td>';
               str +='<td align="right" style="color: #909090c7;">'+c_upload_date+'</td>';
               
               str +='<td align="right"><a href="javascript:return false;" style="text-decoration: none;">';                  
               str +='<i class="bi bi-heart" id="detail_blike'+wno+cno+'" style="display:inline;" onclick="detail_plusLike('+wno+','+cno+')"></i>';
               str +='<i class="bi bi-heart-fill" id="detail_alike'+wno+cno+'" style="display:none;" onclick="detail_cancleLike('+wno+','+cno+')"></i>';               
               str +='</a></td>';
               
               str +='<td align="right">';
               str +='<div class="dropdown">';
               str +='<button type="button" class="btn p-0 dropdown-toggle hide-arrow dropmenu" data-bs-toggle="dropdown">';
               str +='<i class="bx bx-dots-vertical-rounded"></i>';
               str +='</button>';
               str +='<div class="dropdown-menu">';
               str +='<button type="button" class="dropdown-item delete" onclick="updateComment('+cno+','+wno+',\''+c_contents+'\')">';
               str +='수정 </button>';
               str +='<button type="button" class="dropdown-item delete" onclick="deleteComment('+cno+','+wno+')">';
               str +='삭제 </button>';
               str +='</div>';
               str +='</div>';
               str +='</td>';
               str +='</tr>';
        
                    
               $('#reply_tr'+ref).before(str)
               
               $('input[name="c_contents"]').val('')
               //$('tr').remove('#reply_tr'+ref)
               $('#post').show()
               $('#updatepost').hide()
               $('#commentpost').hide()
            }
         })
      }
      
      //답글 수정
      function updateComment(cno,wno,contents){
         
         $('#post').hide()
         $('#commentpost').hide()
         $('#updatepost').show()
         $('input[name="c_contents"]').val(contents)
         $('input[name="cno"]').val(cno)
         $('input[name="wno"]').val(wno)
         
      }
      
      //답글 수정 클릭
      function detailPost_UpdateComment(){
         var wno = $('input[name="wno"]').val();
         var cno = $('input[name="cno"]').val();
         var contents = $('input[name="c_contents"]').val();
         
         $.ajax({
            url :"updateComment.wr",
            data :{ wno : wno,
                   cno : cno,
                   contents : contents},
            success:function(data){
               detailPost(data)
            }
         })
      }
      
      //답글 삭제
      function deleteComment(cno,wno){
         var str='';
         
         $.ajax({
            url:"deleteComment.wr",
            data:{ cno : cno,
                  wno : wno },
            success:function(data){
               detailPost(data)
            },
            error:function(request,status,result){
               alert('실패 : '+result)
            }
         })
      
      }
      
      //게시 클릭
      //detailPost에서 댓글
      function detailPost_Comment(){
         var wno = $('input[name="wno"]').val()
         var contents = $('input[name="c_contents"]').val();
         
         var str='';
         
         $.ajax({
             url :"comment.wr",
            data : {contents: contents,
                  wno : wno},
            success:function(data){
               //alert(data)
               var arr = data.split(',');
               var wno=arr[0];
               //alert(wno)
               var c_contents=arr[1];
               //alert(c_contents)
               var c_upload_date=arr[2];
               //alert(c_upload_date)
               var name=arr[3];
               //alert(name)
               var cno=arr[4];
               //alert(cno)
               var ref=arr[5];
               var re_level=arr[6];
               var re_step=arr[7];
               //$('#allcomments').prepend('<tr><th>'+name+'</th><td>'+c_contents+'</td>'+'<td align="right" style="color:#909090c7;">'+c_upload_date+'</td></tr>')
               
               str +='<tr height="20px">';
               str +='<th>'+name+'</th>';
               str +='<td colspan="2">'+c_contents+'</td>';
               str +='<td align="right" style="color: #909090c7;">'+c_upload_date+'</td>';
               str +='<td align="right"><a href="javascript:return false;" style="text-decoration: none;">';                  
               str +='<i class="bi bi-heart" id="detail_blike'+wno+cno+'" style="display:inline;" onclick="detail_plusLike('+wno+','+cno+')"></i>';
               str +='<i class="bi bi-heart-fill" id="detail_alike'+wno+cno+'" style="display:none;" onclick="detail_cancleLike('+wno+','+cno+')"></i>';               
               str +='</a></td>';
               str +='<td align="right">';
               str +='<div class="dropdown">';
               str +='<button type="button" class="btn p-0 dropdown-toggle hide-arrow dropmenu" data-bs-toggle="dropdown">';
               str +='<i class="bx bx-dots-vertical-rounded"></i>';
               str +='</button>';
               str +='<div class="dropdown-menu">';
               str +='<button type="button" class="dropdown-item delete" onclick="updateComment('+cno+','+wno+',\''+c_contents+'\')">';
               str +='수정 </button>';
                    str +='<button type="button" class="dropdown-item delete" onclick="deleteComment('+cno+','+wno+')">';
                    str +='삭제 </button>';
                    str +='</div>';
                    str +='</div>';
                    str +='</td>';
               str +='</tr>';
               str +='<tr id="reply_tr'+cno+'">';
               str +='<td></td>';
               str +='<td colspan="4" class="plus-comment"><a onClick="replyComment('+cno+','+wno+','+ref+','+re_step+','+re_level+',\''+name+'\')" style="color:#909090c7; font-weight: bold;">댓글달기</a></td>';
               str +='</tr>';
               
               $('#allcomments').prepend(str);
               
               $('input[name="c_contents"]').val('')
            }
         })//ajax
          
      }
   
      //간단 댓글
      function post(wno){
          //alert('wno : '+wno)
          contents = $('#c_contents_'+wno).val();
          //alert(contents)
          
          $.ajax({
             url :"comment.wr",
            data : {contents: contents,
                  wno : wno},
            success:function(data){
               //alert(data)
               var arr = data.split(',');
               var wno=arr[0];
               //alert(wno)
               var c_contents=arr[1];
               //alert(c_contents)
               var c_upload_date=arr[2];
               //alert(c_upload_date)
               var name=arr[3];
               //$('#plus'+wno).append('<th>'+name+'</th>')
               $('#plus'+wno).append('<th width="70px">'+name+'</th><td>'+c_contents+'</td>'+'<td align="right" style="color:#909090c7;">'+c_upload_date+'</td>')
               //alert(5);
            }
         })//ajax 
          
      }
      //나경 댓글 끝
      
        $(document).ready(function(){
           //지도
            $('button[name="ok"]').click(function(){
            	//alert($('input[name="check"]').val());
               var myposition = $('input[name="myposition"]').val()
               var myaddress = $('input[name="myaddress"]').val()
               if($('input[name="check"]').val() == ""  ){
            	   //alert($('input[name="check"]').val());
	               $('input[name="location"]').val(myposition)
	               $('input[name="address"]').val(myaddress)
	               $('#location').html(myposition);
	               $('#location').attr('style','display:inline');
               }
               if($('input[name="check"]').val() == "1"  ){
                  //alert($('input[name="check"]').val());
                  $('input[name="location"]').val(myposition)
	              $('input[name="address"]').val(myaddress)
                  $('#ulocation').empty();
               		$('#ulocation').html(myposition);
	               $('#ulocation').attr('style','display:inline-block; margin-left:4px; margin-top:10px;');
               	$('#modifyWrite').attr('style','display: block;');
               }
            })
           
     //이미지      
        $('#img').click(function (e) {
                document.wForm.img.value = document.getElementById( 'img' ).src;
                e.preventDefault();
                $('#imgfile').click();
         });   
         
         $('#videoclick').click(function (e) {
                document.wForm.videoclick.value = document.getElementById( 'videoclick' ).src;
                e.preventDefault();
                $('#videofile').click();
         });   
         
         $('#friends').click(function (e) {
                document.wForm.friends.value = document.getElementById( 'friends' ).src;
                e.preventDefault();
                $('#friendstag').click();
         });    

       }); //document
       
       
       let regex = new RegExp("(.*?)\.(jpg|png)$");
       let maxSize = 1048576; //1MB

       function fileCheck(fileName, fileSize){

          if(fileSize >= maxSize){
             alert("파일 사이즈 초과");
             return false;
          }
               
          if(!regex.test(fileName)){
             alert("해당 종류의 파일은 업로드할 수 없습니다.");
             return false;
          }
          
          return true;      
              
           }
 	function image(){
   		//alert(1);
   		wForm.link.focus();
   	}
    
    
</script>