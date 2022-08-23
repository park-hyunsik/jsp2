<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gallery : 파일 업로드 연습</title>
</head>
<script type="text/javascript">
function fileValid(){
    const imgfile = document.forms[0].pic //document.getElementById('imgfile') 도 가능합니다.
    const maxSize = 1*1024*1024;
    
    //let isValid= true;      
    //*button 타입은 submit 으로하고 form 태그의 onsubmit 속성에 유효성 검사 함수를 설정할때는 isValid 변수는 필요 없습니다.
    //console.log(document.forms[0].pic.value)
    if(imgfile.value =="" || imgfile.value == null) {
       alert("파일첨부는 필수 입니다.")
       //isValid= false;
       return false;      //*onsubmit 속성으로 호출된 함수에서 return false 이면 submit 안합니다.
    } else {
       if(!imgfile.value.match(/(.*?).(jpg|png|gif)$/)) {   //정규표현식으로 확장자 검사
          alert("파일 형식은 jpg,png,gif 만 가능합니다.")
          //isValid= false;
          return false;
       }
       if(imgfile.files[0].size > maxSize) {  
 //imgfile.value 는 선택한 파일명, imgfile.files[0] 다중선택가능하므로 파일자체를 인덱스로 지정합니다. 
          alert("최대 파일크기는 1MB 입니다.")
          //isValid= false;
          return false;
       }
    }
 }
</script>
<body>
<h3>이미지 파일 업로드 하기</h3>
<hr>
	<!-- 파일 업로드를 할때는 반드시  method="post" enctype="multipart/form-data" -->
	<form action="gallerySave.jsp" method="post" enctype="multipart/form-data" onsubmit="return fileValid()">
		<input type="text" name="title" placeholder="제목을 입력하세요."><br>
		<input type="file" name="pic" accept="image/*,imageg" id="imgfile">
		<!-- 웹에서는 파일의 형식을 확장자로만 구분하지 않고 MIME 형식을 사용합니다.
			 image/* , image/png,image/jpeg , video/* 등등 
			 accept 속성은 파일선택 창에서 초기 형식. -> *.* 모든 파일로 변경 및 파일 전송도 가능.
		 -->
		 <button>전송</button>
	</form>
	<!-- 
		1. form 요소의 file 타입으로 클라이언트가 파일을 선택합니다.
		2. 서버 페이지에서는 file 타입 요소로 전달된 파일을 다른 파라미터(입력값)과 함께 전송받습니다.(업로드)
			  ㄴ 서버에서 업로드 폴더 설정이 필요 (예시 : D:\iclass05\upload ) 
		3. 2번에서 파일 전송에 필요한 Request 처리가 별도로 필요합니다. -> MultipartRequest 클래스
			 ㄴ dependency 추가
	 -->
</body>
</html>