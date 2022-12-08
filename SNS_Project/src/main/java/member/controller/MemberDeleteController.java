package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.LeaveBean;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberDeleteController {
	
	private final String command = "/delete.mem";
	private String gotoPage = "redirect:/list.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String delete(@RequestParam("no") String no) {
		
		//탈퇴회원에 추가
		MemberBean mb = memberDao.getMemberByNo(no);
		LeaveBean lb = new LeaveBean();
		lb.setEmail(mb.getEmail());
		lb.setReg_date(mb.getReg_date());
		memberDao.insertLeave(lb);
		
		//회원에서 삭제
		memberDao.deleteMember(no);
		
		return gotoPage;
	}

}
