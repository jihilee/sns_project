package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberModifyController {
	
	private final String command = "/modify.mem";
	private String getPage = "/modifyForm";
	private String gotoPage = "redirect:/mypage.my";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form() {
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String modify(MemberBean member) {
		
		System.out.println("여기오나요");
		
		memberDao.modifyMember(member);
		
		return gotoPage;
	}

}
