package write.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.ReportBean;
import admin.model.ReportDao;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class Report_Controller {

	private final String command = "report.wr";
	
	@Autowired
	private ReportDao reportDao;
	
	@Autowired
	private WriteDao writeDao;

	@RequestMapping(command)
	public void report(@ModelAttribute("report") ReportBean report,
						HttpServletResponse response) {
		System.out.println("신고");
		System.out.println("wno :" +report.getWno());
		System.out.println("report_mno :" +report.getReport_mno());
		System.out.println("reason :"+report.getReason());
		
		//reason에 값 넣어주기
		String[] reason = report.getReason().split(",");
		if(reason[0].equals("기타")) {
			report.setReason(reason[1]);
		} else {
			report.setReason(reason[0]);
		}
		System.out.println("변경 후 reason :"+report.getReason());
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//신고한 적이 있는지 체크
		boolean check = reportDao.selectWnoAndReportMno(report);
		if(check == false) { //없음
			WriteBean write = writeDao.getByWnoForUpdate(String.valueOf(report.getWno()));
			report.setReported_mno(write.getNo());
			reportDao.insertReport(report);
			writer.println("<script>");
			writer.println("alert('신고가 접수되었습니다.')");
			writer.println("location.href='home.wr'");
			writer.println("</script>");
		} else { //있음
			writer.println("<script>");
			writer.println("alert('신고한 내역이 있습니다.')");
			writer.println("location.href='home.wr'");
			writer.println("</script>");
		}
		
		writer.flush();
	}
	
}
