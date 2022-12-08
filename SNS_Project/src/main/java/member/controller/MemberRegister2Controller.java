package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegister2Controller {
	
	private final String command = "/register2.mem";
	private String getPage = "/registerForm2";
	
	@Autowired
	private MemberDao memberDao;
	
	//registerForm2.jsp에서 회원가입 진행
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String register(@ModelAttribute("member") @Valid MemberBean member, BindingResult result, 
			Model model, HttpServletResponse response) throws IOException {
		
		//System.out.println(member.getEmail());
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		memberDao.registerMember(member);
		
		//회원가입 완료 alert
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8"); //내보내는 데이터의 한글처리

		pw.println("<script>");
		pw.println("alert('회원가입 되었습니다.'); location.href='login.mem'"); //여기서 리턴
		pw.println("</script>");
		pw.flush(); // 안쓰면 안뜸
		
		return null; //여기서 리턴하면 안넘어감
	}

}
