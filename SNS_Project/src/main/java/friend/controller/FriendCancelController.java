package friend.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import friend.model.FriendBean;
import friend.model.FriendDao;
import member.model.MemberBean;

@Controller
public class FriendCancelController {

	private final String command = "/cancel.fr";
	private String gotoPage = "redirect:/profile.pro";

	@Autowired
	private FriendDao friendDao;

	//친구 끊기 버튼 클릭 => 로그인 유저/상대 유저 모두 friends 컬럼에서 삭제
	@RequestMapping(command)
	public String cancel(@RequestParam("no") String no, HttpSession session) {

		MemberBean login = (MemberBean)session.getAttribute("login");

		//2 로그인 유저에서 친구 삭제
		FriendBean bean = new FriendBean();
		bean.setMno(login.getNo()); //내 번호

		FriendBean myfriend = friendDao.getMyFriends(login.getNo());

		String[] list = myfriend.getFriends().split(",");
		String newList = "";
		
		int i = 0;
		for(String x : list) {
			//System.out.println(x);
			if(x.equals(no) == false) { //상대 유저가 아니라면 리스트에 추가
				i += 1;
				if(i == 1 ) {
					newList += x;
				}else {
					newList += (","+x);
				}
			}
		}

		bean.setFriends(newList);
		friendDao.updateFriendsList(bean);


		//2 상대 유저에서 친구 삭제
		FriendBean bean2 = new FriendBean();
		bean2.setMno(no);

		FriendBean myfriend2 = friendDao.getMyFriends(no);

		String[] list2 = myfriend2.getFriends().split(",");
		String newList2 = "";
		
		i = 0;
		for(String x : list2) {
			//System.out.println(x);
			if(x.equals(login.getNo()) == false) { //로그인 유저가 아니라면 리스트에 추가
				i += 1;
				if(i == 1 ) {
					newList2 += x;
				}else {
					newList2 += (","+x);
				}
			}
		}

		bean2.setFriends(newList2);
		friendDao.updateFriendsList(bean2);

		return gotoPage+"?no="+no;
	}

}












