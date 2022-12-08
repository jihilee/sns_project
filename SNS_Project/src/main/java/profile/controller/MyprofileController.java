package profile.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import friend.model.FriendBean;
import friend.model.FriendDao;
import member.model.MemberBean;
import member.model.MemberDao;
import write.model.CommentsBean;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class MyprofileController {
   
   private final String command = "/myprofile.pro";
   private String getPage = "/myprofile";
   
   @Autowired
   private MemberDao memberDao;
   
   @Autowired
   private FriendDao friendDao;

   @Autowired
   private WriteDao wdao;
   
   @RequestMapping(command)
   public String mypage(HttpSession session, Model model) {
      
      MemberBean login = (MemberBean)session.getAttribute("login");
      
      FriendBean myfriend = friendDao.getMyFriends(login.getNo());
      //System.out.println(friend.getFriends_no());
      
      //friends 친구 가져오기
      if(myfriend != null && myfriend.getFriends() != null) {
         String[] lists = myfriend.getFriends().split(",");
         
         List<MemberBean> friendsList = new ArrayList<MemberBean>();
         for(String x : lists) {
            //System.out.println(x);
            MemberBean friend = memberDao.getMemberByNo(x);
            friendsList.add(friend);
         }
         
         model.addAttribute("friendsList", friendsList);
      }
      
      //waits 친구 신청 목록 가져오기
      if(myfriend != null && myfriend.getWaits() != null) {

         String[] lists = myfriend.getWaits().split(",");

         List<MemberBean> waitsList = new ArrayList<MemberBean>();
         for(String x : lists) {
            //System.out.println(x);
            MemberBean friend = memberDao.getMemberByNo(x);
            waitsList.add(friend);
         }

         model.addAttribute("waitsList", waitsList);
      }
      
      //내가 쓴 게시글 가져오기
      List<WriteBean> lists = memberDao.select_MyWrite(login.getNo());
      model.addAttribute("lists",lists);
      
      List <String> likedWnoLists = wdao.findLikesByNo(login.getNo()); // 이미 게시물에 좋아요를 누른사람은 중복해서 누를 수 없게.
      List<String> checkedBooks = wdao.findBookMarkByNo(login.getNo());
      
      
      
      model.addAttribute("likedWnoLists",likedWnoLists); // 로그인된 사람 기준
      model.addAttribute("checkedBooks",checkedBooks); // 로그인된 사람 기준
      
      List<CommentsBean> clists = new ArrayList<CommentsBean>();
        for(WriteBean w : lists) {
              List<CommentsBean> contentList = wdao.select_comments(w.getWno()); 
                clists.addAll(contentList);
           }
        Collections.sort(lists, new Comparator<WriteBean>() {
            @Override
            public int compare(WriteBean o1, WriteBean o2) {
               return Integer.parseInt(o2.getWno())-Integer.parseInt(o1.getWno());
            }
         });
        model.addAttribute("lists",lists);
        model.addAttribute("clists",clists);
     
      return getPage;
      
      
      
   }

}