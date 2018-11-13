<%@page import="java.util.Enumeration"%>
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
		<!-- ex08_request_header.jsp -->
		
		<!-- <h1>HTTP 요청 메세지 해더 정보</h1> -->
		<h1>광민아 수업좀 듣자 제발</h1>
		
		<table class="table">
			<tr>
				<th>헤더명</th>
				<th>헤더값</th>
			</tr>
			<%
         		Enumeration<String> e =	request.getHeaderNames();
			
				while(e.hasMoreElements()) {
					String headerName = e.nextElement();
					//System.out.println(headerName + ":" +request.getHeader(headerName));
     		%>
	      <tr>
	         <td><%= headerName %></td>
	         <td><%= request.getHeader(headerName) %></td>
	      </tr>
	      <%
	      }
	      %>
		</table>
		
		<hr />
		
		<p>서버 도메인명 : <%= request.getServerName() %></p>
		<p>서버 포트 : <%= request.getServerPort() %></p>
		<p>요청 URL : <%= request.getRequestURL() %></p>
		<p>요청 쿼리 : <%= request.getQueryString() %></p>
		<p>클라이언트 호스트 : <%= request.getRemoteHost() %></p>
		<p>클라이언트 IP : <%= request.getRemoteAddr() %></p>
		<p>프로토콜 : <%= request.getProtocol() %></p>
		<p>요청 방식 : <%= request.getMethod() %></p>
		<p>컨텍스트 경로(**) : <%= request.getContextPath() %></p>
		
		<h2>상대 경로</h2>
		<img src="../images/catty01.png" alt="" />
		
		<h2>절대 경로</h2>
		<img src="/JSPTest/images/catty01.png" alt="" />
		
		
	</body>
</html>