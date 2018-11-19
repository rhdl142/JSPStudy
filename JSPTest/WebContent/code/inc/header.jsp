<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			<!-- inc > header.jsp -->
			<header>
				<nav>
					<ul>
						<li><a href="<%=application.getContextPath() %>/code/index.jsp">Home</a></li>
						<li><a href="<%=application.getContextPath() %>/code/member.jsp">Member</a></li>
						<li><a href="<%=application.getContextPath() %>/code/list.jsp">Code</a></li>
						<li><a href="">Etc</a></li>
						<li><a href="">Etc</a></li>
					</ul>
				</nav>
				
				<!-- 로그인한 회원 정보 창 -->
				<% if(session.getAttribute("id") != null) {%>
				<div id="info">
					<h3>My Info</h3>
					
					<div>아이디 : <%= session.getAttribute("id") %></div>
					<div>이름 : <%=session.getAttribute("name") %></div>
					<div>레벨 : lv<%=session.getAttribute("lv") %></div>
					<div>작성글 : <%=session.getAttribute("cnt") %>개</div>
				</div>
				<% } %>
			</header>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			