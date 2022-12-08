package friend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friend.model.FriendBean;
import friend.model.FriendDao;
import member.model.MemberBean;

@Controller
public class FriendAcceptController {
	
	private final String command = "/accept.fr";
	private String gotoPage = "redirect:/profile.pro";
	
	@Autowired
	private FriendDao friendDao;
	
	//친구 수락 버튼 클릭 => 로그인 유저/상대 유저 모두 friends 컬럼에 추가
	@RequestMapping(command)
	public String accept(@RequestParam("no") String no, HttpSession session) {
		
		MemberBean login = (MemberBean)session.getAttribute("login");
		FriendBean bean = new FriendBean();
		bean.setMno(login.getNo()); //로그인 유저 번호
		
		FriendBean myfriend = friendDao.getMyFriends(login.getNo());
		
		//1 로그인 유저의 승인 대기 목록에서 삭제
		String[] arr = myfriend.getWaits().split(",");
		String newWaits = "";
		int i = 0;
		for(String x : arr) {
			if(!x.equals(no)) {
				i += 1;
				if(i == 1) {
					newWaits += x;
				}else {
					newWaits += ","+x;
				}
			}
		}
		bean.setWaits(newWaits);
		friendDao.updateWaits(bean);
		
		
		//2 로그인 유저에 친구 추가
		if(myfriend != null) { //이미 데이터 있는 경우 -> 업데이트
			String newList = "";
			if(myfriend.getFriends() != null) {
				newList = myfriend.getFriends()+","+no;
			}else {
				newList = no;
			}
			bean.setFriends(newList);
			friendDao.updateFriendsList(bean);
			
		} // 데이터 없는 경우 없음
		
		//3 상대 유저에 나를 친구 추가
		FriendBean bean2 = new FriendBean();
		bean2.setMno(no); //상대 유저 번호
		
		FriendBean friend = friendDao.getMyFriends(no);
		
		if(friend != null) { //이미 데이터 있는 경우 -> 업데이트
			String newList = "";
			if(friend.getFriends() != null) {
				newList = friend.getFriends()+","+login.getNo();
			}else {
				newList = login.getNo();
			}
			bean2.setFriends(newList);
			friendDao.updateFriendsList(bean2);
			
		}else { // 데이터 없는 경우 -> 인서트
			bean2.setFriends(login.getNo()); //내 번호
			friendDao.insertFriend(bean2);
		}
		
		return gotoPage+"?no="+no;
	}

}
