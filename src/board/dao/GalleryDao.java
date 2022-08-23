package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.vo.Gallery;
import mybatis.SqlSessionBean;

public class GalleryDao {
	private static GalleryDao dao = new GalleryDao();
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		return dao;
		
	}
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	public List<Gallery> selectAll(){
		SqlSession mapper = factory.openSession();
		List<Gallery> list = mapper.selectList("selectAll");
		mapper.close();
		return list;
	}
	public Gallery selectOne(int idx){
		SqlSession mapper = factory.openSession();
		Gallery vo = mapper.selectOne("selectOne",idx);
		mapper.close();
		return vo;
	}
	public int insert(Gallery vo) {
		SqlSession mapper = factory.openSession();
		int result = mapper.insert("gallery.insert", vo);
		mapper.commit(); mapper.close();
		return result;
	}
}
