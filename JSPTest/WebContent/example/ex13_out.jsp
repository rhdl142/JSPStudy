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
	<!-- ex13_out.jsp -->
	
	<div class="container">
		<h1 class="page-header">구구단</h1>
		
		<%
			int dan = 5;
		%>
		
		<h2><%= dan %>단 - 스크립틀릿 + 표현식</h2>
		
		<!-- 
		
		서블릿.java
		
		doGet() {
			for (int i=1; i<=9; i++) {
				//writer.print("<div>5 x 1 = 5</div>");
				writer.print("<div>5 x ");
				writer.print(i);
				writer.print(" = 5</div>");
			}
		}
		
				
		-->
		
		<% for (int i=1; i<=9; i++) { %>
		<div><%= dan %> x <%= i %> = <%= dan * i %></div>
		<% } %>
		
		
		<%
			//out.clear(); //여태껏 만든 임시 페이지 내용을 브라우저에게 돌려주지 말고 버려라.
			//out.flush(); //여태껏 만든 임시 페이지 내용을 일단 브라우저에게 돌려보낸다. 내용을 다시 초기화하고 아래 내용부터 임시 페이지 만들기 시작한다. - 페이지가 너무 길때
		%>
		
		<h2><%= dan %>단 - out 내장객체</h2>
		
		<%
		
		for (int i=1; i<=9; i++) {
		
			//서블릿의 PrintWriter 객체와 동일한 업무를 한다.
			//out.println("<div>5 x 1 = 5</div>");
			out.println(String.format("<div>%d x %d = %d</div>", dan, i, dan * i));
			
		}
		
		//out.close(); //임시 페이지 만드는 작업 중단하고 여태까지 만든 것만 브라우저에게 돌려줘라.
		
		%>
		
		
	
	</div>
	
</body>
</html>
















