package write.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import write.model.WriteDao;

@Controller
public class Delete_Controller {
	final String command = "delete.wr";
	String goToPage = "redirect:home.wr"; //with no
	
	@Autowired
	WriteDao wdao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping(command)
	public String delete(String no, String wno, @RequestParam(required = false) String image, @RequestParam(required = false) String video ) {
		System.out.println("delete옴");
		System.out.println("delte////no="+no+"//////"+"wno="+wno);
		System.out.println("image="+image+"/"+"video="+video); 
		//image=SAM_0105.JPG,SAM_0106.JPG,SAM_0107.JPG,/video= 
		//image=/video=zico.mp4
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
		
		
		wdao.delateByWno(wno); //글번호에 해당하는 게시글 지우기
		
		return goToPage+"?no="+no;
	}
	
	
}
