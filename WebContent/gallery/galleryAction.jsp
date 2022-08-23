<%@page import="board.vo.Gallery"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GalleryDao dao = GalleryDao.getInstance();
	List<Gallery> list = dao.selectAll();
	request.setAttribute("glist", list);
	pageContext.forward("galleryView.jsp");
%>