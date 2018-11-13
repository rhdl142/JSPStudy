<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//response.sendRedirect(url) vs pageContext.forward(url)
	//	- 둘 다 서버측 이동
	
	
	//response.sendRedirect(url) vs pageContext.forward(url)
	//	- 둘 다 서버측 이동
	//	- 표면상 차이점
	//		a.sendRedirect() : 두번째 페이지 URL로 고정
	//요구사항] 첫번째 페이지에서 사용함던 자원을 두번째 페이지에서 계속 사용하고 싶다
	int num = 100;
	
	//페이지와 페이지간의 데이터 전달하는 역활
	request.setAttribute("num", num);
	
	//한 페이지 > (데이터) > 다른 페이지
	//1. 상태 유지 필요 : forward()
	//2. 꺠끗하게 새로 시작 : sendRedirect()

	//1.
	//response.sendRedirect("ex12_pageContext_two.jsp");

	//2
	//pageContext.forward("ex12_pageContext_two.jsp");
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
		<!-- ex12_pagecontext_one.jsp -->
		
		<h1>첫번쨰 페이지</h1>
	</body>
</html>