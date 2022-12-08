package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {
	
	private final String command = "/logout.mem";
	private String gotoPage = "redirect:/login.mem";
	
	@RequestMapping(command)
	public String logout(HttpSession session) {
		
		session.invalidate(); //모든 세션 지우기
		
		return gotoPage;
		
	}

}
