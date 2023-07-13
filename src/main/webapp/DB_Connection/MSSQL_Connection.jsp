<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"  %>

<!--  
	java.sql 패키지 내부의 모든 클래스를 가져온다. 
	
	Connection 객체 :  DataBase를 연결 하는 객체 
	
	Statement 객체 : 			DB에 쿼리를 보내는 객체, ( Insert, update, delete )
	PreparedStatement 객체 : Statement 를 개선 해서 만든 객체, 
	
	ResultSet 객체 : DataBase에서 Select 한값을 가져오는 객체  ( Select 한 레코드셋을 담은 객체 ) 
	
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS-SQL Connection</title>
</head>
<body>
	<h2> MSSQL Connection </h2>

	<%
		Connection conn = null; 	// Connection 객체 변수 초기화 
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myDB;encrypt=false"; 
		
		Boolean connect = false ;     // DB 접속이 성공했는지 알려주는 변수
		
		try {
			
		Class.forName(driver);    // 해당경로에 OracleDriver 클래스가 존재하는지 확인
		conn = DriverManager.getConnection(url, "sa", "1234"); 		
		connect = true; 
			
		} catch (Exception e) {		
		connect = false; 		
		}
		
	  // connect 변수가 true : DB 접속 성공 , false : DB 접속 실패 
	  
	  if ( connect == true) {
		  out.println ("MSSQL Server 에 잘 접속 되었습니다. "); 
	  }else {
		  out.println ("MSSQL Server 에 실패 되었습니다. "); 
	  }
	  
	%>



</body>
</html>