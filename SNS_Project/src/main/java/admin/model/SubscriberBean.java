package admin.model;

public class SubscriberBean {
	private String year_month; //가입한 날짜의 년-월
	private String gender; //성별
	private int count; //개수
	
	public SubscriberBean() {
		
	}
	
	public SubscriberBean(String gender, String year_month, int count) {
		super();
		this.gender = gender;
		this.year_month = year_month;
		this.count = count;
	}
	
	public String getYear_month() {
		return year_month;
	}
	public void setYear_month(String year_month) {
		this.year_month = year_month;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
