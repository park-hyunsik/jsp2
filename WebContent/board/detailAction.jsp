<%@page import="board.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.CommentDao"%>
<%@page import="board.vo.Freeboard"%>
<%@page import="board.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
	int idx  = Integer.parseInt(request.getParameter("idx"));
//글 상세보기를 클릭한 페이지 페이지의 번호를 파라미터로 가져오는 이유: 글 상세보기에서 다시 글목록으로 돌아갈때를 위해서.
						//ㄴ 보고 있던 글 목록 페이지로 돌아가기
	int pageNo  = Integer.parseInt(request.getParameter("page"));
   request.setAttribute("page", pageNo);
	
   //메인글idx의 댓글 목록을 애트리뷰트 저장(선처리: 댓글 갯수 update )
   CommentDao cmtdao = CommentDao.getInstance();
   cmtdao.updateCmtCount(idx);	//idx값이 comment 테이블에서는 mref값.
   List<Comment> cmtlist = cmtdao.getComments(idx);
   request.setAttribute("cmtlist", cmtlist);
   

   FreeboardDao freedao = FreeboardDao.getInstance();
   freedao.readcountUp(idx);
   Freeboard bean = freedao.getDetail(idx);
   
   request.setAttribute("bean", bean);
   
	pageContext.forward("detailView.jsp"); //화면 페이지로 애트리뷰트와 함께 요청 전달.   
   
   
%>


