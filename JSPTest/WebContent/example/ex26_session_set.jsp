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
	<!-- ex26_session_set.jsp -->
	<%
	
	//업무
	session.setAttribute("data", "홍길동");
	session.setAttribute("result", true);
	
	String[] list = {"강아지", "고양이", "거북이"};
	session.setAttribute("list", list);
	
	
	//response.sendRedirect("ex26_session.jsp");
	
	%>
	세션값을 저장했습니다.
	
	<script>
		alert("세션값을 저장했습니다.");
		location.href = "ex26_session.jsp";
	</script>
	
	
	
	
</body>
</html>













