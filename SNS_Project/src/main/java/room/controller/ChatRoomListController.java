package room.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import friend.model.FriendBean;
import friend.model.FriendDao;
import member.model.MemberBean;
import member.model.MemberDao;
import room.model.RoomBean;
import room.model.RoomDao;

@ComponentScan({"room.*","member.*","friend.*"})
@Controller
public class ChatRoomListController {
   private final String command = "chattingRoomList.room";
   private String getPage = "/chattingRoomList";
   
   private final String getRmNo = "getRoom_no.room";
   private final String delRoom = "deleteRoom.room";
   
   @Autowired RoomDao roomDao;
   @Autowired FriendDao friendDao;
   @Autowired MemberDao memberDao;
   
   @RequestMapping(command)
   public String room(HttpSession session, Model model) {
      MemberBean mb = (MemberBean)session.getAttribute("login");
      
      List<RoomBean> roomlist = new ArrayList<RoomBean>();
      System.out.println(mb.getNo());
      roomlist = roomDao.getAllRoomListByNo(mb.getNo());
      
      FriendBean fb = friendDao.getMyFriends(mb.getNo());//for creating chatroom
      List<MemberBean> memList = new ArrayList<MemberBean>();
      
      if(fb.getFriends() != null) { 
          String[] friends = fb.getFriends().split(",");
          for(String f : friends) {
             MemberBean fr = memberDao.getMemberByNo(f);
             memList.add(fr);
          }
          
       }
      
      model.addAttribute("memList",memList);
      model.addAttribute("roomlist",roomlist);
      model.addAttribute("mb",mb);
      return getPage;
   }
   
   @RequestMapping(value = getRmNo, method = RequestMethod.POST)
   public @ResponseBody String getRmNo(@RequestParam() String read_mno,HttpSession session) {
      
      MemberBean mb = (MemberBean)session.getAttribute("login");
      
      RoomBean rb = new RoomBean(mb.getNo(),read_mno);
      System.out.println(mb.getNo()+"/"+read_mno);
      
      RoomBean room = roomDao.getRoomBymno(rb);//get roombean
      if(room==null) {
         roomDao.insertRoom(rb); //insert room
         room = roomDao.getRoomBymno(rb);//get roombean
      }
      String room_no  = room.getRoom_no(); 
      return room_no;
   }

   
   @RequestMapping(value = delRoom, method = RequestMethod.POST)
   public @ResponseBody List<RoomBean> delRoom(@RequestParam() String room_no,
                              @RequestParam() String read_mno,
                              HttpSession session) {
      
      MemberBean mb = (MemberBean)session.getAttribute("login");
      System.out.println(room_no+"/"+read_mno);
      
      RoomBean rb = roomDao.getRoomByRoomno(room_no);
      Map<String,String> map = new HashMap<String,String>();
      
      if(rb.getMno1().equals(mb.getNo())) {
         map.put("room_no", room_no);
         map.put("mno1", mb.getNo());
         roomDao.delRoomByMno1(map);//update
      }
      else { //rb.getMno2() == mb.getNo()
         map.put("room_no", room_no);
         map.put("mno2", mb.getNo());
         roomDao.delRoomByMno2(map);//update
      }
      
      List<RoomBean> roomlist = new ArrayList<RoomBean>();
      roomlist = roomDao.getAllRoomListByNo(mb.getNo());
   
      return roomlist;
   }
}