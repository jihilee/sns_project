package member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberListController {
	
	private final String command = "/list.mem";
	private String getPage = "/memberList";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		List<MemberBean> lists = new ArrayList<MemberBean>();
		lists = memberDao.getAllMembers();
		
		model.addAttribute("lists", lists);
		
		return getPage;
	}

}
