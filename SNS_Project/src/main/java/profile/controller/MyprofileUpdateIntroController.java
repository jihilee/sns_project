package profile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MyprofileUpdateIntroController {
	
	private final String command = "/updateIntro.pro";
	private String getPage = "/updateIntroForm";
	private String gotoPage = "redirect:/myprofile.pro";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form(MemberBean member) {
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String update(MemberBean member) {
		
		memberDao.updateIntro(member);
		
		return gotoPage;
	}

}
