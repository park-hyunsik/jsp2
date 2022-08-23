package dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;
import vo.BookMember;

public class BookMemberDao {
	private static BookMemberDao dao = new BookMemberDao();
	private BookMemberDao() {};
	public static BookMemberDao getInstance() {
		return dao;
	}
	SqlSessionFactory factory= SqlSessionBean.getSessionFactory();
	public BookMember login(Map<String,String> map) {
		SqlSession mapper = factory.openSession();
		BookMember vo  = mapper.selectOne("login",map);
		mapper.close();
		return vo;
	}
}
	