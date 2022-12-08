package friend.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("friendDao")
public class FriendDao {

	private String namespace = "friend.model.FriendDao";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public FriendBean getMyFriends(String no) {
		FriendBean friends = sqlSessionTemplate.selectOne(namespace+".GetMyFriends", no);
		return friends;
	}

	//나에게 친구 추가
	public void updateFriendsList(FriendBean bean) {
		sqlSessionTemplate.update(namespace+".UpdateFriendsList", bean);

	}

	public void insertFriend(FriendBean bean) {
		sqlSessionTemplate.insert(namespace+".InsertFriend", bean);

	}
	
	
	

	//친구 요청 리스트
	public void updateWaits(FriendBean bean) {
		sqlSessionTemplate.update(namespace+".UpdateWaits", bean);

	}

	public void insertWaits(FriendBean bean) {
		sqlSessionTemplate.insert(namespace+".InsertWaits", bean);

	}








}
