package write.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class BuisnessWriteController {
	
	private final String command="bnwrite.wr";
	private final String getPage="redirect:/bnprofile.pro";
	private final String returnpage="redirect:/bnprofile.pro";
	
	@Autowired
	ServletContext application;

	@Autowired
	private WriteDao wdao;
	
	
	//폼 글작성 버튼 클릭했을때
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String bnwriteGO(@RequestParam(required=false) MultipartFile[] Insert_images, @RequestParam(required=false) MultipartFile Insert_video,WriteBean wb, Model model) {
		if(wb.getContents().length()==0) {
			return returnpage;
		}
	
		
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
		

		 wdao.insertBNwrite(wb);
		 model.addAttribute("wb",wb);
		
		return getPage;
	}
	






	
	
}
