<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 : 업로드한 이미지 목록</title>
</head>
<body>
 <c:forEach var="vo" items="${glist }">
 	<div style="width:300px;height: 500px;border:1px solid gray;">
		<img alt="${vo.title }" src="/upload/${vo.filenames }" style="width:100%;"> 	
 	</div>
 </c:forEach>
 <a href="galleryForm.jsp">갤러리 이미지 등록</a>
</body>
</html>