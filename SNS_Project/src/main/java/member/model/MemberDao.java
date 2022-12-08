package member.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import admin.model.LeaveBean;
import admin.model.SubscriberBean;
import write.model.WriteBean;

@Component("memberDao")
public class MemberDao {

	private String namespace = "member.model.MemberDao";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 회원가입
	public void registerMember(MemberBean member) {
		sqlSessionTemplate.insert(namespace + ".RegisterMember", member);

	}

	public int emailDuplCheck(String inputemail) {
		int result = sqlSessionTemplate.selectOne(namespace + ".EmailDuplCheck", inputemail);
		return result;
	}

	// 회원리스트
	public List<MemberBean> getAllMembers() {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllMembers");
		return lists;
	}

	public void deleteMember(String no) {
		sqlSessionTemplate.delete(namespace + ".DeleteMember", no);

	}

	// 로그인
	public MemberBean login(MemberBean member) {
		MemberBean login = sqlSessionTemplate.selectOne(namespace + ".Login", member);
		return login;
	}

	// 마이프로필
	public void updateBackground(MemberBean member) {
		sqlSessionTemplate.update(namespace + ".UpdateBackground", member);

	}

	public void updateProfile(MemberBean member) {
		sqlSessionTemplate.update(namespace + ".UpdateProfile", member);

	}

	public MemberBean getMemberByNo(String no) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace + ".GetMemberByNo", no);
		return member;
	}

	// 회원정보 수정
	public int checkEmailPassword(MemberBean member) {
		int result = sqlSessionTemplate.selectOne(namespace + ".CheckEmailPassword", member);
		return result;
	}

	public int modifyMember(MemberBean member) {
		int result = sqlSessionTemplate.update(namespace + ".ModifyMember", member);
		return result;

	}

	public int deactivateMember(MemberBean member) {
		int result = sqlSessionTemplate.update(namespace + ".DeactivateMember", member);
		return result;
	}

	public int deleteMember(MemberBean member) {
		int result = sqlSessionTemplate.delete(namespace + ".DeleteMember", member);
		return result;
	}

	public void updateIntro(MemberBean member) {
		sqlSessionTemplate.update(namespace + ".UpdateIntro", member);

	}

	// 북마크
	public List<WriteBean> select_BookMarks(String no) {
		List<WriteBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_BookMarks", no);

		return lists;
	}

	// 내가 쓴 글 모음
	public List<WriteBean> select_MyWrite(String no) {
		List<WriteBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_MyWrite", no);
		return lists;
	}

	public List<WriteBean> select_mywrite_public(String no) {
		List<WriteBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_mywrite_public", no);
		return lists;
	}

	// 통계 : 월별 가입자수 (성별로)
	public List<SubscriberBean> monthlyGender(String date) {
		List<SubscriberBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".MonthlyGender", date);
		return list;
	}

	// 활성화,비활성화 회원리스트
	public List<MemberBean> getMembersByDeactivate(String deactivate) {
		List<MemberBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".GetMembersByDeactivate", deactivate);
		return list;
	}

	// 탈퇴한 회원리스트
	public List<LeaveBean> getLeaveMembers() {
		List<LeaveBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".GetLeaveMembers");
		return list;
	}

	// 가입자수
	public int todayMember() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TodayMember");
		return cnt;
	}

	public int totalMember() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TotalMember");
		return cnt;
	}

	// 탈퇴자수
	public int todayLeave() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TodayLeave");
		return cnt;
	}

	public int totalLeave() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TotalLeave");
		return cnt;
	}

	// 가입자수 관련 그래프
	public List<MemberBean> yearMonthMember(String date) {
		List<MemberBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".YearMonthMember", date);
		return list;
	}

	// 가입자수 (성별)
	public List<MemberBean> totalGenderMember() {
		List<MemberBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".TotalGenderMember");
		return list;
	}

	// 어제 가입자수
	public int yesterdayMember(String yesterday) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".YesterdayMember", yesterday);
		return cnt;
	}

	// 이번달 최저가입자수, 최고가입자수
	public int minMember() {
		int min = sqlSessionTemplate.selectOne(namespace + ".MinMember");
		return min;
	}

	public int maxMember() {
		int max = sqlSessionTemplate.selectOne(namespace + ".MaxMember");
		return max;
	}

	// 오늘 여성, 남성 가입자수
	public int genderMember(String gender) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".GenderMember", gender);
		return cnt;
	}

	// 탈퇴자수 관련 그래프
	public List<LeaveBean> yearMonthLeaver(String date) {
		List<LeaveBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".YearMonthLeaver", date);
		return list;
	}

	// 어제 가입자수
	public int yesterdayLeave(String yesterday) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".YesterdayLeave", yesterday);
		return cnt;
	}

	// 이번달 최저탈퇴자수, 최고탈퇴자수
	public int minLeaver() {
		int min = sqlSessionTemplate.selectOne(namespace + ".MinLeaver");
		return min;
	}

	public int maxLeaver() {
		int max = sqlSessionTemplate.selectOne(namespace + ".MaxLeaver");
		return max;
	}

	//카카오 가입자수
	public int kakaoMember() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".KakaoMember");
		return cnt;
	}


	//11/21 박이랑
	// 소셜 로그인
	public void registerMemberBySocial(MemberBean member) {
		sqlSessionTemplate.insert(namespace+".RegisterMemberBySocial", member);

	}

	public MemberBean getMemberByEmail(String email) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+".GetMemberByEmail", email);
		return member;
	}

	//아이디 비번 찾기
	public void updatePassword(MemberBean member) {
		sqlSessionTemplate.update(namespace+".UpdatePassword", member);

	}

	public MemberBean findId(MemberBean member) {
		MemberBean bean = sqlSessionTemplate.selectOne(namespace+".FindId", member);
		return bean;
	}

	public MemberBean findPassword(MemberBean member) {
		MemberBean bean = sqlSessionTemplate.selectOne(namespace+".FindPassword", member);
		return bean;
	}

	//탈퇴회원 추가
	public void insertLeave(LeaveBean lb) {
		sqlSessionTemplate.insert(namespace+".InsertLeave", lb);
		
	}

}
