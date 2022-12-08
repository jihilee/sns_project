package admin.model;

public class ReportBean {
	private int rno;
	private int report_mno; //신고한 사람
	private String report_mname; //신고한 사람이름
	private int reported_mno; //신고당한 사람
	private String reported_mname; //신고당한 사람이름
	private int wno; //게시글 
	private String reason; //신고이유
	private int cnt; //신고횟수
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getReport_mno() {
		return report_mno;
	}
	public void setReport_mno(int report_mno) {
		this.report_mno = report_mno;
	}
	public String getReport_mname() {
		return report_mname;
	}
	public void setReport_mname(String report_mname) {
		this.report_mname = report_mname;
	}
	public int getReported_mno() {
		return reported_mno;
	}
	public void setReported_mno(int reported_mno) {
		this.reported_mno = reported_mno;
	}
	public String getReported_mname() {
		return reported_mname;
	}
	public void setReported_mname(String reported_mname) {
		this.reported_mname = reported_mname;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
