package event.controller;


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

import event.model.EventBean;
import event.model.EventDao;






@Controller
public class ForAdminEventInsertController {
	
	private final String command="insert.evt";
	private String getPage="/eventInsertForm";
	private String gotoPage = "redirect:/list.evt";
	
	
	@Autowired
	ServletContext servletContext;

	@Autowired
	private EventDao eventDao;

	
	@RequestMapping(value= command,method=RequestMethod.GET)
	public String insert() {
		
		return getPage;
	}
	
	@RequestMapping(value= command,method=RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("event") @Valid EventBean event, 	
							BindingResult result) {
		
		System.out.println("getEventImage?:"+event.getEventImage());
		System.out.println("getTitle:"+ event.getTitle());
		System.out.println("getWriter:"+event.getWriter());
		System.out.println("getEventdate:"+event.getEventdate());
		System.out.println("getWrite:"+event.getWrite());
		
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			
			
			
			return mav;
		}
		

		MultipartFile multi = event.getUpload();
                        System.out.println("multi.getName():"+multi.getName());
		System.out.println("multi.getOriginalFilename():"+multi.getOriginalFilename());
		System.out.println("event.getEventImage():"+event.getEventImage());
		
		
		eventDao.insertEvent(event);
		
		String uploadPath = servletContext.getRealPath("/resources/images");
		System.out.println("uploadPath:"+uploadPath);
		
		String uploadPath2 = servletContext.getRealPath("/resources");
		//resources 라는 폴더가 존재하지 않는다명 생성.
		File folder = new File(uploadPath2);
		if (!folder.exists()) {
			folder.mkdir(); //폴더 생성합니다.
			System.out.println(uploadPath + " 경로의 resources 폴더가 생성되었습니다.");
		}
		
		//resources/images 라는 폴더가 존재하지 않는다명 생성.
		File folder2 = new File(uploadPath);
		if (!folder2.exists()) {
			folder2.mkdir(); //폴더 생성합니다.
			System.out.println(uploadPath + " 경로의 images 폴더가 생성되었습니다.");
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
