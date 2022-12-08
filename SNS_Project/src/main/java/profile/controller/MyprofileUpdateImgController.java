package profile.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MyprofileUpdateImgController {

	private final String command = "/updateImage.pro";
	private String gotoPage = "redirect:/myprofile.pro";

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private ServletContext application;


	@RequestMapping(value = command, method = RequestMethod.GET)
	public String form(@RequestParam("img") String img) {

		if(img.equals("background")) {
			return "/updateBackgroundForm"; 
		}else { //profile
			return "/updateProfileForm";
		}

		//return gotoPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String update(MemberBean member) {

		if(member.getName().equals("background")) { //background

			//기존 사진삭제
			MemberBean memberBean = memberDao.getMemberByNo(member.getNo());
			String path = application.getRealPath("/resources/assets/images/members");
			File delFile = new File(path+"/"+memberBean.getBackground());
			delFile.delete();

			//DB 등록
			memberDao.updateBackground(member);

			//사진 저장
			MultipartFile multi = member.getUploadBackground();
			File file = new File(path+"/"+multi.getOriginalFilename());

			try {
				multi.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}else { //profile

			//기존 사진삭제
			MemberBean memberBean = memberDao.getMemberByNo(member.getNo());
			String path = application.getRealPath("/resources/assets/images/members");

			if(!memberBean.getProfile().equals("profile.png")) { //기본 이미지는 삭제 금지
				File delFile = new File(path+"/"+memberBean.getProfile());
				delFile.delete();
			}

			//DB 등록
			memberDao.updateProfile(member);

			//사진 저장
			MultipartFile multi = member.getUploadProfile();
			File file = new File(path+"/"+multi.getOriginalFilename());

			try {
				multi.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return gotoPage;
	}

}
