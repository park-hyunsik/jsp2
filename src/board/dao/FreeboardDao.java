package board.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.vo.Freeboard;
import mybatis.SqlSessionBean;
import vo.BookMember;

public class FreeboardDao {
	private static FreeboardDao dao = new FreeboardDao();
	private FreeboardDao() {};
	public static FreeboardDao getInstance() {
		return dao;
	}
	SqlSessionFactory factory= SqlSessionBean.getSessionFactory();
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int count=mapper.selectOne("getCount");
		mapper.close();
		return count;
	}
	
	public List<Freeboard> getPageList(Map<String,Integer> map){
		SqlSession mapper = factory.openSession();
		List<Freeboard> list = mapper.selectList("getPageList",map);
		mapper.close();
		return list;
	}
	
	public Freeboard getDetail(int idx) {
		SqlSession mapper = factory.openSession();
		Freeboard vo = mapper.selectOne("freeboard.detail",idx);
		mapper.close();
		return vo;
	}
	
	public void insert(Freeboard vo) {
		SqlSession mapper = factory.openSession();
		mapper.insert("freeboard.insert",vo );
		//매퍼 xml 네임스페이스.id , 다른 매퍼 파일과 id 중복일 경우 네임스페이로 식별
		mapper.commit();
		mapper.close();
	}
	public void readcountUp(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("readcountUp",idx);
		mapper.commit();
		mapper.close();
	}
	public void update(Freeboard vo) {
		SqlSession mapper = factory.openSession();
		mapper.update("Freeboard.update",vo);
		mapper.commit();
		mapper.close();
	}
	public int delete (Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		int result = mapper.delete("freeboard.delete",map);
		mapper.commit();
		mapper.close();
		return result;
	}
}
	