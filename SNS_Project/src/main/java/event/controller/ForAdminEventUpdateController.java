package event.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import event.model.EventBean;
import event.model.EventDao;

@Controller
public class ForAdminEventUpdateController {
	public final String command="update.evt";
	public String getPage="/EventUpdateForm";
	public String gotoPage="redirect:/list.evt";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private EventDao eventDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView update(@RequestParam("num") String num,
						 @RequestParam("pageNumber") String pageNumber
						 ) {
		
		
		 
		ModelAndView mav=new ModelAndView();
		
		EventBean event =eventDao.selectEventByNum(num);
		mav.addObject("event",event);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
		
	}

	@RequestMapping(value=command,method=RequestMethod.POST)
	public String updateProc(
			@ModelAttribute("event") @Valid EventBean event,
			BindingResult result,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			@RequestParam("originalImg") String originalImg,
			Model model) {
		
		System.out.println("이미지:"+event.getEventImage());
		System.out.println("제목:"+ event.getTitle());
		System.out.println("작성글:"+event.getWriter());
		System.out.println("이벤트 날짜:"+event.getEventdate());
		
		
		
		
		if(result.hasErrors()) {
			model.addAttribute("pageNumber", pageNumber);
			
			return getPage;
		}
		
		
        String originalPath = servletContext.getRealPath("/resources/images")+originalImg;
		File file1 = new File(originalPath);
		file1.delete();
		
		
		MultipartFile multi = event.getUpload();
		String newPath = servletContext.getRealPath("/resources/images")+"/"+event.getEventImage(); 
		File filed = new File(newPath); 
		
		try {
			multi.transferTo(filed); 
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        
          




		eventDao.updateEvent(event);
		
		model.addAttribute("?pageNumber="+pageNumber);
		
		return gotoPage;
	}

	
}
