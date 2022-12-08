package tag.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TagDao {
	private final String namespace="tag.model.Tag";
	
	@Autowired SqlSessionTemplate sqlSessionTemplate;
	
	public int getTagCount(String tag_name) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTagCount",tag_name);
		System.out.println("getTagName : " + cnt);
		return cnt;
	}
	
	public void insertTag(String tag_name) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertTag",tag_name);
		System.out.println("insertTag : "+cnt);
	}

	public TagBean getTagBean(String tag_name) {
		TagBean tb = sqlSessionTemplate.selectOne(namespace+".getTagBean",tag_name);
		return tb;
	}

	public void insertPostTag(Post_tagBean pt) { //tag insert, update
		int cnt = sqlSessionTemplate.insert(namespace+".insertPostTag",pt);
		System.out.println("insertPostTag : "+cnt);
	}

	public List<Post_tagBean> getPostTag() {
		List<Post_tagBean> ptList = new ArrayList<Post_tagBean>();
		ptList = sqlSessionTemplate.selectList(namespace+".getPostTag");
		return ptList;
	}

	public List<Post_tagBean> getPostNameByWno(String wno) {
		List<Post_tagBean> ptList = new ArrayList<Post_tagBean>();
		ptList = sqlSessionTemplate.selectList(namespace+".getPostNameByWno",wno);
		return ptList;
	}

	public void resetTag(String wno) {
		int cnt = sqlSessionTemplate.delete(namespace+".resetTag",wno);
		System.out.println("resetTag : "+cnt);
	}

	public List<Post_tagBean> getWnoByClickedTag(String tag_name) {
		List<Post_tagBean> taggedList = new ArrayList<Post_tagBean>();
		taggedList = sqlSessionTemplate.selectList(namespace+".getWnoByClickedTag",tag_name);
		System.out.println("getWnoByClickedTag taggedList.size : " + taggedList.size());
		return taggedList;
	}
	



}
