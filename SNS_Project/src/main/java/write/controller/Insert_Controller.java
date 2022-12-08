package write.controller;


import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tag.model.Post_tagBean;
import tag.model.TagBean;
import tag.model.TagDao;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
@ComponentScan({"write.*","tag.*"}) /* jh */
public class Insert_Controller {
	
	final String command = "insert.wr";
	final String getPage = "redirect:home.wr";
	
	@Autowired
	ServletContext application;
	
	@Autowired
	WriteDao wdao;
	
	@Autowired /* jh */
   	TagDao tagDao;
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String insert(@RequestParam(required=false) MultipartFile[] Insert_images, @RequestParam(required=false) MultipartFile Insert_video,
			WriteBean wb, Model model, @RequestParam(required = false) String rdTag /* jh */) {
		//이미지 and 비디오 업로드
		System.out.println(rdTag);
		if(Insert_images != null) {
				
			for(MultipartFile multipartFile : Insert_images) {
				
				String uploadFolder = application.getRealPath("/resources/assets/images/upload");
				
				String uploadFileName = multipartFile.getOriginalFilename();
	
				System.out.println("uploadFileName:"+uploadFileName);
				
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				
				File saveFile = new File(uploadFolder, uploadFileName);
				
				try {
					multipartFile.transferTo(saveFile);
				} catch (Exception e) {
					/* log.error(e.getMessage()); */
				} 
			}
			
			System.out.println("imgg:"+wb.getImage());
	
			String names = "";
			
			for(MultipartFile multipartFile : Insert_images) {
				for(int i=0;i<Insert_images.length; i++) {
					System.out.println(multipartFile.getOriginalFilename());
					names += multipartFile.getOriginalFilename();
					System.out.println("i:"+i);
					if(i+1 != Insert_images.length) { 
						names += ","; //몰라
						break;
					}
				}
			}
			
			wb.setImage(names);
		}
		
	
		if(Insert_video != null) {
				String uploadFolder = application.getRealPath("/resources/assets/images/video");
				
				String uploadFileName = Insert_video.getOriginalFilename();
				
				System.out.println("vuploadFileName:"+uploadFileName);
				
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);

				File saveFile = new File(uploadFolder, uploadFileName);
				
				try {
					Insert_video.transferTo(saveFile);
				} catch (Exception e) {
					/* log.error(e.getMessage()); */
				}	
			
				System.out.println(Insert_video.getOriginalFilename());
				String vnames = Insert_video.getOriginalFilename();
				wb.setVideo(vnames);
					
				}
		System.out.println("getImage:"+wb.getImage());
		System.out.println("contents:"+wb.getContents());
		System.out.println("no:"+wb.getNo());
		System.out.println("scope:"+wb.getScope());
		System.out.println("loca:"+wb.getLocation());
		System.out.println("ftag:"+wb.getF_tag());
		System.out.println("video:"+wb.getVideo());
		System.out.println("location:"+wb.getLocation());
		System.out.println("address:"+wb.getAddress());
		

		wdao.insertWrite(wb);
		
		/* jh */
	      if(rdTag != null && !rdTag.equals("")) {
	         System.out.println("rdTag : "+rdTag);
	         String[] tagContent = rdTag.split(",");
	         
	          for(int i=0;i<tagContent.length;i++) {
	             //tag insert
	             int cnt = tagDao.getTagCount(tagContent[i]);
	             if(cnt == 0) {
	                tagDao.insertTag(tagContent[i]);
	             }
	             
	             if(rdTag != null && rdTag != "" && rdTag != " ") {
	                //get tag bean
	                TagBean tb = new TagBean();
	                tb = tagDao.getTagBean(tagContent[i]);
	                
	                //post_tag insert
	                String wno = wdao.getMaxWno(wb.getNo());
	                System.out.println(wno);
	                System.out.println(tb.getTag_id());
	                Post_tagBean pt = new Post_tagBean(wno,tb.getTag_id());
	                tagDao.insertPostTag(pt);
	             }
	          }
	      }
	      /* jh */
		return getPage;
	}
	
	
}
