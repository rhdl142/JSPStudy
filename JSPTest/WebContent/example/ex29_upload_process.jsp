<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//파일 경로
	String path = application.getRealPath("./example/files");

	//최대 크기(100M)
	int size = 100 * 1024 * 1024;
	
	//변수
	String name = "";
	String birth = "";
	String tel = "";
	String address = "";
	
	String pic = ""; //물리명
	String orgpic = ""; //원본명
	
	ArrayList<String> doc = new ArrayList<String>();
	ArrayList<String> orgdoc = new ArrayList<String>();
	
	try {
		//multi 객체 생성
		MultipartRequest multi = new MultipartRequest(
										request,
										path,
										size,
										"UTF-8",
										new DefaultFileRenamePolicy()
										);//파일 업로드 이미 완료 > 추후에 > 파일명 가져오기
		
		//데이터 가져오기
		name = multi.getParameter("name");
		birth = multi.getParameter("birth");
		tel = multi.getParameter("tel");
		address = multi.getParameter("address");
		
		//증명 사진 가져오기
		pic = multi.getFilesystemName("pic"); //물리명
		orgpic = multi.getFilesystemName("pic"); //원본명
		
		//증명 서류 가져오기(1개 이상)
		Enumeration e = multi.getFileNames();
		
		while(e.hasMoreElements()) {
			String temp = e.nextElement().toString();
			
			doc.add(multi.getFilesystemName(temp));   //물리명
			orgdoc.add(multi.getOriginalFileName(temp)); //원본명
		}
	} catch(Exception e) {
		System.out.println(e.toString());
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
	
			});
		</script>
	</head>
	<body>
		<!-- ex29_upload_process.jsp -->
		<div class="container">
			<h1 class="page-header">제출 결과</h1>
			<table class="table table-bordered" style="width: 600px;">
				<tr>
					<th style="width:100px;">이름</th>
					<td style="width:200px;"><%=name %></td>
					<th style="width:100px;">생년월일</th>
					<td style="width:200px;"><%=birth %></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><%=tel %></td>
					<th>주소</th>
					<td><%=address %></td>
				</tr>
				<tr>
					<th>증명사진</th>
					<td colspan="3"><img src="<%=request.getContextPath() %>/example/files/<%=pic %>" /></td>
				</tr>
				<tr>
					<th>증명서류</th>
					<td colspan="3">
						<%
							for(int i=0; i<doc.size(); i++) {
						%>
						<div><a href="download.jsp?filename=<%=doc.get(i) %>&orgfilename=<%=orgdoc.get(i) %>"><%=orgdoc.get(i) %></a></div>
						<%
							}
						%>
					</td>
				</tr>
		</table>
		</div>
	</body>
</html>