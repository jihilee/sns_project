package admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ReportDao")
public class ReportDao {
	
	private String namespace = "admin.model.report";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//신고리스트
	public List<ReportBean> selectAllReport() {
		List<ReportBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".SelectAllReport");
		return list;
	}
	
	public List<ReportBean> selectReportMnoAndReason(int wno) {
		List<ReportBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".SelectReportMnoAndReason", wno);
		return list;
	}

	//신고한 적이 있는지 체크
	public boolean selectWnoAndReportMno(ReportBean report) {
		ReportBean rb = null;
		rb = sqlSessionTemplate.selectOne(namespace+".SelectWnoAndReportMno", report);
		if(rb == null) {
			return false;
		} else {
			return true;
		}
	}
	
	//신고 insert
	public void insertReport(ReportBean report) {
		sqlSessionTemplate.insert(namespace+".InsertReport", report);
	}
}
