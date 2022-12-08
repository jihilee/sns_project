package write.model;

import java.io.Serializable;

public class WriteBean implements Serializable,Comparable{
	private String email;
	private String name;
	private String profile;

	private String wno;
	private int no;
	private String contents;
	private String video;
	private String image;
	private String scope;
	private String upload_date;
	private String location;
	private String address;
	private String f_tag;
	private String commercial;
	private int likes;
	//나경추가
	private String ref;
	private String re_step;
	private String re_level;
	private String c_upload_date;//댓글 게시일
	private String c_contents; //댓글 내용
	private int save;
	private String cno;
	private String mno;
	private int l_cno;
	private int l_mno;
	//은정추가
	private int clearance;
	private String link;
	//혜린추가
	private int cnt;
	
	public int getClearance() {
		return clearance;
	}
	public void setClearance(int clearance) {
		this.clearance = clearance;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	//
	public WriteBean(String email, String name, String profile, String wno, int no, String contents, String video,
			String image, String scope, String upload_date, String location, String address, String f_tag,
			String commercial, int likes, String ref, String re_step, String re_level, String c_upload_date,
			String c_contents, int save, String cno, String mno, int l_cno, int l_mno) {
		super();
		this.email = email;
		this.name = name;
		this.profile = profile;
		this.wno = wno;
		this.no = no;
		this.contents = contents;
		this.video = video;
		this.image = image;
		this.scope = scope;
		this.upload_date = upload_date;
		this.location = location;
		this.address = address;
		this.f_tag = f_tag;
		this.commercial = commercial;
		this.likes = likes;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.c_upload_date = c_upload_date;
		this.c_contents = c_contents;
		this.save = save;
		this.cno = cno;
		this.mno = mno;
		this.l_cno = l_cno;
		this.l_mno = l_mno;
	}
	public WriteBean() {
		super();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getWno() {
		return wno;
	}
	public void setWno(String wno) {
		this.wno = wno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getF_tag() {
		return f_tag;
	}
	public void setF_tag(String f_tag) {
		this.f_tag = f_tag;
	}
	public String getCommercial() {
		return commercial;
	}
	public void setCommercial(String commercial) {
		this.commercial = commercial;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getRe_step() {
		return re_step;
	}
	public void setRe_step(String re_step) {
		this.re_step = re_step;
	}
	public String getRe_level() {
		return re_level;
	}
	public void setRe_level(String re_level) {
		this.re_level = re_level;
	}
	public String getC_upload_date() {
		return c_upload_date;
	}
	public void setC_upload_date(String c_upload_date) {
		this.c_upload_date = c_upload_date;
	}
	public String getC_contents() {
		return c_contents;
	}
	public void setC_contents(String c_contents) {
		this.c_contents = c_contents;
	}
	public int getSave() {
		return save;
	}
	public void setSave(int save) {
		this.save = save;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public int getL_cno() {
		return l_cno;
	}
	public void setL_cno(int l_cno) {
		this.l_cno = l_cno;
	}
	public int getL_mno() {
		return l_mno;
	}
	public void setL_mno(int l_mno) {
		this.l_mno = l_mno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public int compareTo(Object o) {
		return wno.compareTo(((WriteBean)o).wno);
	}
	
	
}