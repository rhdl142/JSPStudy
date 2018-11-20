<%@page import="java.io.File"%>
<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//delok.jsp
	//1. 데이터 가져오기(seq)
	//2. DAO 위임 -> delete 실행
	//3. 결과 메시지 -> 이동
	
	//1.
	String seq = request.getParameter("seq");
	
	//2.
	CodeDAO dao = new CodeDAO();
	
	//첨부 파일명 알아내서 삭제 작업
	CodeDTO dto = dao.get(seq);
	
	File file = new File(application.getRealPath("code/files")+"\\"+dto.getFilename());
	
	if(file.exists()) {
		System.out.println(file.delete());
	}
	
	int result = dao.del(seq); //글 삭제
	
	//추가 세션의 cnt - 1
	if(result == 1) {
		session.setAttribute("cnt", Integer.parseInt(session.getAttribute("cnt").toString()) - 1);
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
				alert("삭제 성공!!");
				location.href = "<%= application.getContextPath() %>/code/list.jsp";
				<% } else { %>
				alert("삭제 실패!!");
				history.back();
				<% } %>
			});
		</script>
	</head>
	<body>
		<!-- delok.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			
			<section>
				<h1 class="page-header">CODE</h1>
			</section>
		</div>
	</body>
</html>























































