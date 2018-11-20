<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="com.test.jsp.code.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	if(session.getAttribute("id") == null) {
		response.sendRedirect("index.jsp");
	}

	//edit.jsp	
	//1. 데이터 가져오기(seq)
	//1. DAO 위임 > seelct where > 기존 내용 반환(CodeDTO) 
	//2. 입력 폼의 기본값으로 넣기
	
	//0.
	CodeDAO dao = new CodeDAO();
	
	ArrayList<CategoryDTO> clist = dao.listCategory();
	
	//1. location.href = 'edit.jsp?seq=5';
	String seq = request.getParameter("seq");
	
	//2. view.jsp의 메소드를 재사용
	CodeDTO dto = dao.get(seq);
	
	//체크 - 글 작성자
	if(!session.getAttribute("id").toString().equals(dto.getId()) && session.getAttribute("lv").equals("1")) {
		response.sendRedirect("list.jsp");
	}

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
				//3. 수정할 기존 데이터를 컨트롤의 기본값으로 넣기
				//$("#subject").val(<%= dto.getSubject() %>);
				$("#subject").val("<%= dto.getSubject() %>");
				/*$("#content").val("<%= dto.getContent() %>");*/
				$("#category").val("<%= dto.getCategory() %>");
			});
			
			function test() {
				//alert($("#attach").val());
			}
		</script>
	</head>
	<body>
		<!-- edit.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			<section>
				<h1 class="page-header">Code</h1>
				
				<form method="post" action="editok.jsp" enctype="multipart/form-data">
				<table id="tbl" class="table table-bordered">
					<tr>
						<th>분류</th>
						<td>
							<select name="category" id="category" class="form-control">
								<% for (CategoryDTO cdto : clist) { %>
								<option value="<%= cdto.getSeq() %>"><%= cdto.getName() %></option>
								<% } %>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" class="form-control" required></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content" class="form-control" required><%= dto.getContent() %></textarea></td>
					</tr>
					<tr>
						<th>소스</th>
						<td>
						
						<input type="file" name="attach" id="attach" class="form-control">
						<div style="margin: 5px 0px;">
							<span class="label label-primary">
								<%= dto.getFilename() %>
								<!-- <span class="glyphicon glyphicon-remove"></span> -->
							</span>
						</div>
						
						</td>
					</tr>
				</table>
				<div>
					<input type="button" value="Back" class="btn btn-default"
						onclick="history.back();">
					<input type="submit" value="Submit" class="btn btn-primary">
					
					<!-- <input type="button" value="Back" class="btn btn-default"
						onclick="test();"> -->
				</div>
				
				<input type="hidden" name="seq" value="<%= seq %>">
				
				</form>
				
			</section>
		</div>
	</body>
</html>























































