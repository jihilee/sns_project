package profile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class BookMarkList_Controller {

	private final String bookmarkList = "bookmarkList.pro";
	private final String getPage = "bookmarkList";

	@Autowired
	private MemberDao mdao;

	@Autowired
	private WriteDao wdao;

	@RequestMapping(value = bookmarkList, method = RequestMethod.GET)
	public String bookmarkList(HttpSession session,Model model) {

		
		MemberBean mb = (MemberBean)session.getAttribute("login");
		 
		List<WriteBean> lists = mdao.select_BookMarks(mb.getNo());//member의 no
		
		List<String> checkedBooks = wdao.findBookMarkByNo(mb.getNo()); //북마크 체크된 표시
		
		model.addAttribute("lists",lists);
		model.addAttribute("checkedBooks",checkedBooks);
		return getPage;
	}
}
