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
	<!-- ex19_forward_two.jsp -->
	<div class="container">
		<h1 class="page-header">두번째 페이지</h1>
		
		<p><%= request.getAttribute("num") %></p>
	</div>
	
</body>
</html>













