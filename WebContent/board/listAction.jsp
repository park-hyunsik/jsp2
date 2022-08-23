<%@page import="board.vo.PageVo"%>
<%@page import="board.vo.Freeboard"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.FreeboardDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNo;
	if(request.getParameter("page")==null) pageNo=1;
	else pageNo = Integer.parseInt(request.getParameter("page"));

	FreeboardDao dao = FreeboardDao.getInstance();
	int pageSize=10;	//한페이지에 몇개의 글개수인가
//	int startNo = (pageNo-1)*pageSize + 1; //pageNo=1,2,3,4,5,...
											//startNo=? 11 1121 31
											
//	int endNo = startNo+(pageSize-1);
	PageVo pages = new PageVo(pageNo,dao.getCount(),pageSize);
			
	Map<String,Integer> map = new HashMap<>();
	map.put("startNo",pages.getStartNo());
	map.put("endNo",pages.getEndNo());
	
	List<Freeboard> list = dao.getPageList(map);
	request.setAttribute("list", list);
	request.setAttribute("today", LocalDate.now());
	
	//페이지 번호를 애트리뷰트로 저장
	request.setAttribute("page", pageNo); 	//PageVo 작성하면 아래 pagelist로 대체할수 있습니다.
	request.setAttribute("pagelist", pages);
	pageContext.forward("listView.jsp");
%>

<%--



실행방법 : http://localhost:8082/jsp2/board/listAction.jsp
실행방법 : http://localhost:8082/jsp2/board/listAction.jsp?page=2
실행방법 : http://localhost:8082/jsp2/board/listAction.jsp?page=6







 --%>