package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberModify1Controller {

	private final String command = "/modify1.mem";
	private String getPage = "/modifyForm1";
	private String gotoPage = "redirect:/modify2.mem";

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form() {
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String form(MemberBean member, HttpServletResponse response) throws IOException {

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");		

		int result = memberDao.checkEmailPassword(member);
		//System.out.println("result "+result);
		if(result == 0) {
			pw.println("<script>");
			pw.println("alert('비밀번호가 일치하지 않습니다.'); location.href='modify1.mem'");
			pw.println("</script>");
			pw.flush();
		}
		
		return gotoPage;			

	}

}
