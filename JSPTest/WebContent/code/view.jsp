<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//view.jsp
	//	- <a href="view.jsp>seq=1">제목</a>
	//	1. 데이터 가져오기(seq)
	//	2. DAO 위임 > select > 글 1개의 모든 내용 반환(DTO)
	//	3. 출력(상세보기)
	
	//1.
	String seq = request.getParameter("seq");
	
	//2.
	CodeDAO dao = new CodeDAO();
	
	CodeDTO dto = dao.get(seq);

	//3. 소스파일의 내용 읽기
	String path = application.getRealPath("code/files") + "\\" + dto.getFilename();
	
	System.out.println(path);
	
	BufferedReader reader = new BufferedReader(new FileReader(path));
	
	String txt = "";
	String source = "";
	
	while ((txt = reader.readLine()) != null) {
	   source += txt + "\r\n";
	   
	}
	
	reader.close();
	
	//Prism : 카테고리 > Prism 키워드로 변환
	//https://prismjs.com/
	String keyword = "";
	
	if(dto.getCategory().equals("1")) {
		keyword = "java";
	} else if(dto.getCategory().equals("2")) {
		keyword = "sql";
	} else if(dto.getCategory().equals("3")) {
		keyword = "markup";
	} else if(dto.getCategory().equals("4")) {
		keyword = "css";
	} else if(dto.getCategory().equals("5")) {
		keyword = "javascript";
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Code</title>
		<%@ include file="inc/asset.jsp" %>
		<link rel="stylesheet" href="css/prism.css" />
		<script src="js/prism.js"></script>
		<style>
			#photo {
				width : 128px;
				height : 200px;
			}
			
			#tbl th { width : 150px; }
			#tbl tr:nth-child(1) td:last-child { width :140px; text-align:center; vertical-align:middle; }
			#tbl tr:nth-child(1) td:nth-child(even) { width : calc((100% - 440px) / 2); }
			#tbl tr:last-child td { padding : 25px; line-height: 3em; }
		</style>
		<script>
			$(document).ready(function(){
	
			});
		</script>
	</head>
	<body>
		<!-- view.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			<section>
				<h1 class="page-header">CODE</h1>
				
				<table id="tbl" class="table table-bordered">
				<tr>
					<th>이름</th>
					<td><%= dto.getName() %></td>
					<th>아이디</th>
					<td><%= dto.getId() %></td>
					<td rowspan="4"><img id="photo" src="images/<%= dto.getId() %>.jpg"></td>
				</tr>
				<tr>
					<th>번호</th>
					<td><%= dto.getSeq() %></td>
					<th>날짜</th>
					<td><%= dto.getRegdate() %></td>
				</tr>
				<tr>
					<th>분류</th>
					<td colspan="3"><%= dto.getCategoryName() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%= dto.getSubject() %></td>
				</tr>
				<tr>
					<td colspan="5">
						<pre><code class="language-<%= keyword %>"><%= source.replace("<","&lt;").replace(">", "&gt;") %></code></pre>
					</td>
				</tr>
				<tr>
					<td colspan="5"><%= dto.getContent().replace("\r\n","<br>").replace(" ","&nbsp") %></td>
				</tr>
			</table>
			
			<div>
				<input type="button" value="Back" class="btn btn-default" onclick="history.back();">
				<!-- 글 작성자에게만 노출 -->
				<% if(session.getAttribute("id").toString().equals(dto.getId()) || session.getAttribute("lv").toString().equals("2")) { %>
				<input type="button" value="Edit" class="btn btn-primary" onclick="location.href='edit.jsp?seq=<%= dto.getSeq() %>';">
				<input type="button" value="Delete" class="btn btn-primary" onclick="location.href='del.jsp?seq=<%= dto.getSeq() %>';">
				<% } %>
			</div>
			
			</section>
		</div>
	</body>
</html>























































