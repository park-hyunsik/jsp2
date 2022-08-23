package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.vo.Comment;
import mybatis.SqlSessionBean;

public class CommentDao {
	private static CommentDao dao = new CommentDao();
	private CommentDao() { }
	public static CommentDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	public int updateCmtCount(int mref) {
		SqlSession mapper = factory.openSession();
		int result =mapper.update("updateCmtCount",mref);
		mapper.commit(); mapper.close();
		return result;
			
	}
	public int delete(int idx) {
		SqlSession mapper = factory.openSession();
		int result =mapper.delete("comments.delete",idx);
		mapper.commit(); mapper.close();
		return result;
	}
	
	
	public int insert(Comment vo) {
		SqlSession mapper = factory.openSession();
		int result = mapper.insert("comments.insert",vo);
		mapper.commit(); mapper.close();
		return result;
	}
	
	public List<Comment> getComments(int mref){
		SqlSession mapper = factory.openSession();
		List<Comment> list = mapper.selectList("getComments",mref);
		mapper.close();
		return list;
	}
}
