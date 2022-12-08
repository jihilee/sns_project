package write.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import write.model.CommentsBean;
import write.model.WriteBean;
import write.model.WriteDao;

@Controller
public class DetailPostController {

	private final String detail="detail.wr";
	private final String comment="comment.wr";
	private final String contents="detailPost_img_video.wr";
	private final String check_Likes="check_Likes.wr";
	private final String detail_plusLike="detail_plusLike.wr";
	private final String detail_cancleLike="detail_cancleLike.wr";
	private final String deleteComment="deleteComment.wr";
	private final String updateComment="updateComment.wr";
	private final String replyComment="replyComment.wr";
	private final String select_re_step="select_re_step.wr";
	private final String re_step_list="re_step_list.wr";
	
	@Autowired
	private WriteDao wdao ;
	
	@RequestMapping(value=detail, method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody List<WriteBean> detailPost(@RequestParam("wno") int wno,
							HttpServletResponse response,HttpSession session) throws IOException {
		MemberBean mb = (MemberBean)session.getAttribute("login");
		WriteBean wb = new WriteBean();
		wb.setMno(mb.getNo());
		wb.setWno(String.valueOf(wno));
		List<WriteBean> lists = wdao.select_OneComment(wb);
		return lists;
	}
	
	@RequestMapping(comment)
	public void home(@RequestParam("wno") int wno,
			@RequestParam("contents") String contents,
			Model model,HttpServletResponse response,HttpSession session) throws IOException {

		CommentsBean cb = new CommentsBean();
		MemberBean mb = (MemberBean)session.getAttribute("login");
		cb.setMno(Integer.parseInt(mb.getNo()));//session설정한 mno 넣기
		cb.setWno(wno);
		cb.setC_contents(contents);

		System.out.println(cb.getMno());
		System.out.println(cb.getWno());
		System.out.println(cb.getC_contents());

		//댓글쓰기
		wdao.insert_Comments(cb);

		//최근 댓글 번호 가져오기
		int maxnum = wdao.select_newCommentNum();
		
		//최근 댓글 가져오기
		CommentsBean list = wdao.select_newComment(maxnum);

		String str=list.getWno()+","+list.getC_contents()+","+list.getC_upload_date()+","+list.getName()+","+list.getCno()+","+list.getRef()+","+list.getRe_level()+","+list.getRe_step();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.print(str);
		writer.flush();

	}
	
	@RequestMapping(value=contents,produces="application/json; charset=utf8")
	public @ResponseBody Map<String,String> contents(@RequestParam("wno") int wno,
			HttpServletResponse response) throws IOException {
		System.out.println("contents Controller 진입");
		
		Map<String,String> map = new HashMap<String,String>();
		
		WriteBean list = wdao.select_OneWrite_ByWno(wno);
		if(list.getImage()!=null) {
			
			System.out.println("list.img : "+list.getImage());
			String imgArr[] = list.getImage().split(",");
			System.out.println("imgArr.length : "+imgArr.length);
			for(int i=0;i<imgArr.length;i++) {
				System.out.println("i : "+i);
				System.out.println("imgArr["+(i+1)+"] : "+imgArr[i]);
				map.put("img"+(i+1), imgArr[i]);
			}
		}
			
		map.put("contents", ((WriteBean) list).getContents());
		map.put("video", ((WriteBean) list).getVideo());
		map.put("name", list.getName());
		map.put("location", list.getLocation());
		map.put("f_tag", list.getF_tag());
		map.put("profile", list.getProfile());

		
		return map;
	}
	
	@RequestMapping(value=check_Likes,produces="application/json; charset=utf8")
	public void check_Likes(@RequestParam("cno") String cno,
							@RequestParam("wno") String wno,
			HttpServletResponse response,HttpSession session) throws IOException {
		
		MemberBean mb = (MemberBean) session.getAttribute("login");
		WriteBean wb = new WriteBean();
		wb.setCno(cno);
		wb.setWno(wno);
		wb.setNo(Integer.parseInt(mb.getNo()));
		
		String likes_no = String.valueOf(wdao.check_Likes_ByCno(wb));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(likes_no);
		writer.flush();
		
	}
	
	@RequestMapping(value=detail_plusLike,produces="application/json; charset=utf8")
	public void detail_plusLike(@RequestParam("cno") String cno,
							@RequestParam("wno") String wno,
			HttpServletResponse response,HttpSession session) throws IOException {
		
		MemberBean mb = (MemberBean) session.getAttribute("login");
		WriteBean wb = new WriteBean();
		wb.setCno(cno);
		wb.setWno(wno);
		wb.setNo(Integer.parseInt(mb.getNo()));
		
		String result = String.valueOf(wdao.detail_plusLike(wb));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(result);
		writer.flush();
		
	}
	
	@RequestMapping(value=detail_cancleLike,produces="application/json; charset=utf8")
	public void detail_cancleLike(@RequestParam("cno") String cno,
							@RequestParam("wno") String wno,
			HttpServletResponse response,HttpSession session) throws IOException {
		
		MemberBean mb = (MemberBean) session.getAttribute("login");
		WriteBean wb = new WriteBean();
		wb.setCno(cno);
		wb.setWno(wno);
		wb.setNo(Integer.parseInt(mb.getNo()));
		
		String result = String.valueOf(wdao.detail_cancleLike(wb));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(result);
		writer.flush();
		
	}
	
	@RequestMapping(value=deleteComment,produces="application/json; charset=utf8")
	public void deleteComment(@RequestParam("cno") int cno,
							@RequestParam("wno") int wno,
							HttpServletResponse response)throws IOException {

		//댓글 지우기
		wdao.deleteComment_ByCno(cno);
		
		int str=wno;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(str);
		writer.flush();
		
	}
	
	@RequestMapping(value=updateComment,produces="application/json; charset=utf8")
	public void updateComment(@RequestParam("cno") int cno,
							  @RequestParam("wno") int wno,
							  @RequestParam("contents") String c_contents,
							  HttpServletResponse response) throws IOException {
		CommentsBean cb = new CommentsBean();
		cb.setCno(cno);
		cb.setWno(wno);
		cb.setC_contents(c_contents);
		
		wdao.updateComment_ByCno(cb);
		
		int str = wno;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(str);
		writer.flush();
		
	}
	
	@RequestMapping(value=replyComment,produces="application/json; charset=utf8")
	public void updateComment(@RequestParam("wno") int wno,
							  @RequestParam("ref") int ref,
							  @RequestParam("re_step") int re_step,
							  @RequestParam("re_level") int re_level,
							  @RequestParam("c_contents") String c_contents,
							  HttpServletResponse response,HttpSession session) throws IOException {
		System.out.println("updateComment Controller 진입");
		
		MemberBean mb = (MemberBean)session.getAttribute("login");
		CommentsBean cb = new CommentsBean();
		cb.setWno(wno);
		cb.setMno(Integer.parseInt(mb.getNo()));
		//cb.setMno(cb.getMno());
		cb.setRef(ref);
		cb.setRe_level(re_level);
		cb.setRe_step(re_step);
		cb.setC_contents(c_contents);
		System.out.println("updatecomment Controller(ref) : "+cb.getRef());
		//re_step +1 하기
		wdao.update_Restep(cb);
		
		//최종 답답글 쓰기
		wdao.insertReplyComment(cb);
		
		//최근 댓글 번호 가져오기
		int maxnum = wdao.select_newCommentNum();
		System.out.println("maxnum : "+maxnum);
		//최근 댓글 가져오기
		CommentsBean list = wdao.select_newComment(maxnum);

		String str=list.getWno()+","+list.getC_contents()+","+list.getC_upload_date()+","+list.getName()+","+list.getCno()+","+list.getRef()+","+list.getRe_level()+","+list.getRe_step();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(str);
		writer.flush();
		
	}
	
	@RequestMapping(value=select_re_step,produces="application/json; charset=utf8")
	public void select_re_step(@RequestParam("cno") int cno,
								HttpServletResponse response) throws IOException {
		
		int re_step = wdao.select_re_step(cno);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(re_step);
		writer.flush();
	}
	
	@RequestMapping(value=re_step_list,produces="application/json; charset=utf8")
	public @ResponseBody List<CommentsBean> re_step_list(@RequestParam("cno") int cno,
			HttpServletResponse response) throws IOException {
		
		List<CommentsBean> lists = wdao.select_List_re_step(cno);
		
		return lists;
	}
}
