package event.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Paging;

@Component
public class EventDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private final String namespace = "event.model.EventBean";

	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return totalCount;
	}

	public List<EventBean> selectLists(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<EventBean> lists = sqlSessionTemplate.selectList(namespace + ".SelectLists", map, rowBounds);
		return lists;
	}

	public void deleteArticle(String num) {
		sqlSessionTemplate.delete(namespace + ".DeleteArticle", num);

	}

	public void updateReadCount(String num) {
		sqlSessionTemplate.update(namespace + ".UpdateReadCount", num);

	}

	public EventBean selectArticle(String num) {
		EventBean bean = sqlSessionTemplate.selectOne(namespace + ".SelectArticle", num);
		return bean;
	}

	public void insertArticle(EventBean article) {
		sqlSessionTemplate.insert(namespace + ".InsertArticle", article);

	}

	public void updateArticle(EventBean article) {
		sqlSessionTemplate.update(namespace + ".UpdateArticle", article);

	}

	public void insertEvent(EventBean event) {
		sqlSessionTemplate.insert(namespace + ".InsertEvent", event);

	}

	public int deleteEvent(String num) {
		int cnt = sqlSessionTemplate.delete(namespace + ".DeleteEvent", num);
		return cnt;
	}

	public int eventDaoDelete(String num) {
		sqlSessionTemplate.delete(namespace + ".eventDaoDelete", num);
		return 0;
	}

	public EventBean getEvent(String num) {
		EventBean eb = sqlSessionTemplate.selectOne(namespace + ".GetEvent", num);
		return eb;
	}

	public EventBean selectEventByNum(String num) {
		EventBean bean = sqlSessionTemplate.selectOne(namespace + ".selectEventByNum", num);
		return bean;
	}

	public void updateEvent(EventBean event) {
		sqlSessionTemplate.update(namespace + ".updateEvent", event);

	}

}