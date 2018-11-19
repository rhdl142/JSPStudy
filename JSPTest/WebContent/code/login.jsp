<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<!-- template.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			<section>
				<h1 class="page-header">Member</h1>
				
				<form action="loginok.jsp" method="post">
					<table class="table table-bordered"	style="width : 250px;" >
						<tr>
							<th style="width : 100px;">ID</th>
							<td style="width : 150px;"><input type="text" name="id" id="id" class="form-control" required /></td>
						</tr>
						<tr>
							<th>PW</th>
							<td><input type="password" name="pw" id="pw" class="form-control" required /></td>
						</tr>
					</table>
					
					<div>
						<input type="button" value="Back" class="btn btn-default" onclick="history.back"/>
						<input type="submit" value="Submit" class="btn btn-primary" />
					</div>
				</form>
				
			</section>
		</div>
	</body>
</html>























































