package admin.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.VisiterDao;
import member.model.MemberDao;
import write.model.WriteDao;

@Controller
public class IndexController {

	private final String command = "index.ad";
	private String getPage = "index";
	
	@Autowired
	private VisiterDao visiterDao;
	
	@Autowired
	private WriteDao writeDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String index(Model model) {
		
		/*
		//=> 관리자쪽말고 사용자쪽 메인피드에서 해야함
		boolean sysdate_visiter = visiterDao.sysdateVisiter();
		if(sysdate_visiter == false) { //없으면
			System.out.println("insert");
			//방문자수 insert
			String[] age = {"~19","20~29","30~39","40~49","50~59","all"};
			for(String a : age) {
				visiterDao.insertVisiter(a);
			}
		} else { //있으면
			System.out.println("update");
			//방문자수 update
			visiterDao.updateAllVisiter();
			
		}
		*/
		
		//방문자수
		int today_visit = visiterDao.todayVisiter();
		
		Calendar cal = Calendar.getInstance();
//		System.out.println(cal);
		int month = cal.get(Calendar.MONTH) + 1;
//		System.out.println(month);
		int year = cal.get(Calendar.YEAR);
//		System.out.println(year);
		String first_date = year+"-"+month+"-01";
//		System.out.println(first_date);
		
		List<Integer> cntList = (List<Integer>) visiterDao.monthVisiter(first_date);
		int month_visit = 0;
		for(int cnt: cntList) {
			month_visit += cnt;
		}
//		System.out.println("month_visit:"+month_visit);
		
		//게시글수
		int today_write = writeDao.todayWrite();
		int total_write = writeDao.totalWrite();
		
		//가입자수
		int today_member = memberDao.todayMember();
		int total_member = memberDao.totalMember();
		
		//탈퇴자수
		int today_leave = memberDao.todayLeave();
		int total_leave = memberDao.totalLeave();
		
		//카카오 가입자수
		int kakao = memberDao.kakaoMember();
		
		model.addAttribute("today_visit",today_visit);
		model.addAttribute("month_visit",month_visit);
		model.addAttribute("today_write",today_write);
		model.addAttribute("total_write",total_write);
		model.addAttribute("today_member",today_member);
		model.addAttribute("total_member",total_member);
		model.addAttribute("today_leave",today_leave);
		model.addAttribute("total_leave",total_leave);
		model.addAttribute("kakao",kakao);
		return getPage;
	}
}
