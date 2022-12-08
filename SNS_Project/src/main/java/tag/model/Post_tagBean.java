package tag.model;

public class Post_tagBean {

	private String wno;
	private String tag_id;
	private String tag_name;
	
	public Post_tagBean() {
		super();
	}
	public Post_tagBean(String wno, String tag_id) {
		super();
		this.wno = wno;
		this.tag_id = tag_id;
	}
	public String getWno() {
		return wno;
	}
	public void setWno(String wno) {
		this.wno = wno;
	}
	public String getTag_id() {
		return tag_id;
	}
	public void setTag_id(String tag_id) {
		this.tag_id = tag_id;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	
	
}
