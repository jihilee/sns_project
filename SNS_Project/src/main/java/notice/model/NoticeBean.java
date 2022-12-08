package notice.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class NoticeBean {
	
   private int num;
   
   @Length(min = 5,max = 30,message = "제목을 최소 5자리 최대 30자리 입니다.")
   private String title;
   
   @Length(min = 5,max = 1000,message = "내용을 최소 5자리 최대 100자리 입니다.")
   private String contents;
   
   
   private int readcount;
   
   @NotEmpty(message = "사진을 안넣었습니다.")
   private String nfile;
   
   @NotEmpty(message = "날짜를 입력해주세요.")
   private String upload_date;
   
   
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
 		this.nfile = upload.getOriginalFilename();
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
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}

public int getReadcount() {
	return readcount;
}
public void setReadcount(int readcount) {
	this.readcount = readcount;
}
public String getNfile() {
	return nfile;
}
public void setNfile(String nfile) {
	this.nfile = nfile;
}
public String getUpload_date() {
	return upload_date;
}
public void setUpload_date(String upload_date) {
	this.upload_date = upload_date;
}

   
}
