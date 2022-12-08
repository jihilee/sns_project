package admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.LeaveBean;
import member.model.MemberDao;

@Controller
public class LeaveController {
	
	private final String command = "leave.ad";
	private String getPage = "member/member_leave";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String leave(Model model) {
		
		ArrayList<LeaveBean> leaveList = (ArrayList<LeaveBean>) memberDao.getLeaveMembers();
		
		model.addAttribute("leaveList",leaveList);
		return getPage;
	}
}
