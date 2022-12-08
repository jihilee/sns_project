package write.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import write.model.BookMarkBean;
import write.model.WriteDao;

@Controller
public class BookMark_Controller {

	private final String bookmarked="bookmarked.wr";
	private final String bookmarkCancle="bookmarkCancle.wr";
	
	@Autowired
	private WriteDao wdao;
	
	@RequestMapping(bookmarked)
	public void bookmark(@RequestParam("wno") int wno,
						HttpSession session,HttpServletResponse response) throws IOException {
		
		System.out.println("bookmark 진입");
		BookMarkBean bmb = new BookMarkBean();
		MemberBean mb = (MemberBean)session.getAttribute("login");
		bmb.setWno(wno);
		bmb.setMno(Integer.parseInt(mb.getNo()));
		
		
		if(mb.equals(null)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 기능합니다')");
			out.println("location.href='home.wr'");
			out.println("</script>");
		}
		
		int result=wdao.insert_BookMark(bmb);
		System.out.println("result : "+result);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(result);
		writer.flush();
		
	}
	
	@RequestMapping(value=bookmarkCancle,method=RequestMethod.GET)
	public void bookmarkCancle(@RequestParam("wno") int wno,
						HttpSession session,HttpServletResponse response) throws IOException {
		
		BookMarkBean bmb = new BookMarkBean();
		MemberBean mb = (MemberBean)session.getAttribute("login");
		bmb.setWno(wno);
		bmb.setMno(Integer.parseInt(mb.getNo()));
		
		
		if(mb.equals(null)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 기능합니다')");
			out.println("location.href='home.wr'");
			out.println("</script>");
		}
		
		int result=wdao.delete_BookMark(bmb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(result);
		writer.flush();
		
	}
	
}
