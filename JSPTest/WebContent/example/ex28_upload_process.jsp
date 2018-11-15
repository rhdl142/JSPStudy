<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   // 1. 제목, 이름 받기 > request.getParameter()
   // 2. 첨부파일 받기 > 별도 조치 > 첨부 파일 처리 : 웹 작업(X), 로컬 작업(O)

   // 첨부 파일 저장 경로
   // - 웹 경로 : "./files" (X) -> 자바 경로 : ".\\files"
   // - 웹 경로 : "/JSPTest/example/files" -> 자바 경로 : "C:\class\WebSerber\JSPTest\WebContent\example\files"

   // 첨부파일 저장 경로 지정
   // String path = ".\\files";
   //String path = "C:\Class\WebServer\JSPTest\WebContent\example\files";

   //C:\Class\WebServer\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest
   //C:\Class\WebServer\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\example\files
   //C:\Class\WebServer\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\example\files
   String path = application.getRealPath("./example/files");
   //System.out.println(path);

   // 업로드 파일의 최대 크기 지정
   // - 단위 : 바이트
   // - 가능한 작게
   int size = 100 * 1024 * 1024; // 100MB

   // 변수
   String subject = ""; // 제목
   String name = ""; // 이름
   String filename = ""; // 첨부파일명
   String orgfilename = ""; // 첨부파일명

   //<form enctype="multipart/form-data">로 지정하면 request.getParameter() 가 동작하지 않는다.
   //subject = request.getParameter("subject");
   //System.out.println(subject);

   try {

      //request -> MultipartRequest(cos.jar)
      MultipartRequest multi = new MultipartRequest(request, // 기존 request 객체
            path, // 파일 업로드 폴더 경로
            size, // 최대 크기
            "UTF-8", // 인코딩 방식
            new DefaultFileRenamePolicy() // 중복 파일명 관리(처리)
      ); //객체 생성 == 파일 업로드 완료(******)
      // 업무 - bootstrap-3.3.2-dist.zip vs bootstrap-3.3.2-dist8.zip
      // -> 확보 데이터 : 제목, 이름, 첨부파일(실제 파일), 첨부파일명(원본명), 첨부파일명(저장명)
      //일반 데이터 (텍스트)
      subject = multi.getParameter("subject");
      name = multi.getParameter("name");

      // 첨부파일(실제 파일) : 완료
      // 첨부파일명(원본, 물리)

      //<input type ="file">의 이름들을...
      Enumeration e = multi.getFileNames();

      while (e.hasMoreElements()) {
         System.out.println(e.nextElement());
      }

      filename = multi.getFilesystemName("attach");
      orgfilename = multi.getOriginalFileName("attach");

      System.out.println(filename); // 물리 파일명
      System.out.println(orgfilename); // 원본 파일명
      System.out.println(subject);
      System.out.println(name);

      //확보 데이터 -> 업무 처리(DB 저장)
      // - 첨부 파일을 오라클에 저장하나요???? > 안해요..
      // - 이진 데이터(바이너리 데이터, 첨부파일)를 오라클의 테이블안에 직접 저장하나요?
      //      > 할 수 있다.(이진 데이터 저장 가능) + 안해요(인코딩, 디코딩)
      //      > 첨부파일 폴더 저장(안전하게..)
      //      > 데이터베이스 파일명만 저장(물리, 원본)

   } catch (Exception e) {
      System.out.println(e.toString());
   }
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
   <!-- ex28_upload_process.jsp -->

   <div class="container">
      <h1 class="page-header">파일 업로드 결과</h1>
      
      <div>제목 : <%= subject %></div>
      <div>이름 : <%= name %></div>
      <div>파일명(서버저장) : <%= filename %></div>
      <div>파일명(고객원본) : <%= orgfilename %></div>
      
      <hr>
      
      <div>다운로드 : <a href="files/<%= filename %>"><%= orgfilename %></a></div>
      
      <div>다운로드 : <a href="download.jsp?filename=<%= filename %>&orgfilename=<%= orgfilename %>"><%= orgfilename %></a></div>
      


   </div>


</body>
</html>


