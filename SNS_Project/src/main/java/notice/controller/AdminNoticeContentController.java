package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.model.NoticeBean;
import notice.model.NoticeDao;





@Controller
public class AdminNoticeContentController {
	private final String command="content.nt";
	private String getPage="/noticeContent";
	
	@Autowired
	NoticeDao noticeDao;
	
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("num") String num,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		ModelAndView mav= new ModelAndView();
		
		noticeDao.updateReadCount(num);
		
		NoticeBean notice= noticeDao.selectArticle(num);
		
		mav.addObject("notice",notice);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
	
}
