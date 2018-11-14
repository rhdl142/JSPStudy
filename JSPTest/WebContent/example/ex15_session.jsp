<%@page import="java.util.Date"%>
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
	<!-- ex15_session.jsp -->
	<div class="container">
		<h1 class="page-header">Session</h1>
		
		<p><%= session.getCreationTime() %>
		, <%= String.format("%tF %tT", new Date(session.getCreationTime()), new Date(session.getCreationTime())) %></p>
		
		<p><%= session.getId() %></p><!-- 현재 접속한 유저의 임시 식별자 -->
		<p><%= session.getLastAccessedTime() %></p>
		<p><%= session.isNew() %></p>
		<p><%= session.getMaxInactiveInterval() %></p>
		
	</div>
	
</body>
</html>
















