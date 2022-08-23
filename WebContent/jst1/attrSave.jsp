
<%@page import="test.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = 
	new ArrayList<>();
	list.add("엄지");
	list.add("신비");
	list.add("은하");
	
	
	User user = new User(25,"김땡땡");
	request.setAttribute("list", list);
	request.setAttribute("string","viviz");
	request.setAttribute("age",23);
	request.setAttribute("user",user);
	pageContext.forward("attrGet.jsp");


%>
