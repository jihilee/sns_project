package admin.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.VisiterBean;
import admin.model.VisiterDao;

@Controller
public class GraphVisiterController {

	private final String command = "visiter.ad";
	
	@Autowired
	private VisiterDao visiterDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> visiter(@RequestParam(value="ym",required=false) String ym){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println("ym:"+ym);
		
		if(ym == null) { //년월 없으면
			LocalDate now = LocalDate.now();
			ym = now.toString();
			ym = ym.split("-")[0] + "-" + ym.split("-")[1];
		}
		
		//System.out.println("ym:"+ym);
		String year = ym.split("-")[0];
		String month = ym.split("-")[1];
		//System.out.println(year+month);
		String start_date = ym+"-01";
		
		ArrayList<VisiterBean> list = (ArrayList<VisiterBean>) visiterDao.yearMonthVisiter(start_date);
		//System.out.println("list.size:"+list.size());
		map.put("visiter", list);
		
		/*
		for(VisiterBean v : list) {
			System.out.println(v.getAge()+"/"+v.getVisit_date());
		}
		*/
		
		ArrayList<VisiterBean> memberAge = (ArrayList<VisiterBean>) visiterDao.todayAge();
		map.put("memberAge", memberAge);
		
		/*
		String str = "";
		for(int i=0; i<memberAge.size(); i++) {
			VisiterBean v = memberAge.get(i);
			if(i == memberAge.size()-1) {
				str += v.getVisit_date()+","+v.getAge()+","+v.getCnt();
			} else {
				str += v.getVisit_date()+","+v.getAge()+","+v.getCnt()+"/";
			}
		}
		System.out.println(str);
		*/
		
		map.put("year",year);
		map.put("month",month);
		
		System.out.println("visiter map:"+map);

		return map;
	}
}
