<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<!-- ex10_method_one.jsp -->
		<h1>두번쨰 페이지를 부르는 역활(서버에게 페이지를 달라고 요청)</h1>
		
		<h2>POST 요청</h2>
		<ul>
			<li>폼 태그 method="post"로 전송하는 경우</li>
		</ul>
		
	   <form method="post" action="ex10_method_two.jsp">
	      <input type="submit" value="보내기">
	   </form>
	   
	   <h2>GET 요청</h2>
	   
	   <ul>
	      <li>폼 태그 method="get""로 전송하는 경우</li>
	      <li>링크를 통해 이동하는 경우</li>
	      <li>자바스크립트로 이동하는 경우</li>
	      <li>새로고침을 하는 경우</li>
	   </ul>
	   
	   <form method="get" action="ex10_method_two.jsp">
	      <input type="submit" value="보내기">
	   </form>
	   
	   <div><a href="ex10_method_two.jsp">두번쨰 페이지</a></div>
	   
	   <script>
	   		//location.href = "ex10_method_two.jsp";
	   </script>
	</body>
</html>