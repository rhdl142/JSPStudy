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
		<!-- ex22_bean_form.jsp -->
		<div class="container">
			<h1 class="page-header">주소록 추가하기</h1>
			
			<form action="ex22_bean_process.jsp" method="post">
				<table class="table" style="width:400px;">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="age" /></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<select name="gender">
								<option value="m">남자</option>
								<option value="f">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>전화</th>
						<td><input type="text" name="tel" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" /></td>
					</tr>
				</table>
				<div>
					<input type="submit" value="추가하기" />
				</div>
			</form>
			
		</div>
	</body>
</html>