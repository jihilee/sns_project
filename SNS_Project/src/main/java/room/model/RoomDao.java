package room.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RoomDao {
	private final String namespace="room.model.Room";

	@Autowired SqlSessionTemplate sqlSessionTemplate;
	
	public List<RoomBean> getAllRoomListByNo(String no) {//members no
		List<RoomBean> roomlist = new ArrayList<RoomBean>();
		roomlist = sqlSessionTemplate.selectList(namespace+".getAllRoomListByNo",no);
		System.out.println("roomlist size : " + roomlist.size());
		return roomlist;
	}

	public void insertRoom(RoomBean rb) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertRoom",rb);
		System.out.println("insertRoom : " + cnt);
	}

	public RoomBean getRoomBymno(RoomBean rb) {
		RoomBean room = sqlSessionTemplate.selectOne(namespace+".getRoomBymno",rb);
		//System.out.println("getRoomBymno : " + room.getNo());
		return room;
	}

	public RoomBean getRoomByRoomno(String room_no) {
		RoomBean rb = sqlSessionTemplate.selectOne(namespace+".getRoomByRoomno",room_no);
		return rb;
	}
	
	public void delRoomByMno1(Map<String, String> map) {
		int cnt = sqlSessionTemplate.update(namespace+".delRoomByMno1",map);
		System.out.println("delRoomByMno1 : " + cnt);
	}
	
	public void delRoomByMno2(Map<String, String> map) {
		int cnt = sqlSessionTemplate.update(namespace+".delRoomByMno2",map);
		System.out.println("delRoomByMno2 : " + cnt);
	}

	public void updateDelRoom(String room_no) {
		int cnt = sqlSessionTemplate.update(namespace+".updateDelRoom",room_no);
		System.out.println("updateDelRoom : " + cnt);
	}

	public void updateVisitDate1(RoomBean rb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateVisitDate1",rb);
		System.out.println("updateVisitDate1 : " + cnt);
	}

	public void updateVisitDate2(RoomBean rb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateVisitDate2",rb);
		System.out.println("updateVisitDate2 : " + cnt);
	}


}
