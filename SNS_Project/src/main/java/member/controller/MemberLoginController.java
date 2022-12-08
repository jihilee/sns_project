package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import admin.model.VisiterDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {

	private final String command = "/login.mem";
	private String getPage = "/login";
	private String gotoPage2 = "redirect:/bnprofile.pro";
	private String gotoPage = "redirect:/home.wr";

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private VisiterDao visiterDao;

	// 카카오 로그인
	private String apiResult = null;
	@Autowired
	private KakaoLoginBO kakaoLoginBO;

	//login.jsp 페이지 호출
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {

		// 혜린 처음에 로그인창에서 방문자수 넣기
		boolean sysdate_visiter = visiterDao.sysdateVisiter();
		if (sysdate_visiter == false) { // 없으면
			System.out.println("insert");
			// 방문자수 insert
			String[] age = { "~19", "20~29", "30~39", "40~49", "50~", "all" };
			for (String a : age) {
				visiterDao.insertVisiter(a);
			}
		}
		
		/* 카카오 URL */
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		System.out.println("카카오:" + kakaoAuthUrl);		
		model.addAttribute("urlKakao", kakaoAuthUrl);

		return getPage;
	}

	//login.jsp -> 로그인
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String login(MemberBean member,
			HttpServletResponse response,
			HttpSession session) throws IOException {

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");

		int result = memberDao.emailDuplCheck(member.getEmail());
		if(result == 1) { //가입한 회원인 경우
			MemberBean login = memberDao.login(member);

			if(login == null) { //이메일과 비밀번호가 일치하지 않은 경우
				//System.out.println("login "+login);
				pw.println("<script>");
				pw.println("alert('비밀번호가 일치하지 않습니다.'); location.href='login.mem'");
				pw.println("</script>");
				pw.flush();

			}else { //이메일과 비밀번호가 일치하는 경우 => 로그인
				
				if (Integer.valueOf(login.getBusiness()) == 1) {
					session.setAttribute("login", login);
					session.setMaxInactiveInterval(60*60) ; //은정 비즈니스 로그인 이동
					return gotoPage2;
					
				}else {
					session.setAttribute("login", login);
					session.setMaxInactiveInterval(60*60) ; //가영 로그인 유지시간 설정.
				}

				//혜린 관리자일때 관리자홈페이지로 가도록 설정
				if(login.getEmail().equals("admin")) {
					return "redirect:/index.ad";
				}

				//String destination = (String)session.getAttribute("destination");
				//return destination;

				/* 로그인이 필요한 페이지에 설정할 코드
				if(session.getAttribute("login") == null) { //로그인 안했으면

					session.setAttribute("destination", "redirect:/"); //로그인 한 후 향할 주소도 같이 설정해 보냄
					return "redirect:/login.mem";

				}else {

				}
				 */

				//혜린 로그인할때 방문자수 업데이트 (+1씩 증가)
				visiterDao.updateAllVisiter();
				String[] birth = login.getB_date().split("-");
				int birth_year = Integer.valueOf(birth[0]);
				System.out.println("birth_year:"+birth_year);

				//오늘 날짜
				Date now = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				int year = Integer.valueOf(sdf.format(now));
				System.out.println("year:"+year);

				int member_age = year - birth_year;
				System.out.println("member_age:"+member_age);
				String age = "";
				if(member_age < 20) {
					age = "~19";
				} else if(member_age < 30) {
					age = "20~29";
				} else if(member_age < 40) {
					age = "30~39";
				} else if(member_age < 50) {
					age = "40~49";
				} else {
					age = "50~";
				}
				visiterDao.updateAgeVisiter(age);

			}

		}else { //가입하지 않은 회원인 경우
			pw.println("<script>");
			pw.println("alert('가입하지 않은 회원입니다'); location.href='login.mem'");
			pw.println("</script>");
			pw.flush();
		}

		return gotoPage;
	}
	
	// 카카오 로그인 성공시 callback
		@RequestMapping(value = "/callbackKakao.mem", method = { RequestMethod.GET, RequestMethod.POST })
		public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) 
				throws Exception {
			System.out.println("로그인 성공 callbackKako");
			OAuth2AccessToken oauthToken;
			oauthToken = kakaoLoginBO.getAccessToken(session, code, state);	
			// 로그인 사용자 정보를 읽어온다
			apiResult = kakaoLoginBO.getUserProfile(oauthToken);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj;

			jsonObj = (JSONObject) jsonParser.parse(apiResult);
			System.out.println("jsonObj"+jsonObj); //json 정보
			
			JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");	
			JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
			// 프로필 조회
			String email = (String) response_obj.get("email");
			String birthday = (String) response_obj.get("birthday");
			String age_range = (String) response_obj.get("age_range");
			String name = (String) response_obj2.get("nickname");

			
			// 세션에 사용자 정보 등록
			// session.setAttribute("islogin_r", "Y");
			session.setAttribute("signIn", apiResult);
			//session.setAttribute("email", email);
			//session.setAttribute("name", name);
			
			System.out.println("birthday "+birthday); //0919
			System.out.println("age_range "+age_range); //30~39

			
			// 처음 로그인 한다면 사용자 정보 DB에 인서트
			if(memberDao.emailDuplCheck(email) == 0) {
				MemberBean member = new MemberBean();
				member.setEmail(email);
				member.setName(name);
				member.setSocial("kakao");
				memberDao.registerMemberBySocial(member);
			}
			
			MemberBean member = memberDao.getMemberByEmail(email);
			session.setAttribute("login", member);

			return "redirect:/loginSuccess.mem";
		}

		// 소셜 로그인 성공 페이지
		@RequestMapping("/loginSuccess.mem")
		public String loginSuccess() {
			return "/loginSuccess";
		}

}
