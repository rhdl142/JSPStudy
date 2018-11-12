<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" errorPage="error.jsp"%>
<%@ page import = "java.util.*" %>

<!--  
	제작자 : 홍길동
	작성일 : 2018-11-12
	설명 : 첫번째 예제 입니다.
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex01.jsp -->
	<%
		//자바 영역
		Random rnd = new Random();
		Calendar c = Calendar.getInstance();
	%>
	
	<%
		for(int i=0; i<10; i++) {
	%>
			<p>안녕하세요<%=i %></p>
	<%
		}
	
		int num = 0;
		int result = 100 / num;
	%>
</body>
</html>