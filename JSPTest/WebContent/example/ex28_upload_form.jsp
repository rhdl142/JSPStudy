<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>
	
	$(document).ready(function() {
	
	});
	
</script>
</head>
<body>
	<!-- ex28_upload_form.jsp -->
	<div class="container">
		<h1 class="page-header">파일 업로드</h1>
		<!--  
		1. 파일 업로드는 <form>의 <input type="file">를 사용한다.
		2. <form>의 method는 반드시 post로 지정한다.(get 사용하면 데이터 짤림)
		3. <form>에 enctype 속성 지정(encoding)
			- application/x-www-form-urlencoded : 기본값(전송 데이터 모두 문자열)
			- multipart/form-data : 문자열 + 비문자열 데이터 전송
		-->
		
		<form method="post" action="ex28_upload_process.jsp" enctype="multipart/form-data">
			<div>제목 : <input type="text" name="subject"></div>
			<div>이름 : <input type="text" name="name"></div>
			<div>파일 : <input type="file" name="attach"></div>
			<hr>
			<input type="submit" value="보내기">
		</form>
		
	</div>
	
</body>
</html>













