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
<!-- home.jsp역할을 index.jsp 로 바꾸었습니다.(8월22일) : login 폴더의 href 경로가 일부 수정됩니다. -->
<h3>메인 Main</h3>
<hr>
<div>로그인 했을까요 ${user != null }</div>
<!--  "user" 라는 이름의 애트리뷰트 가져오기 -->
<c:if test="${user !=null }">
<h4><c:out value="${user.name }"/>님 환영합니다.</h4>
<a href="logout.jsp">로그아웃</a>
</c:if>
<c:if test="${user ==null }">

<a href="loginForm.jsp">로그인</a>
</c:if>
</body>
</html>