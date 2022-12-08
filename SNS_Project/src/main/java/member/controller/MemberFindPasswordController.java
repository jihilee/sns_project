package member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberFindPasswordController {

	private final String command = "/findPassword.mem";
	private String getPage = "/findPasswordForm";

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form() {
		return getPage;
	}


	@RequestMapping(value = command, method = RequestMethod.POST)
	@ResponseBody
	public void send(MemberBean member, HttpServletResponse response) throws Exception {

		MemberBean bean = memberDao.findPassword(member);

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8"); //내보내는 데이터의 한글처리

		if(bean == null) {
			pw.println("<script>");
			pw.println("alert('회원정보가 일치하지 않습니다.'); location.href='findId.mem'");
			pw.println("</script>");
			pw.flush();

		}else {
			pw.println("<script>");
			pw.println("alert('비밀번호는 "+bean.getPassword()+" 입니다.'); location.href='login.mem'");
			pw.println("</script>");
			pw.flush();
		}


		//findPw(response, member); //이메일 에러남..

	}


	//비밀번호찾기
	public void findPw(HttpServletResponse response, MemberBean member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberBean ck = memberDao.getMemberByEmail(member.getEmail());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(memberDao.getMemberByEmail(member.getEmail()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}else if(!member.getEmail().equals(ck.getEmail())) { // 가입된 이메일이 아니면
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setPassword(pw);
			System.out.println("pw "+pw);
			// 비밀번호 변경
			memberDao.updatePassword(member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	//비밀번호 찾기 이메일발송
	public void sendEmail(MemberBean member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com 구글 smtp.gmail.com
		String hostSMTPid = "flotdejoie2@gmail.com"; //서버 이메일 주소(보내는 사람 이메일 주소)
		String hostSMTPpwd = "yehzschpamhxkyza"; //서버 이메일 비번(보내는 사람 이메일 비번)yehzschpamhxkyza

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "flotdejoie2@gmail.com"; //보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "블루버드"; //프로젝트이름 또는 보내는 사람 이름";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "블루버드 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587 구글 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

}
