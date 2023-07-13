<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--
	dbgb_write.html ================> 에서 form에서 넘어오는 값을 받아서 DB에 저장하는 파일
	
	request : 클라이언트 정보를 서버에서 읽어오는 객체(JSP 의 내장 객체)
	response : 서버의 정보를 클라이언트에게 보내는 객체 (JSP의 내장 객체)
	
	request.getParameter("변수명") : get, post 방식으로 넘어오는 변수를 받는 메소드
		get : form, <a href = "http://localhost:8080/saver.jsp?변수명=값&변수명=값&변수명=값> </a>
		post : form 
	-- 모든 데이터는 string으로 넘어온다.
 -->
 
 <%@ page import = "java.sql.*,java.util.*" %>
 
 <!--  클라이언트에서 넘어오는 한글이 깨어지지 않게 처리  -->
 <% request.setCharacterEncoding("UTF-8"); %>
 
 
 <!-- dbgb_write.html 폼에서 넘어오는 변수의 값을 받아서 새로운 변수에 할당.  -->
 <%
 	String na = request.getParameter("name");
 	String em = request.getParameter("email");
 	String sub = request.getParameter("subject");
 	String cont = request.getParameter("content");
 	String ymd = (new java.util.Date()).toLocaleString();	// 현재 시스템의 날짜를 생성해서 String로 변환
 	
 %>
 
 <!-- 오라클 DB 연결 -->
 <%@ include file = "../DB_Connection/db_conn_oracle.jsp" %>
 
  
  <%
	 // Client 에서 폼에서 넘어오는 값을 DataBase에 저장
	String sql = null;		// sql : DataBase에 insert 쿼리를 담은 문자열.
	PreparedStatement pstmt = null;		// Statement
	
	sql = "insert into guestboard(name, email, inputdate, subject, content)";
	sql = sql + "values (?,?,?,?,?)";
	
	// PreparedStatement 객체 생성 : 퉈리를 DB에 (inser, update, delet) 쿼리를 실행하는 객체
	// PreparedStatement : Connection 객체의 createStatement()로 객체를 활성화
	pstmt = conn.prepareStatement(sql);
	
	// ?로 처리된 변수에 값 할당.
	pstmt.setString (1, na);		// 첫번째 ? <== na
	pstmt.setString (2, em);		// 두번째 ? <== em
	pstmt.setString (3, sub);		// 세번째 ? <== sub
	pstmt.setString (4, cont);		// 네번째 ? <== cont
	pstmt.setString (5, ymd);		// 다섯번째 ? <== cont
	
	// 실행
	
	
	try {
	// stmt 객체에 sql 쿼리를 넣어서 DB에 저장 :
	pstmt.executeUpdate(sql); // insert, update, delet 쿼리일때 사용, 톰켓 기본설정은 commit이 작동됨
		// DB 연결에 문제가 생길시 오류발생 : try catch 로 묶어 주어야 한다.
	} catch (Exception e){
		// 오류 발생시 실행
		out.println("DB연결에 문제가 발생했습니다. 고객센터로 연락 바랍니다. 010-111-1111");
	}finally {
		conn.close();
		pstmt.close();
	}
	
%>
<!--  클라이언트의 값을 DB에 저장후 페이지 이동  -->
<jsp:forware page = "dbgb_show.jsp"/>
 
<
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3> 클라이언트에서 넘어오는 변수를 받아서 출력 </h3>
	<div> <%= na %></div>
	<div> <%= em %></div>
	<div> <%= sub %></div>
	<div> <%= cont %></div>
	<div> <%= ymd %></div>
	
	
	
</body>
</html>