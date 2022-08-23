<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 동네 커뮤니티</title>
<!-- 절대경로 request.getContextPath() 을 el로 표시-->
<link rel="stylesheet" 
href="${pageContext.request.contextPath }/css/freeboard.css?v=3">
</head>
<body>
<h3>우리동네 커뮤니티</h3>
<hr>
<main>
<div style="margin:auto;">
<ul id="main">
	<li>
		<ul  class="row">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>조회수</li>
			<li>작성일</li>
		</ul>
	</li>
 	<c:forEach var="vo" items="${list}"> 
	<li>
	<ul  class="row">
		<li>${vo.idx }</li>
		<li><a href="detailAction.jsp?idx=${vo.idx}&page=${page}" class="title">${vo.subject }</a>
	 		...<span style="color:orange;font-size: 80%;">(${vo.commentCount })
	 		</span></li>
		<li>${vo.writer }</li>
		<li>${vo.readCount }</li>
		<li>
		<!-- vo.wdate 날짜 패턴을 적용한 결과 문자열을 wdate 변수로 저장 -->
		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" var="wdate"/>
		<!-- 오늘 작성한 글은 시간으로 표시 -->
		<c:if test='${wdate == today}'>
			<fmt:formatDate value="${vo.wdate }" type="time"/>
		</c:if>
		<!-- 오늘 이전에 작성한 글은 날짜로 표시 -->
		<c:if test='${wdate != today}'>
			<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd"/>
		</c:if>
		</li>
		
	</ul>
	</li>
 	</c:forEach>
</ul>
	<div style="float:right;margin:40px;">
	<a href="insertView.jsp?page=${page }" class="button" >글쓰기</a>
	<a href="${pageContext.request.contextPath}/index.jsp" class="button" >홈</a>
	</div>
</div>
<!-- 페이지 버튼을 클릭하면 url  http://192.168.1.254:8082/jsp2/board/listAction.jsp 은 동일하고 
	 page 파라미터만 변경됩니다.  이런 경우 앞의 부분 생략하고 ? 부터 작성.
-->
<div style="width:700px;margin: auto;text-align: center;">
	전체 글 개수 : <c:out value="${pagelist.totalCount }"/> <br>
	<a class="pagenum" href="?page=1">&lt;&lt;</a>
	<a class="pagenum" href="?page=${pagelist.startPage-1 }" 
			style='<c:if test="${pagelist.startPage==1 }">display:none;</c:if>' >&lt;</a>
	
	<c:forEach var="i" begin="${pagelist.startPage }" end="${pagelist.endPage }">
		<a class="pagenum ieach" href="?page=${i }"><c:out value="${i }"/></a>
	</c:forEach>
	
	<a class="pagenum" href="?page=${pagelist.endPage+1 }"
			style='<c:if test="${pagelist.endPage==pagelist.totalPage }">display:none;</c:if>'	>&gt;</a>
	<a class="pagenum" href="?page=${pagelist.totalPage }">&gt;&gt;</a>
</div>
</main>
<script type="text/javascript">
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		console.log(item);
		if(item.innerHTML=='${page}') {
			item.style.color = 'black';
			item.style.fontWeight = 'bold';
		}else{
			item.style.color = '#37966f';
		}
	});
</script>

</body>
</html>













