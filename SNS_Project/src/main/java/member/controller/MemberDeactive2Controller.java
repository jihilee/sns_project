package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.LeaveBean;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberDeactive2Controller {
	
	private final String command = "/deactivate2.mem";
	private String getPage = "/deactivateForm2";
	private String gotoPage = "redirect:/login.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form(@RequestParam("msg") String msg, Model model) {
		//System.out.println("msg"+msg);
		model.addAttribute("msg", msg);
		return getPage;
	}
	
	//settings
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String delete(MemberBean member, HttpServletResponse response) throws IOException {
		
		//System.out.println("member.getDeactivate() "+member.getDeactivate());
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");		

		if(member.getDeactivate().equals("1")) { //계정 비활성화
			int result = memberDao.deactivateMember(member);
			//System.out.println("result "+result);
			if(result == 0) {
				pw.println("<script>");
				pw.println("alert('비밀번호가 일치하지 않습니다.'); location.href='deactivate2.mem?msg=deactivate'");
				pw.println("</script>");
				pw.flush();
			}else {
				pw.println("<script>");
				pw.println("alert('계정이 비활성화 되었습니다.'); location.href='login.mem'");
				pw.println("</script>");
				pw.flush();
			}

		}else { //계정 삭제
			
			//탈퇴회원에 추가
			MemberBean mb = memberDao.getMemberByNo(member.getNo());
			LeaveBean lb = new LeaveBean();
			lb.setEmail(mb.getEmail());
			String reg_date = mb.getReg_date().split(" ")[0]; 
			lb.setReg_date(reg_date);
			System.out.println("lb"+lb.getEmail());
			System.out.println("lb"+lb.getReg_date());
			memberDao.insertLeave(lb);
			
			int result = memberDao.deleteMember(member);
			//System.out.println("result "+result);
			if(result == 0) {
				pw.println("<script>");
				pw.println("alert('비밀번호가 일치하지 않습니다.'); location.href='deactivate2.mem?msg=delete'");
				pw.println("</script>");
				pw.flush();
			}else {
				pw.println("<script>");
				pw.println("alert('계정이 삭제 되었습니다.'); location.href='login.mem'");
				pw.println("</script>");
				pw.flush();
			}

		}

		return gotoPage;
	}	

}
