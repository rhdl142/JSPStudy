<%@page import="com.test.jsp.code.MemberDAO"%>
<%@page import="com.test.jsp.code.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//loginok.jsp
	//1. 데이터 가져오기(id, pw)
	//2. DAO 위임 > select > 결과
	//3. 결과 > 인증 처리
	
	//1.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//2.
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	
	MemberDAO dao = new MemberDAO();
	
	dto = dao.login(dto);
	
	if(dto != null) {
		session.setAttribute("id", dto.getId());
		session.setAttribute("name", dto.getName());
		session.setAttribute("lv", dto.getLv());
		session.setAttribute("cnt", dto.getCnt());
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
				<% if(dto != null) { %>
				location.href = "<%= application.getContextPath() %>/code/member.jsp";
				<% } else { %>
				history.back();
				<% } %>
			});
		</script>
	</head>
	<body>
		<!-- loginok.jsp -->
		
		<div id="main">
		
			<jsp:include page="inc/header.jsp"></jsp:include>
			
			<section>
				<h1 class="page-header"></h1>
			</section>
		</div>
	</body>
</html>























































