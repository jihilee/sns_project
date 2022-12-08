package room.model;

public class RoomBean {
	
	private String no;
	private String room_no;
	private String mno1;
	private String mno2;
	private String d_mno1;
	private String d_mno2;
	private String mno1_lastvisit;
	private String mno2_lastvisit;
	
	public RoomBean() {
		super();
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public String getMno1() {
		return mno1;
	}
	public void setMno1(String mno1) {
		this.mno1 = mno1;
	}
	public String getMno2() {
		return mno2;
	}
	public void setMno2(String mno2) {
		this.mno2 = mno2;
	}
	
	/* room.xml getAllRoomListByNo */

	public String getD_mno1() {
		return d_mno1;
	}
	public void setD_mno1(String d_mno1) {
		this.d_mno1 = d_mno1;
	}
	public String getD_mno2() {
		return d_mno2;
	}
	public void setD_mno2(String d_mno2) {
		this.d_mno2 = d_mno2;
	}
	
	public String getMno1_lastvisit() {
		return mno1_lastvisit;
	}
	public void setMno1_lastvisit(String mno1_lastvisit) {
		this.mno1_lastvisit = mno1_lastvisit;
	}
	public String getMno2_lastvisit() {
		return mno2_lastvisit;
	}
	public void setMno2_lastvisit(String mno2_lastvisit) {
		this.mno2_lastvisit = mno2_lastvisit;
	}
	
	private String send_mno; 
	private String read_mno; 
	private String time; 
	private String content; 

	public String getSend_mno() {
		return send_mno;
	}
	public void setSend_mno(String send_mno) {
		this.send_mno = send_mno;
	}
	public String getRead_mno() {
		return read_mno;
	}
	public void setRead_mno(String read_mno) {
		this.read_mno = read_mno;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	/* chatting.java / chatRoomListController.java */
	public RoomBean(String mno1, String mno2) {
		super();
		this.mno1 = mno1;
		this.mno2 = mno2;
	}
	
	
	
	
}
