<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	//DB -> select
	/*
	Random rnd = new Random();
	int num = rnd.nextInt(100);
	num *= 2; //가공 
	*/
	
	
	/* public int getNum() {
	   Random rnd = new Random();
	   int num = rnd.nextInt(100);
	   num *= 2;
	   return num;
	} */
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<%@ include file="inc/asset.jsp"%>
		<style>
		</style>
		<script>
		
		   $(document).ready(function() {
		   
		   });
		
		</script>
	</head>
	<body>
		<!-- ex04_declaration.jsp -->
		<p>
			결과 :
			<%= getNum() %></p>
	
	
	</body>
</html>

<%!
public int getNum() {
   Random rnd = new Random();
   int num = rnd.nextInt(100);
   num *= 2;
   return num;
}

%>