package chat.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import room.model.RoomBean;

@Component
public class ChatDao {
	
	private final String namespace="chat.model.Chat";
	
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;

	public List<ChatBean> getAllChatListByRoomNo(String room_no) {
		List<ChatBean> chatList = new ArrayList<ChatBean>();
		chatList = sqlSessionTemplate.selectList(namespace+".getAllChatListByRoomNo",room_no);
		System.out.println("getAllChatListByRoomNo : "+chatList.size());
		return chatList;
	}

	public ChatBean getRoomMember(Map<String, String> map) {
		ChatBean cb = sqlSessionTemplate.selectOne(namespace+".getRoomMember",map);
		return cb;
	}

	public void sendMsg(ChatBean cb) {
		int cnt = sqlSessionTemplate.insert(namespace+".sendMsg",cb);
		System.out.println("sendMsg : " + cnt);
	}

	public void insertChat(RoomBean room) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertChat",room);
		System.out.println("insertChat : " + cnt);
	}

	public void delMsg(String no) {
		int cnt = sqlSessionTemplate.delete(namespace+".delMsg",no);
		System.out.println("delMsg : " + cnt);
	}

}
