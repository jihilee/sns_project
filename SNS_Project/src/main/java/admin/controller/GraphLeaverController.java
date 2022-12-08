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

import admin.model.LeaveBean;
import member.model.MemberDao;

@Controller
public class GraphLeaverController {

	private final String command = "leaver.ad";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command, method=RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> subscriber(@RequestParam(value="ym",required=false) String ym) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(ym == null) { //년월 없으면
			LocalDate now = LocalDate.now();
			ym = now.toString();
			ym = ym.split("-")[0] + "-" + ym.split("-")[1];
		}
		
		String year = ym.split("-")[0];
		String month = ym.split("-")[1];
		String start_date = ym+"-01";
		
		ArrayList<LeaveBean> list = (ArrayList<LeaveBean>) memberDao.yearMonthLeaver(start_date);
		map.put("leaver", list);
		
		map.put("year",year);
		map.put("month",month);
		
		System.out.println("leaver map:"+map);
		
		return map;
	}
}
