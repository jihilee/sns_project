package admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.ReportBean;
import admin.model.ReportDao;

@Controller
public class ReportController {
	
	private final String command = "report.ad";
	private String getPage = "post/report";
	
	@Autowired
	private ReportDao reportDao;
	
	@RequestMapping(command)
	public String report(Model model) {
		
		ArrayList<ReportBean> reportList = (ArrayList<ReportBean>) reportDao.selectAllReport();
		
		model.addAttribute("reportList",reportList);
		return getPage;
	}
	
}
