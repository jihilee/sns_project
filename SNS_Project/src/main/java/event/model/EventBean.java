package event.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class EventBean {
	private int num;
	
	@Length(min = 3,max = 100,message = "제목을 최소 3자리 최대 100자리 입니다.")
    private String title;
	
	
	private String writer;

	@NotEmpty(message = "날짜를 입력해주세요.")
	private String eventdate;

	@NotEmpty(message = "이벤트 사진을 안넣었습니다.")
	private String eventImage;

	@Length(min = 3, max = 1000, message = "상품에 대한 설명은 최소 5자리 최대 1000자리 입니다.")
	private String write;

	private int readcount;
    

	
    private MultipartFile upload; // a.jpg X
	
	public MultipartFile getUpload() {
		return upload;
	}
	
	public void setUpload(MultipartFile upload) { // upload=a.jpg X
		System.out.println("setUpload(MultipartFile upload)");
		this.upload = upload;
		System.out.println("setUpload upload:" + upload);
		System.out.println("upload.getName():"+upload.getName());
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
		this.eventImage = upload.getOriginalFilename();
	}

	
	
	

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEventdate() {
		return eventdate;
	}

	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}

	public String getEventImage() {
		return eventImage;
	}

	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
    
  
   
    
    

}