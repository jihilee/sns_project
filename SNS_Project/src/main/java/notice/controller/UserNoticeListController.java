package notice.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import notice.model.NoticeBean;
import notice.model.NoticeDao;
import utility.Paging;

//show notice list for user
@Controller
public class UserNoticeListController {

	private final String command = "view.nt";
	private String getPage = "/usernoticeList";

	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(command)
	public ModelAndView getList(@RequestParam(value = "whatColumn", required = false) String whatColumn,
								@RequestParam(value = "keyword", required = false) String keyword,
								@RequestParam(value = "pageNumber", required = false) String pageNumber, 
								HttpServletRequest request) {

		System.out.println();
		System.out.println(whatColumn);
		System.out.println(keyword);
		System.out.println();
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");

		int totalCount = noticeDao.getTotalCount(map);
		String url = request.getContextPath() + "/" + command;
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, url);

		List<NoticeBean> lists = new ArrayList<NoticeBean>();
		lists = noticeDao.selectLists(pageInfo, map);

		mav.setViewName(getPage);
		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		
//		System.out.println(lists.get(0).getnoticedate());
//		System.out.println(lists.get(1).getnoticedate());
		
		return mav;
	}
}
