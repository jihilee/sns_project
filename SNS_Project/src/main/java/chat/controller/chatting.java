package chat.controller;

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

import chat.model.ChatBean;
import chat.model.ChatDao;
import member.model.MemberBean;
import member.model.MemberDao;
import room.model.RoomBean;
import room.model.RoomDao;

@ComponentScan({ "chat.*","room.*", "member.*" })
@Controller
public class chatting {
	private final String command = "getChattingRoom.chat";
	private String getPage = "/chattingroom";

	private final String sendMsg = "insertMsg.chat";
	private final String delMsg = "deleteMsg.chat";
	
	@Autowired
	ChatDao chatDao;

	@Autowired
	MemberDao memberDao;
	
	@Autowired
	RoomDao roomDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String getChattingroom(@RequestParam(value="room_no",required=false) String room_no,
									@RequestParam(value="read_mno",required=false) String read_mno, //members no (room mno2)
									Model model,HttpSession session) {
		
		MemberBean mb = (MemberBean)session.getAttribute("login");
		List<ChatBean> chatList = new ArrayList<ChatBean>();
		
		System.out.println("room_no : "+room_no);
		System.out.println("read_mno : "+read_mno);
		if(room_no==null){ // click account > goto chatting
			RoomBean rb = new RoomBean(mb.getNo(),read_mno);
			RoomBean room = roomDao.getRoomBymno(rb);//get roombean
			if(room==null) {
				roomDao.insertRoom(rb); //insert room
				room = roomDao.getRoomBymno(rb);//get roombean
			}
			room_no  = room.getRoom_no(); 
			System.out.println(room_no);
		}
		
		//chatting room list > click chatting room
		
		//update last visit date
		RoomBean rb = roomDao.getRoomByRoomno(room_no);
		if(rb.getMno1().equals(mb.getNo())) {
			roomDao.updateVisitDate1(rb);
		}
		else { //rb.getMno2().equals(mb.getNo())
			roomDao.updateVisitDate2(rb);
		}
		
		chatList = chatDao.getAllChatListByRoomNo(room_no);
		model.addAttribute("chatList",chatList);
		
		//get room_no, chat member name
		Map<String, String> map = new HashMap<String, String>();
		map.put("room_no", room_no);
		map.put("no", mb.getNo());
		ChatBean cb = chatDao.getRoomMember(map);
				
		model.addAttribute("cb",cb); //room_no, m1_name, m2_name
		return getPage;
	}
	
	@RequestMapping(value = delMsg, method = RequestMethod.POST)
	public @ResponseBody List<ChatBean> delchat(@RequestParam() String no,@RequestParam() String room_no) {


		List<ChatBean> chatList = new ArrayList<ChatBean>();
		System.out.println("delchat no : " + no);
		chatDao.delMsg(no);
		chatList = chatDao.getAllChatListByRoomNo(room_no); //get all chat record

		return chatList;
	}
	
	@RequestMapping(value = sendMsg, method = RequestMethod.POST)
	public @ResponseBody List<ChatBean> chat(@RequestParam() String room_no,
											@RequestParam() String send_mno,
											@RequestParam() String read_mno,
											@RequestParam() String content) {

		System.out.println(room_no+"/"+read_mno+"/"+content);
		List<ChatBean> chatList = new ArrayList<ChatBean>();
		ChatBean cb = new ChatBean(room_no,send_mno,read_mno,content);
		chatDao.sendMsg(cb); //msg insert
		chatList = chatDao.getAllChatListByRoomNo(room_no); //get all chat record
		return chatList;
	}
	
}
