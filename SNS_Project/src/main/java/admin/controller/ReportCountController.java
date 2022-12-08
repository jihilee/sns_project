package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.ReportBean;
import admin.model.ReportDao;

@Controller
public class ReportCountController {
	
	private final String command = "reportCount.ad";
	
	@Autowired
	private ReportDao reportDao;
	
	@RequestMapping(value=command,method=RequestMethod.POST,produces="application/json; charset=utf-8")
	public @ResponseBody List<ReportBean> count(@RequestParam("wno") int wno) {
		
		List<ReportBean> list = reportDao.selectReportMnoAndReason(wno);
		
		return list;
	}
}
