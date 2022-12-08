package member.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class MemberBean {
	private String no;
	@NotBlank(message = "이메일이 누락되었습니다.")
	private String email;
	@Pattern(regexp = "^[a-zA-Z1-9]{4,10}$", message = "비밀번호는 4~10자 영문 대 소문자, 숫자를 사용하세요.")
	private String password;
	@NotBlank(message = "이름이 누락되었습니다.")
	private String name;
	@NotBlank(message = "생년월일이 누락되었습니다.")
	private String b_date;
	private String gender;
	@NotBlank(message = "핸드폰번호가 누락되었습니다.")
	private String hp1;
	@NotBlank(message = "핸드폰번호가 누락되었습니다.")
	private String hp2;
	@NotBlank(message = "핸드폰번호가 누락되었습니다.")
	private String hp3;
	@NotBlank(message = "주소가 누락되었습니다.")
	private String addr1;
	@NotBlank(message = "주소가 누락되었습니다.")
	private String addr2;
	@NotBlank(message = "주소가 누락되었습니다.")
	private String addr3;

	private String reg_date;
	private String unreg_date;
	private String profile;
	private String background;
	private String deactivate;
	private String social;
	private String save;
	private String business;
	private String business_no;
	private String intro;

	// 사진 등록
	private MultipartFile uploadProfile;
	private MultipartFile uploadBackground;

	private int cnt; // 개수

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getBusiness_no() {
		return business_no;
	}

	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUnreg_date() {
		return unreg_date;
	}

	public void setUnreg_date(String unreg_date) {
		this.unreg_date = unreg_date;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getDeactivate() {
		return deactivate;
	}

	public void setDeactivate(String deactivate) {
		this.deactivate = deactivate;
	}

	public String getSocial() {
		return social;
	}

	public void setSocial(String social) {
		this.social = social;
	}

	public String getSave() {
		return save;
	}

	public void setSave(String save) {
		this.save = save;
	}

	// 사진등록
	public MultipartFile getUploadProfile() {
		return uploadProfile;
	}

	public void setUploadProfile(MultipartFile uploadProfile) {
		this.uploadProfile = uploadProfile;
		this.profile = uploadProfile.getOriginalFilename();
	}

	public MultipartFile getUploadBackground() {
		return uploadBackground;
	}

	public void setUploadBackground(MultipartFile uploadBackground) {
		this.uploadBackground = uploadBackground;
		this.background = uploadBackground.getOriginalFilename();
	}

	//개수
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
