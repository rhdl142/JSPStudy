<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
   
   //업무 코드
   // - 페이지 출력과 직접 관계없는 코드는 주로 HTML 최상단/최하단에 배치
   // - 업쿠 모(Java)와 디자인 코드(HTML)는 되도록 분리시킨다.
   Calendar now  = Calendar.getInstance();
   
   String tag = "";
   String tag2 = "";
   String tag3 = "";
   
   boolean isAuth = true;
   String color = "";
   if (isAuth) {
      color = "red";
   } else {
      color = "blue";
   }
   
   if (now.get(Calendar.SECOND) % 3 == 0) {
      tag = "h1";
      tag2 = "<h1>";
      tag3 = "</h1>";
   } else if (now.get(Calendar.SECOND) % 3 == 1) {
      tag = "h3";
      tag2 = "<h3>";
      tag3 = "</h3>";
   } else {
      tag = "h5";
      tag2 = "<h5>";
      tag3 = "</h5>";
   }
   
String name = "홍길동"; //로그인 유저명

   
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
      alert("<%= name %>님 안녕하세요.");
   });

</script>
</head>
<body>
	<!-- ex03_scriptlet.jsp  -->

	<!-- CSS 제어 -->
	<h1 style="color: <%= color %>;">JSP 표현식</h1>

	<%
   
   //자바 코드 영역
   int a = 10;
   int b = 20;
   
   //개발자용
   //System.out.println(a);
   //System.out.println(b);
   
   %>

	<p>
		출력(PCDATA)<%= a %></p>
	<h3><%= b %></h3>



	<!-- 디자인 코드 -->
	<p>
		현재 서버 시간 :
		<%= String.format("%tF", now) %>
	</p>

	<!-- 동적으로 태그를 생성 -->
	<%= tag2 %>제목입니다.<%= tag3 %>
	<%= tag2 %>제목입니다.<%= tag3 %>

</body>
</html>