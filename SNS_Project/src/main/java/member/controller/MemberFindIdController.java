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
public class MemberFindIdController {
	
	private final String command = "/findId.mem";
	private String getPage = "/findIdForm";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form() {
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String find(MemberBean member, HttpServletResponse response) throws IOException {
		
		MemberBean bean = memberDao.findId(member);
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8"); //내보내는 데이터의 한글처리
		
		if(bean == null) {
			pw.println("<script>");
			pw.println("alert('일치하는 아이디가 없습니다.'); location.href='findId.mem'"); //여기서 리턴
			pw.println("</script>");
			pw.flush(); // 안쓰면 안뜸
			
		}else {
			pw.println("<script>");
			pw.println("alert('아이디는 "+bean.getEmail()+" 입니다.'); location.href='login.mem'"); //여기서 리턴
			pw.println("</script>");
			pw.flush(); // 안쓰면 안뜸
		}

		return null;
	}

}
