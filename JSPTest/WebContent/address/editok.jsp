<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.jsp.address.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//editok.jsp
	//1. 데이터 가져오기(사용자 수정 내용 입력)
	//2. DB 연결 +  update 작업
	//3. 결과 출력
	
	
	//1.
	request.setCharacterEncoding("UTF-8"); //ISO-8859-1 > UTF-8
	
	String name = request.getParameter("name"); //<input type="text" name="name">
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String seq = request.getParameter("seq");
	//System.out.println(name);
	
	
	//2
	int result = 0;
	
	Connection conn = null;
	PreparedStatement stat = null;
	
	conn = DBUtil.getConnection();
	
	//System.out.println(conn.isClosed());
	
	String sql = "update tblAddress set " +
		    " name = ?,"+
		    " address = ?,"+
		    " age = ?,"+
		    " gender = ?,"+
		    " tel = ? "+
		        " where seq = ?";
	
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, name);
	stat.setString(2, address);
	stat.setString(3, age);
	stat.setString(4, gender);
	stat.setString(5, tel);
	stat.setString(6, seq);
	
	result = stat.executeUpdate();
	
	stat.close();
	conn.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<jsp:include page="inc/asset.jsp"></jsp:include>
<style>

</style>
<script>
	
	$(document).ready(function() {
		//자바스크립트 완료 메시지 출력
		<%-- 
		<% if(result == 1) { %>
			alert("등록이 완료되었습니다.");
			location.href = "list.jsp";
		<% } else { %>
			alert("등록을 실패했습니다.");
			history.back();
		<% } %>
		--%>
	});
	
</script>
</head>
<body>
	<!-- editok.jsp -->
	<div class="container">
		
		<jsp:include page="inc/header.jsp">
			<jsp:param value="Edit" name="context"/>
		</jsp:include>
		
		<section id="main">
			<!-- HTML 완료 메시지 출력 -->
			<div class="panel panel-default" style="width: 250px; margin: 100px auto;">
				<div class="panel-heading">결과</div>
				<div class="panel-body">
					<% if(result == 1) { %>
						<div>수정이 완료되었습니다.</div>
						<div><a href="list.jsp">목록으로 이동하기</a></div>
					<% } else { %>			
						<div>수정을 실패했습니다.</div>
						<div><a href="#" onclick="history.back();">이전 페이지로 이동하기</a></div>
					<% } %>			
				</div>
			</div>
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>













