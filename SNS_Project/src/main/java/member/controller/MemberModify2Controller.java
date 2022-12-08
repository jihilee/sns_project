package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberModify2Controller {
	
	private final String command = "/modify2.mem";
	private String getPage = "/modifyForm2";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form() {
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String modify(@ModelAttribute("member") @Valid MemberBean member, BindingResult bresult,
			HttpServletResponse response) throws IOException {
		
		if(bresult.hasErrors()) {
			return getPage;
		}
		
		int result = memberDao.modifyMember(member);
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		
		if(result == 1) {
			
			pw.println("<script>");
			pw.println("alert('회원정보가 변경되었습니다.'); location.href='settings.pro'");
			pw.println("</script>");
			pw.flush();
		}
		
		
		return null;
	}

}
