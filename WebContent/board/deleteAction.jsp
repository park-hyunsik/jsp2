<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="board.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pageNo = request.getParameter("page");
	String password = request.getParameter("password");
	
	FreeboardDao dao = FreeboardDao.getInstance();
	Map<String,Object> map  = new HashMap<>();
	map.put("idx", idx);
	map.put("password",password);
	int result = dao.delete(map);
	String message;String href;
	if(result ==1){	//글 비밀번호 일치 : 삭제완료 -> 글목록으로 이동.
		message = "글 삭제 되었습니다.";
		href = "listAction.jsp?page="+pageNo;
	}else {	//글 비밀번호 불일치 : 삭제못함.	-> 글 상세보기로 이동
		message = "글 비밀번호가 틀립니다.";
		href = "detailAction.jsp?idx="+idx + "&page=" + pageNo;
	}
	out.print("<script>");
	out.print("alert('"+message+"');");
	out.print("location.href='"+href+"';");
	out.print("</script>");






%>