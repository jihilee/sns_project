package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;

@Controller
public class MemberRegister1Controller {
	
	private final String command = "/register1.mem";
	private String getPage = "/registerForm1";
	private String getPage2 = "/registerForm2";
	
	//회원가입 버튼 -> registerForm1.jsp
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form() {
		return getPage;
	}
	
	//registerForm1.jsp 계속 버튼 -> registerForm2.jsp
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String form(MemberBean member, Model model) {
		model.addAttribute("member", member);
		return getPage2;
	}

}
