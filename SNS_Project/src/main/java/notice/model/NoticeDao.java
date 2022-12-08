package notice.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private final String namespace = "notice.model.NoticeBean";

	
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return totalCount;
	}

	public List<NoticeBean> selectLists(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<NoticeBean> lists = sqlSessionTemplate.selectList(namespace + ".SelectLists", map, rowBounds);
		return lists;
	}

	
	public void deleteArticle(String num) {
		sqlSessionTemplate.delete(namespace + ".DeleteArticle", num);

	}

	public void updateReadCount(String num) {
		sqlSessionTemplate.update(namespace + ".UpdateReadCount", num);

	}

	public NoticeBean selectArticle(String num) {
		NoticeBean bean = sqlSessionTemplate.selectOne(namespace + ".SelectArticle", num);
		return bean;
	}

	public void insertArticle(NoticeBean article) {
		sqlSessionTemplate.insert(namespace + ".InsertArticle", article);

	}

	public void updateArticle(NoticeBean article) {
		sqlSessionTemplate.update(namespace + ".UpdateArticle", article);

	}

	public void insertNotice(NoticeBean notice) {
		sqlSessionTemplate.insert(namespace + ".Insertnotice", notice);

	}

	public int deletenotice(String num) {
		int cnt = sqlSessionTemplate.delete(namespace + ".Deletenotice", num);
		return cnt;
	}

	public int noticeDaoDelete(String num) {
		sqlSessionTemplate.delete(namespace + ".noticeDaoDelete", num);
		return 0;
	}

	public NoticeBean getnotice(String num) {
		NoticeBean eb = sqlSessionTemplate.selectOne(namespace + ".Getnotice", num);
		return eb;
	}

	public NoticeBean selectnoticeByNum(String num) {
		NoticeBean bean = sqlSessionTemplate.selectOne(namespace + ".SelectnoticeByNum", num);
		return bean;
	}

	public void updatenotice(NoticeBean notice) {
		sqlSessionTemplate.update(namespace + ".Updatenotice", notice);

	}
}

