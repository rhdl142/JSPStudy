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
		<!-- login.jsp -->
		<div class="container">
			<h1 class="page-header">로그인</h1>
			
			<form action="loginok.jsp" method="post">
				<table class="table table-bordered" style="width:300px;">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" class="form-control" /></td>
					</tr>
					<tr>
						<th>암호</th>
						<td><input type="password" name="pw" class="form-control" /></td>
					</tr>
				</table>
				
				<div>
					<input type="submit" value="로그인" class="btn btn-default" />
				</div>
			</form>
			
		</div>
	</body>
</html>













































