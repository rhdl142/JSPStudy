<%@page import="com.test.jsp.auth.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//loginok.jsp
	//1. 데이터 가져오기(id, pw)
	//2. DB연결 + select 작업
	//3.1 맞으면 인증
	//3.2 틀리면 경고
	
	//1
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//2.
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.getConnection();
	//String sql = "select count(*) as cnt from tblAuth where id=? and pw=?";
	String sql = "select * from tblAuth where id=? and pw=?";
	
	stat = conn.prepareStatement(sql);
	stat.setString(1, id);
	stat.setString(2, pw);
	
	rs = stat.executeQuery();
	
	int result = 0;
	
	/* if(rs.next()) {
		result = rs.getInt("cnt"); //1(로그인 성공), 0(로그인 실패)
	} */
	
	String name = "";
	String level = "";
	
	if(rs.next()) {
		result = 1;
		name = rs.getString("name");
		level = rs.getString("lv");
	}
	
	rs.close();
	stat.close();
	conn.close();
	
	//로그인 처리
	if(result == 1) {
		//세션을 사용한 인증 티켓 발급
		//어떤 값이든 상관없지만, 되도록 유저를 구분할 수 있는 식별자를 넣어두면 나중에 요긴하게 사용된다.
		//로그인 성공(아이디), 로그인 실패(null)
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("lv", level);
	}
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
				<% if(result == 1) { %>
					alert("로그인 성공");
					location.href = "index.jsp";
				<% } else { %>
					alert("아이디나 암호가 일치하지 않습니다.");
					history.back();
				<% } %>
			});
		</script>
	</head>
	<body>
		<!-- loginok.jsp -->
		<div class="container">
			<h1 class="page-header"></h1>
			
		</div>
	</body>
</html>