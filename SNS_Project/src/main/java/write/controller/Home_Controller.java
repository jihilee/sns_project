package write.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import tag.model.Post_tagBean;
import tag.model.TagDao;
import write.model.CommentsBean;
import write.model.WriteBean;
import write.model.WriteDao;
@Controller
@ComponentScan({"write.*","tag.*"}) /* jh */
public class Home_Controller {
   final String command  = "home.wr";
   String getPage="/home";
   
   @Autowired
   WriteDao wdao;
   
   @Autowired /* jh */
   TagDao tagDao;
   
   @RequestMapping(command)
   public String main(HttpSession session, Model model, @RequestParam(value = "tag_name", required = false) String tag_name /* jh */) {
      
      MemberBean mb = (MemberBean)session.getAttribute("login");
      System.out.println("list_No:"+mb.getNo());
      String no = mb.getNo();
      
      /* update jh 1115 */
      Map<String,String> tagmap1 = new HashMap<String,String>();
      tagmap1.put("no", no);
      tagmap1.put("tag_name", tag_name);
      

      List <WriteBean> p_lists = wdao.getTimeLineByMemberNo(tagmap1); // 전체공개      
      
      List <WriteBean> m_lists = wdao.select_By_onlyMe(tagmap1); // 나만보기
      p_lists.addAll(m_lists);
      
      String friendsLists = wdao.getFriendsForTagByMno(no); // 친구 리스트 -> onlyFriends
      if(friendsLists != null) {
	      String[] f_no = friendsLists.split(",");
	      
	      for(int i=0;i<f_no.length;i++) {
	         Map<String,String> tagmap2 = new HashMap<String,String>();
	         tagmap2.put("no", f_no[i]);
	         tagmap2.put("tag_name", tag_name);
	         System.out.println(f_no[i]);
	         List<WriteBean> f_lists = wdao.select_By_onlyFriends(tagmap2);
	         p_lists.addAll(f_lists);
	      }
      }
      
      //자기가 onlyFriends로 설정한것도 가져오기
      List<WriteBean> f_lists = wdao.select_By_onlyFriends(tagmap1);
      p_lists.addAll(f_lists);
      
      System.out.println("p_lists.size : "+p_lists.size());
      Collections.sort(p_lists, new Comparator<WriteBean>() {
          @Override
          public int compare(WriteBean o1, WriteBean o2) {
             return Integer.parseInt(o2.getWno())-Integer.parseInt(o1.getWno());
          }
       });
    
      
      
      List <String> likedWnoLists = wdao.findLikesByNo(no); // 이미 게시물에 좋아요를 누른사람은 중복해서 누를 수 없게.
      List<String> checkedBooks = wdao.findBookMarkByNo(no);
      
      
      
      model.addAttribute("likedWnoLists",likedWnoLists); // 로그인된 사람 기준
      model.addAttribute("checkedBooks",checkedBooks); // 로그인된 사람 기준
      
      //나경 댓글
         List<CommentsBean> clists = new ArrayList<CommentsBean>();
            for(WriteBean w : p_lists) {
                  List<CommentsBean> contentList = wdao.select_comments(w.getWno()); 
                     clists.addAll(contentList);
               }
         model.addAttribute("lists",p_lists);
         model.addAttribute("clists",clists);
      //나경 댓글 끝
      
       //친구 태그 목록 가져오기
          Map<String,String> map = new HashMap<String,String>();
          map.put("no",no);
          String friends = wdao.getFriendsForTagByMno(no); //친구들의 회원 번호.
         System.out.println("friends:"+friends);
         String fname = "";
         if(friends != null) {
        	 String [] friendsArr = friends.split(","); //친구 번호
             List<MemberBean> friendsList = new ArrayList<MemberBean>(); //가영추가
             for(int i=0;i<friendsArr.length;i++) {
                System.out.println("friend:"+friendsArr[i]);
                map.put("friend", friendsArr[i]);
                map.put("i", String.valueOf(i+1));
                System.out.println("i="+i);
                if(i == 0) {
                   fname += wdao.getFriendsNameByFno(map);
                }
                else {
                   fname += ","+wdao.getFriendsNameByFno(map);
                }
                
                friendsList.add(wdao.getFriendsNoAndName(friendsArr[i])); //가영추가
             }
             
             if(friendsList != null) { //가영추가
                   for(MemberBean mbean : friendsList) {
                      System.out.println(mbean.getNo()+"/"+mbean.getName());
                   }
                }
                model.addAttribute("friendsList", friendsList);//가영추가
             
             model.addAttribute("friendsArr", friendsArr);
          }
          System.out.println("fname="+fname);
          model.addAttribute("fname", fname);
          
        /* jh */
         List<Post_tagBean> ptList = new ArrayList<Post_tagBean>();
         ptList=tagDao.getPostTag();
         model.addAttribute("ptList",ptList);
         
         if(tag_name != null) {
            List<Post_tagBean> taggedList = new ArrayList<Post_tagBean>();
            taggedList = tagDao.getWnoByClickedTag(tag_name);
            model.addAttribute("taggedList",taggedList);
            //for
         }
         /* end jh */
      
      
      return getPage;
   }
}

