package profile.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friend.model.FriendBean;
import friend.model.FriendDao;
import member.model.MemberBean;
import member.model.MemberDao;
import write.model.CommentsBean;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class ProfileController {

   private final String command = "/profile.pro";
   private final String gotoMyprofile = "redirect:/myprofile.pro";
   private String getPage = "/profile";

   @Autowired
   private MemberDao memberDao;

   @Autowired
   private FriendDao friendDao;
   
   @Autowired
   private WriteDao wdao;

   @RequestMapping(command)
   public String userpage(@RequestParam("no") String no, Model model, HttpSession session) {
	   //System.out.println("nooo:"+no);
      MemberBean mb = (MemberBean)session.getAttribute("login");
      //System.out.println("로그인nooooooooooooo:"+mb.getNo());
      if(mb.getNo().equals(no)) {
    	  //System.out.println("123");
         return gotoMyprofile;
      }
      
      //게시글 가져오기
      List<WriteBean> p_lists =  memberDao.select_mywrite_public(no); // 전체공개      
      
      Map<String,String> map = new HashMap<String,String>();
      map.put("no", no);
      
      String friendsLists = wdao.getFriendsForTagByMno(no); // 친구 리스트 -> onlyFriends
      if(friendsLists != null) {
      String[] f_no = friendsLists.split(",");
      for(int i=0;i<f_no.length;i++) {
    	  if(f_no[i].equals(mb.getNo())) { //방문하려는 사람의 친구인지
            
            //자기가 onlyFriends로 설정한것도 가져오기
            List<WriteBean> m_lists = wdao.select_By_onlyFriends(map);
            p_lists.addAll(m_lists);
         }
      }
      }
      Collections.sort(p_lists, new Comparator<WriteBean>() {
          @Override
          public int compare(WriteBean o1, WriteBean o2) {
             return Integer.parseInt(o2.getWno())-Integer.parseInt(o1.getWno());
          }
       });
      
      //나경 댓글
         List<CommentsBean> clists = new ArrayList<CommentsBean>();
            for(WriteBean w : p_lists) {
                  List<CommentsBean> contentList = wdao.select_comments(w.getWno()); 
                   clists.addAll(contentList);
               }
         model.addAttribute("lists",p_lists);
         model.addAttribute("clists",clists);
         
         
       List <String> likedWnoLists = wdao.findLikesByNo(mb.getNo()); // 이미 게시물에 좋아요를 누른사람은 중복해서 누를 수 없게.
      List<String> checkedBooks = wdao.findBookMarkByNo(mb.getNo());
      
      
      
      model.addAttribute("likedWnoLists",likedWnoLists); // 로그인된 사람 기준
      model.addAttribute("checkedBooks",checkedBooks); // 로그인된 사람 기준
      
      /*=====================================================================*/
      
      MemberBean member = memberDao.getMemberByNo(no);

      //해당 유저 friends 가져오기
      FriendBean myfriend = friendDao.getMyFriends(no);

      if(myfriend != null && myfriend.getFriends() != null) {

         String[] lists = myfriend.getFriends().split(",");

         List<MemberBean> friendsList = new ArrayList<MemberBean>();
         for(String x : lists) {
            //System.out.println(x);
            MemberBean friend = memberDao.getMemberByNo(x);
            friendsList.add(friend);
         }

         model.addAttribute("ufriends", myfriend.getFriends());
         model.addAttribute("friendsList", friendsList);
      }

      //해당 유저 waits 가져오기
      if(myfriend != null && myfriend.getWaits() != null) {
         String uwaits = myfriend.getWaits();
         model.addAttribute("uwaits", uwaits);
      }

      model.addAttribute("member", member);
      
      //로그인 유저 waits 가져오기
      MemberBean login = (MemberBean)session.getAttribute("login");
      myfriend = friendDao.getMyFriends(login.getNo());
      if(myfriend != null && myfriend.getWaits() != null) {
         String mywaits = myfriend.getWaits();
         model.addAttribute("mywaits", mywaits);
      }
      
      return getPage;
   }

}