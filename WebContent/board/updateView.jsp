<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board 글 수정</title>
<style type="text/css">
table {
	width : 800px;
	margin: auto;
	
}

th {
		text-align: center;
		background-color: #b9e4c9;
		font-size:90%;
		color: white;
		width: 150px;
		border-radius : 3px;
}
th,td{
	padding: 5px;
}

input,textarea {
	padding: 10px;
	border: 1px solid #4080bf;
	border-radius: 3px;
}

button {
    color:#356859;
    padding: 7px 25px;
    text-decoration: none;  /*  밑줄제거  */
    cursor: pointer;
    display: inline-block;
	text-align:center;
	border-radius: 4px;
	border:1px solid #356859;
	margin : 3px;
}
button:hover {
	border:2px solid #356859;
	padding: 6px 24px;
	font-weight: bold;
}


</style>
</head>
<body>
<h3>우리동네 커뮤니티 글 수정</h3>
<hr>
<form name="frm1" method="post" action="updateSave.jsp">
	<input type="hidden" name="idx" value="${vo.idx }">
	<input type="hidden" name="page" value="${page }">
 <table>
 	<tr><th>제목</th>
 		<td><input type="text" name="subject" size="50" value="[수정] ${vo.subject }" readonly></td>
 	</tr>
 	<tr>
		<th>작성자</th>
 		<td><input type="text" name="writer" size="50" value="${vo.writer }" disabled="disabled"></td>
 	</tr>
 	 <tr>
		<th>작성 날짜</th>
 		<td><c:out value="${vo.wdate }"/></td>
 	</tr>
 	
 	<tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="60" name="content" required><c:out value="${vo.content }"/></textarea>
 		<!--textarea 는 multi line 입력이 됩니다.  --></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<button type="submit">저장</button>
 	<button type="reset">다시쓰기</button>
 	<button type="button" onclick="location.href='listAction.jsp?page=${page}'">목록</button>
 	<%-- <%=request.getParameter("page") %> 를 el 표시로 변경할때는 param 키워드.파라미터이름 으로 합니다.--%>
 	</td></tr>
 </table>
 </form>
</body>
</html>