package event.controller;

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

import event.model.EventBean;
import event.model.EventDao;
import util.Paging;

//show event list for user
@Controller
public class ForUserEventListController {

	private final String command = "view.evt";
	private String getPage = "/usereventList";

	@Autowired
	EventDao eventDao;

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

		int totalCount = eventDao.getTotalCount(map);
		String url = request.getContextPath() + "/" + command;
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);

		List<EventBean> lists = new ArrayList<EventBean>();
		lists = eventDao.selectLists(pageInfo, map);

		mav.setViewName(getPage);
		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		
//		System.out.println(lists.get(0).getEventdate());
//		System.out.println(lists.get(1).getEventdate());
		
		return mav;
	}
}
