package write.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import friend.model.FriendBean;
import member.model.MemberBean;

@Component("myWrite")
public class WriteDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace = "write.model.Write";

	// 메인 피드 게시글 불러오기
	public List<WriteBean> select_AllWrite() {

		List<WriteBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_AllWrite");

		return lists;
	}

	// 메인 피드 게시글 댓글 2개
	public List<CommentsBean> select_comments(String wno) {

		List<CommentsBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_comments", wno);

		return lists;
	}

	// 메인 피드 게시글 답글 달기
	public void insert_Comments(CommentsBean comments) {

		sqlSessionTemplate.insert(namespace + ".Insert_Comments", comments);

	}

	public int select_newCommentNum() {

		int maxnum = sqlSessionTemplate.selectOne(namespace + ".Select_newCommentNum");

		return maxnum;
	}

	public CommentsBean select_newComment(int cno) {

		CommentsBean cb = sqlSessionTemplate.selectOne(namespace + ".Select_newComment", cno);

		return cb;
	}

	// 댓글
	public List<WriteBean> select_OneComment(WriteBean wb) {

		List<WriteBean> list = sqlSessionTemplate.selectList(namespace + ".Select_OneComment", wb);

		return list;
	}

	// 이미지,동영성,내용
	public WriteBean select_OneWrite_ByWno(int wno) {

		WriteBean list = sqlSessionTemplate.selectOne(namespace + ".Select_OneWrite_ByWno", wno);
		return list;
	}

	// detailPost
	public void deleteComment_ByCno(int cno) {

		sqlSessionTemplate.delete(namespace + ".DeleteComment_ByCno", cno);
	}

	public void updateComment_ByCno(CommentsBean cb) {

		sqlSessionTemplate.update(namespace + ".UpdateComment_ByCno", cb);

	}

	public void update_Restep(CommentsBean cb) {
		int cnt = sqlSessionTemplate.update(namespace + ".Update_Restep", cb);
		System.out.println("update_Restep : " + cnt);
	}

	public void insertReplyComment(CommentsBean cb) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertReplyComment", cb);
		System.out.println("insertReplyComment : " + cnt);
	}

	public int select_re_step(int cno) {
		int re_step = sqlSessionTemplate.selectOne(namespace + ".Select_re_step", cno);

		return re_step;
	}

	public List<CommentsBean> select_List_re_step(int cno) {
		List<CommentsBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_List_re_step", cno);

		return lists;
	}

	public int check_Likes_ByCno(WriteBean wb) {// 댓글 좋아요

		int likes_no = sqlSessionTemplate.selectOne(namespace + ".Check_Likes_ByCno", wb);
		return likes_no;
	}

	public int detail_plusLike(WriteBean wb) {
		int result = sqlSessionTemplate.insert(namespace + ".Detail_plusLike", wb);
		return result;
	}

	public int detail_cancleLike(WriteBean wb) {
		int result = sqlSessionTemplate.delete(namespace + ".Detail_cancleLike", wb);
		return result;
	}

	// 게시글 작성
	// 가영님
	public void insertWrite(WriteBean wb) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertWrite", wb);
		System.out.println("insert:" + cnt);
	}

	public List<WriteBean> getTimeLineByMemberNo(Map<String, String> tagmap1) {
		List<WriteBean> lists = sqlSessionTemplate.selectList(namespace + ".GetTimeLineByMemberNo", tagmap1);
		return lists;
	}

	public void delateByWno(String wno) {
		int cnt = sqlSessionTemplate.delete(namespace + ".DelateByWno", wno);
		System.out.println("deleteByWno:" + cnt);
	}

	public void updateLikes(String wno) {
		int cnt = sqlSessionTemplate.update(namespace + ".UpdateLikes", wno);
		System.out.println("updateLikes=" + cnt);

	}

	public WriteBean getByWnoForUpdate(String wno) {
		WriteBean wb = sqlSessionTemplate.selectOne(namespace + ".GetByWnoForUpdate", wno);
		return wb;
	}

	public void updateWrite(WriteBean wb) {
		int cnt = sqlSessionTemplate.update(namespace + ".UpdateWrite", wb);
		System.out.println("update:" + cnt);
	}

	public int getLikes(String wno) {
		int likes = sqlSessionTemplate.selectOne(namespace + ".GetLikes", wno);
		System.out.println("likesByWno=" + likes);
		return likes;
	}

	public void minusUpdateLikes(String wno) {
		int cnt = sqlSessionTemplate.update(namespace + ".MinusUpdateLikes", wno);
		System.out.println("minusLikes=" + cnt);
	}

	public void insertLikes(Map<String, String> map) {
		int cnt = sqlSessionTemplate.insert(namespace + ".InsertLikes", map);
		System.out.println("insertLikes=" + cnt);
	}

	public void deleteLikes(Map<String, String> map) {
		int cnt = sqlSessionTemplate.delete(namespace + ".DeleteLikes", map);
		System.out.println("deleteLikes=" + cnt);
	}

	public List<String> findLikesByNo(String no) {
		List<String> likedWnoLists = sqlSessionTemplate.selectList(namespace + ".FindLikesByNo", no);
		return likedWnoLists;
	}

	// 북마크
	public int insert_BookMark(BookMarkBean bmb) {

		int result = sqlSessionTemplate.insert(namespace + ".Insert_BookMark", bmb);

		return result;
	}

	public int delete_BookMark(BookMarkBean bmb) {

		int result = sqlSessionTemplate.delete(namespace + ".Delete_BookMark", bmb);

		return result;
	}

	public List<String> findBookMarkByNo(String no) {
		List<String> lists = sqlSessionTemplate.selectList(namespace + ".FindBookMarkByNo", no);
		return lists;
	}

	public String getFriendsForTagByMno(String no) {
		String friends = sqlSessionTemplate.selectOne(namespace + ".GetFriendsForTagByMno", no);
		return friends;
	}

	public String getFriendsNameByFno(Map<String, String> map) {
		String flists = sqlSessionTemplate.selectOne(namespace + ".GetFriendsNameByFno", map);
		return flists;

	}

	// 메인 피드 게시글 불러오기
	public List<WriteBean> select_By_onlyMe(Map<String, String> tagmap1) {

		List<WriteBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_By_onlyMe", tagmap1);

		return lists;
	}

	public List<WriteBean> select_By_onlyFriends(Map<String, String> tagmap2) {
		List<WriteBean> lists = sqlSessionTemplate.selectList(namespace + ".Select_By_onlyFriends", tagmap2);
		return lists;
	}

	public MemberBean getFriendsNoAndName(String no) {
		MemberBean friendsList = sqlSessionTemplate.selectOne(namespace + ".GetFriendsNoAndName", no);
		return friendsList;
	}

	/* jh */
	public String getMaxWno(int no) {
		String wno = sqlSessionTemplate.selectOne(namespace + ".getMaxWno", no);
		return wno;
	}

	// 오늘 게시글수
	public int todayWrite() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TodayWrite");
		return cnt;
	}

	// 전체 게시글수
	public int totalWrite() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TotalWrite");
		return cnt;
	}
	//은정 비즈니스
	public List<WriteBean> sel_public(String no) {
		System.out.println("no.:"+no);
		 List<WriteBean> lists = sqlSessionTemplate.selectList(namespace+".Sel_public",no);
		 System.out.println("lists.size:"+lists.size());
		
		return lists;
	}

	public void insertBNwrite(WriteBean wb) {
		System.out.println(wb.getContents());
		System.out.println(wb.getLink());
		System.out.println(wb.getImage());
		int cnt = sqlSessionTemplate.insert(namespace+".InsertBNwrite",wb);
		System.out.println("bninsert cnt:"+cnt);
	}
	

}
