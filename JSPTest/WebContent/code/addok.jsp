<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//addok.jsp
	//1. 데이터 가져오기
	//2. DAO 위임 -> insert 실행
	//3. 결과 메시지 -> 이동
	
	//1.
	request.setCharacterEncoding("UTF-8");
	
	//String category = request.getParameter("category");
	//String subject = request.getParameter("subject");
	//String content = request.getParameter("content");
	//String attach = request.getParameter("attach");
	
	String category = "";
	String subject = "";
	String content = "";
	String filename = "";
	
	MultipartRequest multi = new MultipartRequest(
									request,
									application.getRealPath("code/files"),
									10 * 1024 * 1024,
									"UTF-8",
									new DefaultFileRenamePolicy()
								);
	
	category = multi.getParameter("category");
	subject = multi.getParameter("subject");
	content = multi.getParameter("content");
	filename = multi.getFilesystemName("attach"); //첨부 파일명(소스 파일명)
	
	//2.
	CodeDAO dao = new CodeDAO();
	
	CodeDTO dto = new CodeDTO();
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setCategory(category);
	dto.setId(session.getAttribute("id").toString());
	dto.setFilename(filename);
	
	int result = dao.add(dto);
	
	//추가 세션의 cnt + 1
	if(result == 1) {
		session.setAttribute("cnt", Integer.parseInt(session.getAttribute("cnt").toString()) + 1);
	}
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
				<% if(result == 1) { %>
				alert("등록성공!!");
				location.href = "<%= application.getContextPath() %>/code/list.jsp";
				<% } else { %>
				alert("등록 실패;;");
				history.back();
				<% } %>
			});
		</script>
	</head>
	<body>
		<!-- addok.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			
			<section>
				<h1 class="page-header">CODE</h1>
			</section>
		</div>
	</body>
</html>























































