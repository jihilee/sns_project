package chat.model;

public class ChatBean {

	private String no;
	private String room_no;
	private String send_mno;
	private String read_mno;
	private String time;
	private String content;
	
	public ChatBean() {
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
	
	/* room.xml getAllRoomListByNo */
	
	private String m1_name;
	private String m2_name;
	private String m1_profile;
	private String m2_profile;
	private String chatday;
	private String chattime;
	private String d_mno1;
	private String d_mno2;
	private String mno1_lastvisit;
	private String mno2_lastvisit;
	
	public String getM1_name() {
		return m1_name;
	}
	public void setM1_name(String m1_name) {
		this.m1_name = m1_name;
	}
	public String getM2_name() {
		return m2_name;
	}
	public void setM2_name(String m2_name) {
		this.m2_name = m2_name;
	}
	public String getM1_profile() {
		return m1_profile;
	}
	public void setM1_profile(String m1_profile) {
		this.m1_profile = m1_profile;
	}
	public String getM2_profile() {
		return m2_profile;
	}
	public void setM2_profile(String m2_profile) {
		this.m2_profile = m2_profile;
	}
	public String getChatday() {
		return chatday;
	}
	public void setChatday(String chatday) {
		this.chatday = chatday;
	}
	public String getChattime() {
		return chattime;
	}
	public void setChattime(String chattime) {
		this.chattime = chattime;
	}
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
	/* chatting.java sendMsg() */
	public ChatBean(String room_no, String send_mno, String read_mno, String content) {
		super();
		this.room_no = room_no;
		this.send_mno = send_mno;
		this.read_mno = read_mno;
		this.content = content;
	}

	
}
