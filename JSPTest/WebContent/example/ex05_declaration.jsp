<%@page import="com.test.jsp.MyUtil"%>
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
		<!-- ex05_declaration.jsp -->
		<%
			int a = 10;
		%>
		
		<p>a : <%= a %></p>
		
		<%
			MyUtil util = new MyUtil();
		%>
		
		<p>num : <%=util.getNum() %></p>
		
		<%= request.getRequestURI() %>
	</body>
</html>

<%!
	int b = 20; //멤버 변수

	public void test() {} //메소드 선언 가능
%>