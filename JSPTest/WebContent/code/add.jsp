<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="com.test.jsp.code.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	if(session.getAttribute("id") == null) {
		response.sendRedirect("index.jsp");
	}
	//add.jsp
	
	//1. DAO 위임 > 카테고리 목록 반환 
	//2. 입력 폼
	
	//1.
	CodeDAO dao = new CodeDAO();
	
	ArrayList<CategoryDTO> clist = dao.listCategory();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Code</title>
		<%@ include file="inc/asset.jsp" %>
		<style>
			#tbl th {
				width : 150px;
			}
			
			#tbl td {
				
			}
			
			#tbl tr:nth-child(1) td select { width : 150px; }
			#tbl tr:nth-child(3) td textarea { height : 150px; }
		</style>
		<script>
			$(document).ready(function(){
	
			});
		</script>
	</head>
	<body>
		<!-- add.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			<section>
				<h1 class="page-header">CODE</h1>
				
				<form action="addok.jsp" method="post" enctype="multipart/form-data">
					<table id="tbl" class="table table-bordered">
						<tr>
							<th>카테고리</th>
							<td>
								<select name="category" id="category" class="form-control">
									<% for(CategoryDTO dto : clist) { %>
									<option value="<%=dto.getSeq()%>"><%=dto.getName() %></option>
									<% } %>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="subject" id="subject" class="form-control" required/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id="content" class="form-control" required></textarea></td>
						</tr>
						<tr>
							<th>소스</th>
							<td><input type="file" name="attach" id="attach" class="form-control" required/></td>
						</tr>
					</table>
					
					<div>
						<input type="button" value="Back" class="btn btn-default" onclick="history.back();">
						<input type="submit" value="Submit" class="btn btn-primary">
					</div>
				</form>
				
			</section>
		</div>
	</body>
</html>























































