<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>
	
	$(document).ready(function() {
	
	});
	
</script>
</head>
<body>
	<!-- ex19_forward_one.jsp -->
	<div class="container">
		<h1 class="page-header">첫번째 페이지</h1>
	</div>
	
	<script>
		//location.href = "ex19_forward_two.jsp";
	</script>
	
	<%
		request.setAttribute("num", 100);
		
		//response.sendRedirect("ex19_forward_two.jsp");
		//pageContext.forward("ex19_forward_two.jsp");
	%>
	
	<jsp:forward page="ex19_forward_two.jsp"></jsp:forward> 
	
</body>
</html>

<%--

<div></div>
<jsp:div></jsp:div>

1. div -> 태그명
2. jsp: -> 네임스페이스(Namespace) == 자바의 패키지 역할

네임스페이스
- 태그들을 관리하기 위한 공간(논리적인 그룹 식별자)

XML
- 태그를 사용자가 마음대로 정의할 수 있다.
- 모든 태그는 전세계에서 유일하게 구분할 수 있도록 이름을 만들자!!!
- 그룹명 : 중복되지 않을만한 이름 -> 도메인(http://test.com)

개발자(홍길동)
<http://test.com:정보 http://test.com:번호="1">
	<http://test.com:이름>홍길동</http://test.com:이름>
	<http://test.com:나이>20</http://test.com:나이>
</http://test.com:정보>


개발자(아무개) - http://pet.com
<pet:정보 pet:번호="1" namespace:pet="http://pet.com">
	<pet:이름>멍멍이</pet:이름>
	<pet:나이>2</pet:나이>
</pet:정보>


개발자(테스트)
<연결>
	<정보 번호="1">
		<이름>홍길동</이름>
		<나이>20</나이>
	</정보>
	<정보 번호="1">
		<이름>멍멍이</이름>
		<나이>2</나이>
	</정보>
	<사람:정보 사람:번호="1">
		<사람:이름>홍길동</사람:이름>
		<사람:나이>20</사람:나이>
	</사람:정보>
	<강아지:정보 강아지:번호="1">
		<강아지:이름>멍멍이</강아지:이름>
		<강아지:나이>2</강아지:나이>
	</강아지:정보>
</연결>

--%>



























