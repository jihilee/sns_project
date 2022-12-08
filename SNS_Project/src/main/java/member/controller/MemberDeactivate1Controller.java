package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberDeactivate1Controller {

	private final String command = "/deactivate1.mem";
	private String getPage = "/deactivateForm1";
	private String gotoPage = "redirect:/deactivate2.mem";
	

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form() {
		return getPage;
	}

	//settings
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String from(@RequestParam("delete") String delete, HttpSession session) {

		if(delete.equals("deactivate")) { //계정 비활성화
			return gotoPage+"?msg=deactivate";

		}else { //계정 삭제
			return gotoPage+"?msg=delete";
			
		}

	}

}
