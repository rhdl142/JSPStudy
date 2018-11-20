<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Code</title>
		<%@ include file="inc/asset.jsp" %>
		<style>

		</style>
		<script>
			$(document).ready(function(){
	
			});
		</script>
	</head>
	<body>
		<!-- del.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			<section>
				<h1 class="page-header">CODE</h1>
				
				<p>게시물을 삭제하겠습니까?</p>
				
				<div>
					<input type="button" value="Back" class="btn btn-default" onclick="history.back();">
					<input type="button" value="Delete" class="btn btn-primary" onclick="location.href='delok.jsp?seq=<%=request.getParameter("seq")%>';">
				</div>
			</section>
		</div>
	</body>
</html>























































