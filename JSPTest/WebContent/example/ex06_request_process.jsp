<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%
	//페이지 상단 : 출력과 관계없는 행동 + 출력하기 전 미리해야 하는 행동 = 코드 분리
	
	//1. 데이터 받기(클라이언트 > 서버) = request 담당자
	//	- String request.getParameter("폼태그의 name 값") 클라이언트로부터 전송된 데이터 수신
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");

	System.out.println(name);
	System.out.println(gender);
	
	System.out.println(name == null);
	System.out.println(name == "");
%>

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
	
	</body>
</html>