<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1)현재 세션(ID)를 무효화 또는 2)세션에 저장된 애트리뷰트 삭제
	session.invalidate();				//1)
	//session.removeAttribute("user");	//2)

	response.sendRedirect("../index.jsp");
	//response 객체 이용해서 새로운 url 요청 보내기
	
%>