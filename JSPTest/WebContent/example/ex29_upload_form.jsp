<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>
	
	#filelist > div {
		margin: 7px 0px;
	}
	
	#filelist > div > input {
		float: left;
		width: 90%;
	}
	
	#filelist > div > span {
		float: left;
		display: block;
		margin: 9px;
		cursor: pointer;
	}
	
</style>
<script>
	
	var no = 2;
	
	$(document).ready(function() {
		
		$("#btnAdd").click(function() {
			
			var set = "<div><input type=\"file\" name=\"doc" + no + "\" class=\"form-control\"> <span class=\"glyphicon glyphicon-remove\" onclick='//del();'></span><div style=\"clear:both;\"></div></div>";
			no++;
			
			$("#filelist").append(set);
			
			//$("#filelist > div > span").click(function() {
			//	alert("삭제");
			//});
			
			$("#filelist > div:last-child > span").click(function() {
				//alert("삭제");
				//$(this)
				//$(event.srcElement)
				//$(this).hide();
				//$(this).parent().hide();
				$(this).parent().remvoe();
			});
			
		}); //btnAdd.click
		
		
		
		
		
	});//ready
	
	
	function del() {
		alert("삭제");
		
	}
	
</script>
</head>
<body>
	<!-- ex29_upload_form.jsp -->
	<div class="container">
		<h1 class="page-header">입사 지원서</h1>
		
		<form method="post" action="ex29_upload_process.jsp" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<th style="width:100px;">이름</th>
				<td style="width:200px;"><input type="text" name="name" class="form-control"></td>
				<th style="width:100px;">생년월일</th>
				<td style="width:200px;"><input type="date" name="birth" class="form-control"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="tel" name="tel" class="form-control"></td>
				<th>주소</th>
				<td><input type="text" name="address" class="form-control"></td>
			</tr>
			<tr>
				<th>증명사진</th>
				<td colspan="3"><input type="file" name="pic" class="form-control"></td>
			</tr>
			<tr>
				<th>증명서류</th>
				<td colspan="3">
					
					<input type="file" name="doc1" class="form-control">
					
					<div id="filelist">
						<!-- <div><input type="file" name="doc2" class="form-control"> <span class="glyphicon glyphicon-remove"></span><div style="clear:both;"></div></div> -->
					</div>
					
					<input type="button" value="서류 추가하기" id="btnAdd" class="btn btn-default">
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="제출하기" class="btn btn-default">
		</div>
		</form>
		
	</div>
	
</body>
</html>













