<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//logout.jsp
	//1.로그아웃
	//2.메시지 + 시작 페이지 이동하기
	
	//로그인을 안한 사람 vs 로그인을 한 사람의 차이
	// > 세션 변수 삭제(id, name, lv)
	
	//로그아웃
	session.removeAttribute("id");
	session.removeAttribute("name");
	session.removeAttribute("lv");
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@ include file="inc/asset.jsp" %>
		<style>

		</style>
		<script>
			$(document).ready(function() {
				
				alert("로그아웃을 성공했습니다.");
				location.href = "index.jsp";
				
			});
		</script>
	</head>
	<body>
		<!-- logout.jsp -->
		<div class="container">
			<h1 class="page-header">로그아웃</h1>
			
			
			
		</div>
	</body>
</html>






















