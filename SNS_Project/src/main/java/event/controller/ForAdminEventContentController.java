package event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import event.model.EventBean;
import event.model.EventDao;




@Controller
public class ForAdminEventContentController {
	private final String command="content.evt";
	private String getPage="/eventContent";
	@Autowired
	EventDao eventDao;
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("num") String num,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		ModelAndView mav= new ModelAndView();
		
		eventDao.updateReadCount(num);
		
		EventBean bean= eventDao.selectArticle(num);
		
		mav.addObject("bean",bean);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
	
}
