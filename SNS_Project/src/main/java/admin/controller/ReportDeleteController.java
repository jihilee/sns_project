package admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class ReportDeleteController {

	private final String command = "deleteReport.ad";
	//private String gotoPage = "redirect:/report.ad";
	
	@Autowired
	private WriteDao writeDao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(command)
	public void delete(@RequestParam("wno") String wno,
						HttpServletResponse response) {
		
		WriteBean wb = writeDao.getByWnoForUpdate(wno);
		String image = wb.getImage();
		String video = wb.getVideo();
		System.out.println("image:"+image);
		System.out.println("video:"+video);
		
		if(image == null || image == "" ) {
			image = "Null";
		}
		if(video == null || video == "" ) {
			video = "Null";
		}
		
		if(!image.equals("Null")) {
			String url = application.getRealPath("/resources/assets/images/upload");
			
			String[] images = image.split(",");
			for(String name : images) {
				System.out.println("name:"+name);
				/*
				name:키링.jpg
				name:핸드폰케이스.jpg
				name:홈페이지 로고.jpg
				name:회사소개.png
				*/
				File file = new File(url,name);
				if(file.exists()) {
					file.delete();
				}
			}
		}
		else if(!video.equals("Null")) {
			String url = application.getRealPath("/resources/assets/images/video");
			
			String[] videos = video.split(",");
			for(String vname : videos) {
				System.out.println("vname:"+vname);
				
				File file = new File(url,vname);
				if(file.exists()) {
					file.delete();
				}
			}
		}
		
		writeDao.delateByWno(wno); //글번호에 해당하는 게시글 지우기
		
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('게시글이 삭제되었습니다.')");
			pw.println("location.href='report.ad'");
			pw.println("</script>");
			pw.flush();

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return gotoPage;
	}
	
}
