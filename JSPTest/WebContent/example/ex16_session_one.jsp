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
	<!-- ex16_session_one.jsp -->
	<div class="container">
		<h1 class="page-header">Session vs Application</h1>
		
		<%
		//데이터 저장
		// - session, application 변수
		//		- 전역 변수(모든 페이지에서 접근이 가능하다.)
		// - session 변수
		//		- 개인 전용
		// - application 변수
		//		- 모든 유저 공용
		
		
		session.setAttribute("num", 10);
		application.setAttribute("name", "홍길동");
		%>
		<p>session : <%= session.getAttribute("num") %></p>
		<p>application : <%= application.getAttribute("name") %></p>
		
		<a href="ex16_session_two.jsp">두번째 페이지</a>
		
		<hr>
		
		<%
		
		//session.setAttribute("mcount", 1);
		
		//mcount = mcount + 1;
		//session.setAttribute("mcount", (int)session.getAttribute("mcount") + 1);
		
		//System.out.println(session.getAttribute("mcount"));
		
		
		if (request.getAttribute("mcount") == null) {
			request.setAttribute("mcount", 1);
		} else {
			request.setAttribute("mcount", (int)request.getAttribute("mcount") + 1);
		}
		
		
		if (session.getAttribute("mcount") == null) {
			session.setAttribute("mcount", 1);
		} else {
			session.setAttribute("mcount", (int)session.getAttribute("mcount") + 1);
		}
		
		
		if (application.getAttribute("mcount") == null) {
			application.setAttribute("mcount", 1);
		} else {
			application.setAttribute("mcount", (int)application.getAttribute("mcount") + 1);
		}
		
		%>
		
		<p>접속 횟수 : <%= request.getAttribute("mcount") %></p>
		<p>접속 횟수 : <%= session.getAttribute("mcount") %></p>
		<p>접속 횟수 : <%= application.getAttribute("mcount") %></p>
		
	</div>
	
</body>
</html>













