<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width : 700px;
	margin: auto;
	
}

th {
		text-align: center;
		background-color: #4080bf;
		font-size:90%;
		color: white;
		width: 150px%;
		border-radius : 3px;
}


.btn {
	width: 70px;
	cursor : pointer;
}


</style>
</head>
<body>
<h3>우리동네 커뮤니티 글쓰기</h3>
<hr>
<%= request.getRemoteAddr() %>

<form name="frm1" method="post" action="insertAction.jsp">

 <table>
 	<tr><th>제목</th>
 		<td><input type="text" name="subject" size="50" required></td>
 	</tr>
 	<tr>
		<th>작성자</th>
 		<td><input type="text" name="writer" size="50" required></td>
 	</tr>
 	
 	<tr><th>글 비밀번호</th>
 		<td><input type="password" name="password" required></td>
 	</tr>
 	<tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="80" name="content" required></textarea>
 		<!--textarea 는 multi line 입력이 됩니다.  --></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btn" >
 	<input type="reset"  value="다시쓰기" class="btn">
 	<input type="button" value="목록" onclick="location.href='listAction.jsp?page=${param.page}'" class="btn">
 	<%-- -- <%=request.getParameter("page]") %> 를 el 표시로 변경할때는 param 키워드.파라미터이름 으로 합니다.--%>
 	</td></tr>
 </table>
 </form>


</body>
</html>