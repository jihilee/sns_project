package write.model;

import java.sql.Date;

public class CommentsBean {
	private int cno;
	private int wno;
	private int mno;
	private String name;
	private String c_contents;
	private String c_upload_date;
	private int ref;
	private int re_step;
	private int re_level;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getC_contents() {
		return c_contents;
	}
	public void setC_contents(String c_contents) {
		this.c_contents = c_contents;
	}
	public String getC_upload_date() {
		return c_upload_date;
	}
	public void setC_upload_date(String c_upload_date) {
		this.c_upload_date = c_upload_date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
}