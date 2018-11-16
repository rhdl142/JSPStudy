<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.jsp.address.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//클라이언트가 입력한 한글 -> 서버 전송 : 깨지는 경우
	//A. GET
	// - 데이터를 URL에 붙여서 넘기는 방식
	// - 데이터(Query String)를 아파치톰캣이 넘긴다는 뜻
	// - 아파치톰캣이 담당이라 데이터 인코딩(디코딩) 처리를 아파치 톰캣 설정에 의해서 한다.
	// - ~ Apache Tomcat 8.0 ~ : 기본 인코딩 UTF-8
	// - ~ 톰캣내에서 작동하는 JSP(자바) : UTF-8
	// - ~ 브라우저(입력) > 인터넷(ISO-8859-1) > 아파치 톰캣 > (전달) > JSP(UTF-8)
	
	//B. POST
	// - 데이터를 패킷 본문에서 넣어서 넘기는 방식
	// - 아파치 톰캣이 관여 못함(아파치톰캣의 인코딩과는 전혀 상관없다)
	// - 브라우저(입력) > 인터넷(ISO-8859-1) > (전달) > JPS(UTF-8)
	// - 사용자(개발자)가 직접 인코딩 처리를 해야 한다.


	//addok.jsp
	//1. 데이터 가져오기(사용자 입력)
	//2. DB 연결 +  insert 작업
	//3. 결과 출력
	
	
	//1.
	request.setCharacterEncoding("UTF-8"); //ISO-8859-1 > UTF-8
	
	String name = request.getParameter("name"); //<input type="text" name="name">
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	//System.out.println(name);
	
	
	//2
	int result = 0;
	
	Connection conn = null;
	PreparedStatement stat = null;
	
	conn = DBUtil.getConnection();
	
	//System.out.println(conn.isClosed());
	
	String sql = "insert into tblAddress (seq, name, address, age, gender, tel) values (address_seq.nextval, ?, ?, ?, ?, ?)";
	
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, name);
	stat.setString(2, address);
	stat.setString(3, age);
	stat.setString(4, gender);
	stat.setString(5, tel);
	
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
	<!-- addok.jsp -->
	<div class="container">
		
		<jsp:include page="inc/header.jsp">
			<jsp:param value="Register" name="context"/>
		</jsp:include>
		
		<section id="main">
			<!-- HTML 완료 메시지 출력 -->
			<div class="panel panel-default" style="width: 250px; margin: 100px auto;">
				<div class="panel-heading">결과</div>
				<div class="panel-body">
					<% if(result == 1) { %>
						<div>등록이 완료되었습니다.</div>
						<div><a href="list.jsp">목록으로 이동하기</a></div>
					<% } else { %>			
						<div>등록이 실패했습니다.</div>
						<div><a href="#" onclick="history.back();">이전 페이지로 이동하기</a></div>
					<% } %>			
				</div>
			</div>
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>













