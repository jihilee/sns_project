package notice.controller;



import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.model.NoticeBean;
import notice.model.NoticeDao;


@Controller
public class AdminNoticeDeleteController {
	private final String command="delete.nt";
	private String gotoPage="redirect:/list.nt";
	
	@Autowired
	NoticeDao noticeDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String delete(@RequestParam("num") String num,
						@RequestParam(value="pageNumber", required=false) String pageNumber,
						Model model) {
	
		
		NoticeBean notice = noticeDao.getnotice(num);
		
		String deletePath = servletContext.getRealPath("/resources/images");
		
		File delFile = new File(deletePath+"/"+notice.getNfile());
		delFile.delete();
		
		int cnt = noticeDao.deletenotice(num); // DB
		
		return gotoPage+"?pageNumber="+pageNumber;
	}


}

