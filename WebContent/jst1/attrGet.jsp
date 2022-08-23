<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el 테스트</title>
</head>
<body>
<%
	//List<String> list = (List<String>)request.getAttribute(list);
%>
<h3>EL 출력</h3>
string 애트리뷰트 : <c:out value="${string }"/><br> <!-- string 은 애트리뷰트이름 -->
age 애트리뷰트 : <c:out value="${age }"/><br>
user 애트리뷰트 age 프로퍼티 : <c:out value="${user.age }"/><br>
user 애트리뷰트 name 프로퍼티 : <c:out value="${user.name }"/><br>
list 애트리뷰트 : <c:out value="${list }"/><br>
list 애트리뷰트 get(0) : <c:out value="${list[0] }"/><br> <!-- list.get(0) -->
list 애트리뷰트 get(1) : <c:out value="${list[1] }"/><br>
list 애트리뷰트 get(2) : <c:out value="${list[2] }"/><br>
<!-- c:forEach는 배열 또는 리스트를 다룰때 items 속성 지정 -->
<ul>
<c:forEach var="item" items="${list }">
	<li><c:out value="${item }" /></ul>
	</c:forEach>
</ul>


</body>
</html>