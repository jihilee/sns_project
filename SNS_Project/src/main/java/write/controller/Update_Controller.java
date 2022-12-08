package write.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tag.model.Post_tagBean;
import tag.model.TagBean;
import tag.model.TagDao;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
@ComponentScan({"write.*","tag.*"}) /* jh */
public class Update_Controller {
	final String command1 = "likes.wr";
	final String command2 = "update.wr";
	final String command3 = "minusLikes.wr";
	String goToPage="redirect:home.wr";
	
	@Autowired
	WriteDao wdao;
	
	@Autowired /* jh */
	   TagDao tagDao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping(value=command1, method = RequestMethod.GET)
	@ResponseBody
	public String heart(@RequestParam String wno, @RequestParam String no) {
		System.out.println("plus wno="+wno);
		System.out.println("no="+no);
		
		Map<String,String>map = new HashMap<String,String>();
		map.put("no", no);
		map.put("wno", wno);
		
		wdao.insertLikes(map);
		
		wdao.updateLikes(wno);
		
		int likes = wdao.getLikes(wno);
		
		
		return String.valueOf(likes);
	}
	
	@RequestMapping(value=command3, method = RequestMethod.GET)
	@ResponseBody
	public String minusLikes(@RequestParam String wno, @RequestParam String no) {
		System.out.println("minus wno="+wno);
		System.out.println("minus no="+no);
		
		Map<String,String>map = new HashMap<String,String>();
		map.put("no", no);
		map.put("wno", wno);
		
		wdao.deleteLikes(map);
		
		wdao.minusUpdateLikes(wno);
		
		int likes = wdao.getLikes(wno);
		
		return String.valueOf(likes);
	}
	
	
	@RequestMapping(value=command2, method = RequestMethod.GET, produces="application/json; charset=utf8")
	public @ResponseBody Map <String,String> update(String wno) {
		
		Map<String,String> map = new HashMap<String,String>();
		System.out.println("wno:"+wno);
		WriteBean wb = wdao.getByWnoForUpdate(wno);
		String upload_date = wb.getUpload_date().format(wb.getUpload_date(), "yyyy-MM-dd HH:mm");
		if(wb.getImage() != null) {
				
			String imgArr[] = wb.getImage().split(",");
			for(int i=0;i<imgArr.length;i++) {
				System.out.println("img"+(i+1)+":"+imgArr[i]);
				map.put("img"+(i+1),imgArr[i]);
			}
		}
		/* jh hashtag */
	      List<Post_tagBean> ptList = new ArrayList<Post_tagBean>();
	      ptList = tagDao.getPostNameByWno(wb.getWno());
	      System.out.println(ptList.size());
	      if(ptList!=null) {
	         for(int i=0;i<ptList.size();i++) { 
	            map.put("tag"+(i+1), ptList.get(i).getTag_name());
	            //System.out.println("tag"+(i+1));
	            //System.out.println(ptList.get(i).getTag_name());
	         }
	      }
	      /* end jh hashtag */
		
		map.put("wno", String.valueOf(wb.getWno()));
		map.put("no", String.valueOf(wb.getNo()));
		map.put("contents", wb.getContents());
		map.put("video", wb.getVideo()); //String
		map.put("image", wb.getImage()); //String
		map.put("scope", wb.getScope());
		map.put("upload_date", upload_date);
		map.put("location", wb.getLocation());
		map.put("address", wb.getAddress());
		map.put("f_tag", wb.getF_tag());
		map.put("likes", String.valueOf(wb.getLikes()));
		
		System.out.println(map.get("wno"));
		System.out.println(map.get("contents"));
		
		return map;
	}
	
	@RequestMapping(value=command2, method = RequestMethod.POST)
	public String update(@RequestParam(required=false) MultipartFile[] uimage, @RequestParam(required=false) MultipartFile[] uvideo, 
						@RequestParam(required=false) String beforeImage,@RequestParam(required=false) String beforeVideo, 
						@RequestParam(required=false) String location, @RequestParam(required=false) String address,
						WriteBean wb,@RequestParam(value="up_rdTag", required = false) String up_rdTag /* jh */) {
		
		System.out.println("post");
		System.out.println("no:"+wb.getNo());
		System.out.println("wno:"+wb.getWno());
		System.out.println("beforeImage:"+beforeImage);
		System.out.println("beforeVideo:"+beforeVideo);
		// 씠誘몄  and 鍮꾨뵒 삤  뾽濡쒕뱶
		
				if(uimage != null) {
						
					for(MultipartFile multipartFile : uimage) {
						
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
					
					for(MultipartFile multipartFile : uimage) {
						for(int i=0;i<uimage.length; i++) {
							System.out.println(multipartFile.getOriginalFilename());
							names += multipartFile.getOriginalFilename();
							System.out.println("i:"+i);
							if(i+1 != uimage.length) { 
								names += ","; //紐곕씪
								break;
							}
						}
					}
					
					wb.setImage(names);
				}
				
			
				if(uvideo != null) {
					for(MultipartFile multipartFile : uvideo) {
						String uploadFolder = application.getRealPath("/resources/assets/images/video");
						
						String uploadFileName = multipartFile.getOriginalFilename();
						
						System.out.println("vuploadFileName:"+uploadFileName);
						
						uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);

						File saveFile = new File(uploadFolder, uploadFileName);
						
						try {
							multipartFile.transferTo(saveFile);
						} catch (Exception e) {
							/* log.error(e.getMessage()); */
						} 
					}
					
					String vnames = "";
					
					for(MultipartFile multipartFile : uvideo) {
						for(int i=0;i<uvideo.length; i++) {
							System.out.println(multipartFile.getOriginalFilename());
							vnames += multipartFile.getOriginalFilename();
							System.out.println("i:"+i);
							if(i+1 != uvideo.length) { 
								vnames += ","; //紐곕씪
								break;
							}
						}
					}
					
					wb.setVideo(vnames);
				}
					//upload end
				
				wdao.updateWrite(wb);
				
					
					//delete start
					if(beforeImage == null || beforeImage == "" ) {
						beforeImage = "Null";
					}
					if(beforeVideo == null || beforeVideo == "" ) {
						beforeVideo = "Null";
					}
					
					
					if(!beforeImage.equals("Null")) {
						String url = application.getRealPath("/resources/assets/images/upload");
						
						String[] images = beforeImage.split(",");
						for(String name : images) {
							System.out.println("name:"+name);
							/*
							name: 궎留 .jpg
							name: 빖 뱶 룿耳  씠 뒪.jpg
							name: 솃 럹 씠吏  濡쒓퀬.jpg
							name: 쉶 궗 냼媛 .png
							*/
							File file = new File(url,name);
							if(file.exists()) {
								file.delete();
							}
						}
					}
					else if(!beforeVideo.equals("Null")) {
						String url = application.getRealPath("/resources/assets/images/video");
						
						String[] videos = beforeVideo.split(",");
						for(String vname : videos) {
							System.out.println("vname:"+vname);
							
							File file = new File(url,vname);
							if(file.exists()) {
								file.delete();
							}
						}
					}
					
					 //post_tag reset
	                  System.out.println("wb.getWno() : "+wb.getWno());
	                  tagDao.resetTag(wb.getWno());
					
					/* jh update */
		               if(up_rdTag != null && !up_rdTag.equals("")) {
		                  System.out.println("up_rdTag : --------------------------"+up_rdTag);
		                  String[] tagContent = up_rdTag.split(",");

		                  TagBean tb = new TagBean();
		                  
		                 
		                   
		                  for(int i=0;i<tagContent.length;i++) {
		                      //new tag insert
		                      int cnt = tagDao.getTagCount(tagContent[i]);
		                      if(cnt == 0) {
		                         tagDao.insertTag(tagContent[i]);
		                      }
		                      
		                      //get tag bean
		                      tb = tagDao.getTagBean(tagContent[i]);
		                      
		                     //post_tag update
		                      Post_tagBean pt = new Post_tagBean(wb.getWno(),tb.getTag_id());
		                      tagDao.insertPostTag(pt);
		                   }
		               }
		               /* endjh update */      

		return goToPage;
	}
	
}
