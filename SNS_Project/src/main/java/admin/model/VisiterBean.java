package admin.model;

public class VisiterBean {
	private String visit_date; //방문날짜
	private String age; //나이대 : ~19,20~29,...,50~ 
	private int cnt; //방문횟수
	
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
