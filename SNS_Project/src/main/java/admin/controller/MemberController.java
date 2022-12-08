package admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberController {

	private final String command = "member.ad";
	private String getPage = "member/member";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String member(Model model,
						@RequestParam(value="deactivate",required=false) String deactivate) {
		
		ArrayList<MemberBean> memberList = null;
		if(deactivate == null) {
			memberList = (ArrayList<MemberBean>) memberDao.getAllMembers();
		} else {
			memberList = (ArrayList<MemberBean>) memberDao.getMembersByDeactivate(deactivate);
		}
		
		model.addAttribute("memberList",memberList);
		return getPage;
	}
}
