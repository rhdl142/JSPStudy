<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@ include file="inc/asset.jsp" %>
		<style>

		</style>
		<script>
			$(document).ready(function(){
	
			});
		</script>
	</head>
	<body>
		<!-- ex27_cookie_one.jsp -->
		<div class="container">
			<h1 class="page-header">쿠키(저장소)에 사용자 데이터 저장하기</h1>
			
			<h3>1. 자바스크립트로 저장하기(이전수업)</h3>
			
			<script src="<%= request.getContextPath() %>/asset/js/cookie.js"></script>
			
			<script>
				//1. 숫자 저장
				setCookie("num","100");
			</script>
			
			<h3>2. jQuery로 저장하기</h3>
			
			<script>
				//2. 색상 저장
				//$(선택자).함수(); //선택자 결과 조작
				//$.cookie(); //특정 태그와 관계x, 전역 함수(범용 기능)
				//$.ajax()
				
				$.cookie("color","tomato");
			</script>
			
			<h3>3. JSP(Servlet)로 저장하기</h3>
			
			<%
				//크기 저장
				Cookie cookie = new Cookie("size","200"); //쿠키 객체 생성하기
				
				response.addCookie(cookie); //쿠키에 데이터 저장하기
			%>
			
			<hr />
			
			<a href="ex27_cookie_two.jsp">쿠키 확인하러 가기</a>
			
		</div>
	</body>
</html>