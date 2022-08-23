<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메인 Main</h3>
<hr>
<!--  "user" 라는 이름의 애트리뷰트 가져오기 -->
<c:if test="${user !=null }">
<h4><c:out value="${user.name }"/>님 환영합니다.</h4>
<a href="login/logout.jsp">로그아웃</a>
</c:if>
<c:if test="${user ==null }">

<a href="login/loginForm.jsp">로그인</a>
</c:if>
	<a href="board/listAction.jsp">커뮤니티</a>
</body>
</html>