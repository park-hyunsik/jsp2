<%@page import="board.vo.Freeboard"%>
<%@page import="board.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String subject = request.getParameter("subject");
   String writer = request.getParameter("writer");
   String password = request.getParameter("password");
   String content = request.getParameter("content");
   String ip = request.getRemoteAddr();
   
   Freeboard vo = new Freeboard(0,writer,password,subject,content,0,null,ip,0);
   FreeboardDao dao = FreeboardDao.getInstance();
   dao.insert(vo);
   response.sendRedirect("listAction.jsp");
%>


