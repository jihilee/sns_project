package admin.model;

public class LeaveBean {
	private int no;
	private String email;
	private String reg_date;
	private String unreg_date;
	
	private int cnt; //개수
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUnreg_date() {
		return unreg_date;
	}
	public void setUnreg_date(String unreg_date) {
		this.unreg_date = unreg_date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
