<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello</h1>
	<p>
		<%
			//http://localhost:8090/JSPTest/hello.jsp
			Calendar now = Calendar.getInstance();
			/*  */
		%>
		<%-- <%= now %> --%>
		<%= now %>
	</p>
</body>
</html>