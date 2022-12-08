package admin.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.SubscriberBean;
import admin.model.VisiterBean;
import admin.model.VisiterDao;
import member.model.MemberDao;

@Controller
public class ChartController {

	private final String command = "chart.ad";
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private VisiterDao visiterDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> chart() {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//날짜 계산 (5개월 전 ~ 현재 : 총 6개의 월)
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -5); //5개월 이전
		Date date = cal.getTime();
		int year = date.getYear() + 1900;
		int month = date.getMonth() + 1; 
//		System.out.println(cal);
//		System.out.println(date);
//		System.out.println(year);
//		System.out.println(month);
		
		String s_date = "";
		if(month < 10) {
			s_date = year + "-" + "0"+month + "-" + "01";
		} else {
			s_date = year + "-" + month + "-" + "01";
		}
//		System.out.println(s_date);
		
		//chart1 : 월별 가입자수(성별로)
		ArrayList<SubscriberBean> chart1 = (ArrayList<SubscriberBean>) memberDao.monthlyGender(s_date);
		
		/*
		String str = "";
		for(int i=0; i<chart1.size(); i++) {
			SubscribersBean s = chart1.get(i);
//			System.out.println(s.getGender()+"/"+s.getYear_month()+"/"+s.getCount());
			if(i == chart1.size()-1) {
				str += s.getGender()+","+s.getYear_month()+","+s.getCount();
			} else {
				str += s.getGender()+","+s.getYear_month()+","+s.getCount()+"/";
			}
		}
//		System.out.println(str);
		*/
		
		//monthList : 날짜들만 담은 리스트(chart1의 라벨용) 
		ArrayList<String> monthList = new ArrayList<String>();
//		ArrayList<SubscriberBean> chart1List = new ArrayList<SubscriberBean>();
		for(int i=0; i<6; i++) {
			String str = "";
			if(month < 10) {
				str += String.valueOf(year) + "-0"+String.valueOf(month);
			} else {
				str += String.valueOf(year) + "-" +String.valueOf(month);
			}
			monthList.add(str);
//			System.out.println("mL"+monthList);

//			SubscriberBean sb1 = new SubscriberBean("woman",str,0);
//			SubscriberBean sb2 = new SubscriberBean("man",str,0);
//			chart1List.add(sb1);
//			chart1List.add(sb2);
//			System.out.println("chart1List"+chart1List);
			
			cal.add(Calendar.MONTH, 1);
			date = cal.getTime();
			year = date.getYear() + 1900;
			month = date.getMonth() + 1; 
		}

		map.put("chart1", chart1);
		map.put("monthList", monthList);
//		System.out.println("map"+map);

		
		//chart2 : 회원 방문자수(나이별로)
		ArrayList<VisiterBean> chart2 = (ArrayList<VisiterBean>) visiterDao.todayAge();
		
		String str = "";
		for(int i=0; i<chart2.size(); i++) {
			VisiterBean v = chart2.get(i);
			if(i == chart2.size()-1) {
				str += v.getVisit_date()+","+v.getAge()+","+v.getCnt();
			} else {
				str += v.getVisit_date()+","+v.getAge()+","+v.getCnt()+"/";
			}
		}
//		System.out.println(str);
		
		map.put("chart2", chart2);
//		System.out.println("map"+map);
		
		return map;
	}

}
