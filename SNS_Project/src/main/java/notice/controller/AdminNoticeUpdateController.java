package notice.controller;

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

import notice.model.NoticeBean;
import notice.model.NoticeDao;

@Controller
public class AdminNoticeUpdateController {
	public final String command="update.nt";
	public String getPage="/noticeUpdateForm";
	public String gotoPage="redirect:/list.nt";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView update(@RequestParam("num") String num,
						 @RequestParam("pageNumber") String pageNumber
						 ) {
		
		
		 
		ModelAndView mav=new ModelAndView();
		
		NoticeBean notice =noticeDao.selectnoticeByNum(num);
		mav.addObject("notice",notice);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
		
	}

	@RequestMapping(value=command,method=RequestMethod.POST)
	public String updateProc(
			@ModelAttribute("notice") @Valid NoticeBean notice,
			BindingResult result,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			@RequestParam("originalImg") String originalImg,
			Model model) {
		
		System.out.println("getNfile:"+notice.getNfile());
		System.out.println("getTitle:"+ notice.getTitle());
		System.out.println("getContents:"+notice.getContents());
		System.out.println("getWrite:"+notice.getUpload_date());
		
		
		
		
		if(result.hasErrors()) {
			model.addAttribute("pageNumber", pageNumber);
			
			return getPage;
		}
		
		
        String originalPath = servletContext.getRealPath("/resources/images")+originalImg;
		File file1 = new File(originalPath);
		file1.delete();
		
		
		MultipartFile multi = notice.getUpload();
		String newPath = servletContext.getRealPath("/resources/images")+"/"+notice.getNfile();
		File filed = new File(newPath); 
		
		try {
			multi.transferTo(filed); 
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        
          




		noticeDao.updatenotice(notice);
		
		model.addAttribute("?pageNumber="+pageNumber);
		
		return gotoPage;
	}

	
}
