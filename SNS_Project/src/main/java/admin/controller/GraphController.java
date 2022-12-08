package admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.VisiterDao;
import member.model.MemberDao;

@Controller
public class GraphController {

	private final String command = "graph.ad";
	private String visiterPage = "graph/visiter";
	private String subscriberPage = "graph/subscriber";
	private String leaverPage = "graph/leaver";
	
	@Autowired
	private VisiterDao visiterDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String graph(@RequestParam("who") String who,
						Model model) {

		//오늘의 월 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		//System.out.println(date);
		String today = sdf.format(date);
		//System.out.println(today);
		model.addAttribute("today",today);
		
		//어제 날짜 구하기
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE,-1);
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		String yesterday = s.format(cal.getTime());

		if(who.equals("visiter")) {

			//어제방문자수, 오늘방문자수 구하기
			int today_visiter = visiterDao.todayVisiter();
			int yesterday_visiter = visiterDao.yesterdayVisiter(yesterday);
			model.addAttribute("today_visiter",today_visiter);
			model.addAttribute("yesterday_visiter",yesterday_visiter);
			//System.out.println("today_visiter:"+today_visiter);
			//System.out.println("yesterday_visiter:"+yesterday_visiter);
			
			//이번달 최저, 최고 방문자수 구하기
			int min_visiter = visiterDao.minVisiter();
			int max_visiter = visiterDao.maxVisiter();
			model.addAttribute("min_visiter",min_visiter);
			model.addAttribute("max_visiter",max_visiter);
			
			return visiterPage;
		
		} else if(who.equals("subscriber")) {
			
			//어제 가입자수, 오늘 가입자수 구하기
			int today_subscriber = memberDao.todayMember();
			int yesterday_subscriber = memberDao.yesterdayMember(yesterday);
			model.addAttribute("today_subscriber",today_subscriber);
			model.addAttribute("yesterday_subscriber",yesterday_subscriber);
			
			//이번달 최저, 최고 가입자수 구하기
			int min_subscriber = memberDao.minMember();
			int max_subscriber = memberDao.maxMember();
			model.addAttribute("min_subscriber",min_subscriber);
			model.addAttribute("max_subscriber",max_subscriber);

			//여성, 남성 가입자수 구하기
			int woman = memberDao.genderMember("woman");
			int man = memberDao.genderMember("man");
			model.addAttribute("woman",woman);
			model.addAttribute("man",man);
			
			return subscriberPage;
		
		} else {
			
			//어제 탈퇴자수, 오늘 탈퇴자수 구하기
			int today_leaver = memberDao.todayLeave();
			int yesterday_leaver = memberDao.yesterdayLeave(yesterday);
			model.addAttribute("today_leaver",today_leaver);
			model.addAttribute("yesterday_leaver",yesterday_leaver);
			
			//이번달 최저, 최고 탈퇴자수 구하기
			int min_leaver = memberDao.minLeaver();
			int max_leaver = memberDao.maxLeaver();
			model.addAttribute("min_leaver",min_leaver);
			model.addAttribute("max_leaver",max_leaver);
			
			return leaverPage;
		}
		
	}
	
}
