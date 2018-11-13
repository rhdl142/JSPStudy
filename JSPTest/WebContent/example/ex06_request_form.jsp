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
		<!-- ex06_request_form.jsp -->
		<div class="container">
			<h1>데이터를 전송하는 역활(POST, GET)</h1>
			
			<form action="ex06_request_process.jsp" method="post">
				<table class="table table-bordered" style="width:600px;">
					<tr>
						<th style="width:150px;">이름</th>
						<td style="width:450px;"><input type="text" name="name" class="form-control" /></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<select name="gender" id="" class="form-control">
								<option value="m">남자</option>
								<option value="f">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>
				
				<div>
					<input type="submit" value="보내기" class="btn btn-default" />
				</div>
			</form>
		</div>
	</body>
</html>