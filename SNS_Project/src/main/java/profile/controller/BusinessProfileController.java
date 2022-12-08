package profile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import member.model.MemberDao;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class BusinessProfileController {
	
	private final String command="/bnprofile.pro";
	private final String getPage="BusinessProfile";
	
	@Autowired
	private WriteDao wdao;
	@Autowired
	private MemberDao memberDao;
	   
	@RequestMapping(command)
	public String bnprofile(HttpSession session, Model model) {
		MemberBean mb = (MemberBean)session.getAttribute("login");
		System.out.println("list_No:"+mb.getNo());
		String no = mb.getNo();
		
		List<WriteBean> lists = memberDao.select_MyWrite(mb.getNo());
		/*
		 * List <WriteBean> lists = wdao.sel_public(no); // 전체공개
		 */		List <String> likedWnoLists = wdao.findLikesByNo(no); // 이미 게시물에 좋아요를 누른사람은 중복해서 누를 수 없게.
		List<String> checkedBooks = wdao.findBookMarkByNo(no);
		
		model.addAttribute("lists",lists);
		model.addAttribute("likedWnoLists",likedWnoLists); // 로그인된 사람 기준
		model.addAttribute("checkedBooks",checkedBooks); // 로그인된 사람 기준
		return getPage;
	}
	
	
	
	
}
