<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//editok.jsp
	// - request -> MultipartRequest 수정
	//1. 데이터 가져오기
	//2. DAO 위임 -> update 실행
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
	String seq = "";
	
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
	seq = multi.getParameter("seq");
	
	//첨부 파일을 수정했다면.. 파일명 존재, 수정안했다면.. 비어있다.?
	filename = multi.getFilesystemName("attach"); //첨부 파일명(소스 파일명)
	
	System.out.println(category);
	System.out.println(subject);
	System.out.println(content);
	System.out.println(filename == null);
	System.out.println(filename == "");
	
	//2.
	CodeDAO dao = new CodeDAO();
	
	CodeDTO dto = new CodeDTO();
	
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setCategory(category);
	//dto.setId(session.getAttribute("id").toString());
	dto.setFilename(filename);//수정O : 새파일명, 수정X : null
	dto.setSeq(seq);//where절
	
	int result = dao.edit(dto); //글수정
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
		<!-- editok.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			
			<section>
				<h1 class="page-header">CODE</h1>
			</section>
		</div>
	</body>
</html>























































