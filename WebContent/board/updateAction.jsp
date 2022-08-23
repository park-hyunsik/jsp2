<%@page import="board.vo.Freeboard"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pageNo = request.getParameter("page");
	String password = request.getParameter("password");
	
	FreeboardDao dao = FreeboardDao.getInstance();
	
	Freeboard vo = dao.getDetail(idx);
	
	String message;String href;
	if(vo.getPassword().equals(password) ){  //글 비밀번호 일치 : 삭제 완료 -> 글 목록으로 이동.
		request.setAttribute("vo", vo);
		request.setAttribute("page", pageNo);
		pageContext.forward("updateView.jsp");
	}else {		//글 비밀번호 불일치 : 삭제 못함. -> 글 상세보기로 이동
		out.print("<script>");
		out.print("alert('글 비밀번호가 틀립니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>















