package admin.model;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("VisiterDao")
public class VisiterDao {

	private String namespace = "admin.model.visiters";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//통계 : 오늘 방문자수 (나이대별로)
	public List<VisiterBean> todayAge() {
		List<VisiterBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".TodayAge");
		return list;
	}
	
	//오늘 방문자수, 이번달 방문자수
	public int todayVisiter() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".TodayVisiter");
		return cnt;
	}
	
	public List<Integer> monthVisiter(String date) {
		List<Integer> cntList = null;
		cntList = sqlSessionTemplate.selectList(namespace+".MonthVisiter", date);
		return cntList;
	}
	
	//방문자수 insert
	public void insertVisiter(String age) {
		sqlSessionTemplate.insert(namespace+".InsertVisiter", age);
	}
	
	//방문자수 insert 하기 전에 확인
	public boolean sysdateVisiter() {
		List<VisiterBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".SysdateVisiter");
		if(list.size() == 0) {
			return false; //없음
		} else {
			return true; //있음
		}
	}
	
	//총 방문자수 update
	public void updateAllVisiter() {
		sqlSessionTemplate.update(namespace+".UpdateAllVisiter");
	}
	
	//나이대별 방문자수 update
	public void updateAgeVisiter(String age) {
		sqlSessionTemplate.update(namespace + ".UpdateAgeVisiter", age);
	}
	
	//방문자수 관련 그래프
	public List<VisiterBean> yearMonthVisiter(String date) {
		List<VisiterBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".YearMonthVisiter", date);
		return list;
	}

	//어제 방문자수
	public Integer yesterdayVisiter(String yesterday) {
		Integer cnt = sqlSessionTemplate.selectOne(namespace+".YesterdayVisiter", yesterday);
		if(cnt == null) {
			return 0;
		} else {
			return cnt;
		}
	}
	
	//이번달 최저방문자수, 최고방문자수
	public int minVisiter() {
		int min = sqlSessionTemplate.selectOne(namespace+".MinVisiter");
		return min;
	}
	
	public int maxVisiter() {
		int max = sqlSessionTemplate.selectOne(namespace+".MaxVisiter");
		return max;
	}

}
