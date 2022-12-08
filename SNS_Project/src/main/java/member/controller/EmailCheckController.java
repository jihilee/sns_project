package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;

@Controller
public class EmailCheckController {
	
	private final String command = "/email_check_proc.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	@ResponseBody
	public String check(@RequestParam("inputemail") String inputemail) {
		
		int result = memberDao.emailDuplCheck(inputemail);
		
		if(result == 1) { //중복되는 아이디가 있다면
			return "cannot";
		}else {
			return "can";
		}

	}

}
