<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Random rnd = new Random();
	int num = rnd.nextInt(100);
	
	num *= 2; 
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<%@ include file="inc/asset.jsp"%>
		<style>
		</style>
		<script>
		
		   $(document).ready(function() {
		   
		   });
		
		</script>
	</head>
	<body>
		<!-- 표현식 -->
		<p>결과 : <%= getNum() %></p>
	</body>
</html>

<!-- 멤버 변수 or 메소드 선언 -->
<%!
	public int getNum() {
	   Random rnd = new Random();
	   int num = rnd.nextInt(100);
	   num *= 2;
	   return num;
	}
%>