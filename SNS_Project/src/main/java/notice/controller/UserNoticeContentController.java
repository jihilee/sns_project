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
public class UserNoticeContentController {
	private final String command="usernoticeContent.nt";
	private String getPage="/usernoticeContent";
	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("num") String num,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		ModelAndView mav= new ModelAndView();
		
		noticeDao.updateReadCount(num);
		
		
		NoticeBean bean= noticeDao.selectArticle(num);
		System.out.println("bean:"+bean.getTitle());
		System.out.println("bean:"+bean.getNum());
		
		mav.addObject("notice",bean);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
	
}
