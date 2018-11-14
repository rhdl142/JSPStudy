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
	<!-- ex16_session_two.jsp -->
	<div class="container">
		<h1 class="page-header">결과</h1>
		
		<p>session : <%= session.getAttribute("num") %></p>
		<p>application : <%= application.getAttribute("name") %></p>
	</div>
	
</body>
</html>













