package notice.controller;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import notice.model.NoticeBean;
import notice.model.NoticeDao;






@Controller
public class AdminNoticeInsertController {
	
	private final String command="insert.nt";
	private String getPage="/noticeInsertForm";
	private String gotoPage = "redirect:/list.nt";
	
	
	@Autowired
	ServletContext servletContext;

	@Autowired
	private NoticeDao noticeDao;

	
	@RequestMapping(value= command,method=RequestMethod.GET)
	public String insert() {
		
		return getPage;
	}
	
	@RequestMapping(value= command,method=RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("notice") @Valid NoticeBean notice, 	
							BindingResult result) {
		
		System.out.println("getNfile:"+notice.getNfile());
		System.out.println("getTitle:"+ notice.getTitle());
		System.out.println("getContents:"+notice.getContents());
		System.out.println("getWrite:"+notice.getUpload_date());
		
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			
			
			
			return mav;
		}
		

		MultipartFile multi = notice.getUpload();
                        System.out.println("multi.getName():"+multi.getName());
		System.out.println("multi.getOriginalFilename():"+multi.getOriginalFilename());
		System.out.println("notice.getNfile():"+notice.getNfile());
		
		
		noticeDao.insertNotice(notice);
		
		String uploadPath = servletContext.getRealPath("/resources/images");
		System.out.println("uploadPath:"+uploadPath);
		
		String uploadPath2 = servletContext.getRealPath("/resources");
		
		File folder = new File(uploadPath2);
		if (!folder.exists()) {
			folder.mkdir(); 
			System.out.println(uploadPath + " ����� resources ������ �����Ǿ����ϴ�.");
		}
		
		
		File folder2 = new File(uploadPath);
		if (!folder2.exists()) {
			folder2.mkdir(); 
			System.out.println(uploadPath + " ����� images ������ �����Ǿ����ϴ�.");
		}
		
		
		
		
		File file = new File(uploadPath+"/"+multi.getOriginalFilename());
		try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	
		
		
		mav.setViewName(gotoPage);
		return mav;
		
		

	}

	
}
