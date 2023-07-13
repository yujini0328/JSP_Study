<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--
	dbgb_write.html ================> ���� form���� �Ѿ���� ���� �޾Ƽ� DB�� �����ϴ� ����
	
	request : Ŭ���̾�Ʈ ������ �������� �о���� ��ü(JSP �� ���� ��ü)
	response : ������ ������ Ŭ���̾�Ʈ���� ������ ��ü (JSP�� ���� ��ü)
	
	request.getParameter("������") : get, post ������� �Ѿ���� ������ �޴� �޼ҵ�
		get : form, <a href = "http://localhost:8080/saver.jsp?������=��&������=��&������=��> </a>
		post : form 
	-- ��� �����ʹ� string���� �Ѿ�´�.
 -->
 
 <%@ page import = "java.sql.*,java.util.*" %>
 
 <!--  Ŭ���̾�Ʈ���� �Ѿ���� �ѱ��� �������� �ʰ� ó��  -->
 <% request.setCharacterEncoding("UTF-8"); %>
 
 
 <!-- dbgb_write.html ������ �Ѿ���� ������ ���� �޾Ƽ� ���ο� ������ �Ҵ�.  -->
 <%
 	String na = request.getParameter("name");
 	String em = request.getParameter("email");
 	String sub = request.getParameter("subject");
 	String cont = request.getParameter("content");
 	String ymd = (new java.util.Date()).toLocaleString();	// ���� �ý����� ��¥�� �����ؼ� String�� ��ȯ
 	
 %>
 
 <!-- ����Ŭ DB ���� -->
 <%@ include file = "../DB_Connection/db_conn_oracle.jsp" %>
 
  
  <%
	 // Client ���� ������ �Ѿ���� ���� DataBase�� ����
	String sql = null;
	Statement stmt = null;		// Statement
	
	// Statement ��ü ���� : ������ DB�� (inser, update, delet) ������ �����ϴ� ��ü
	// Statement : Connection ��ü�� createStatement()�� ��ü�� Ȱ��ȭ
	stmt = conn.createStatement();
	
	sql = "insert into guestboard(name, email, inputdate, subject, content)";
	sql = sql + "values ('" + na + "'," + em + "','" + ymd + "','" + sub + "','" + cont + "')";
	
	try {
	// stmt ��ü�� sql ������ �־ DB�� ���� :
	stmt.executeUpdate(sql); // insert, update, delet �����϶� ���, ���� �⺻������ commit�� �۵���
		// DB ���ῡ ������ ����� �����߻� : try catch �� ���� �־�� �Ѵ�.
	} catch (Exception e){
		// ���� �߻��� ����
		out.println("DB���ῡ ������ �߻��߽��ϴ�. �����ͷ� ���� �ٶ��ϴ�. 010-111-1111");
	}finally {
		conn.close();
		stmt.close();
	}
	
%>
<!--  Ŭ���̾�Ʈ�� ���� DB�� ������ ������ �̵�  -->
<jsp:forware page = "dbgb_show.jsp"/>
 
<
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3> Ŭ���̾�Ʈ���� �Ѿ���� ������ �޾Ƽ� ��� </h3>
	<div> <%= na %></div>
	<div> <%= em %></div>
	<div> <%= sub %></div>
	<div> <%= cont %></div>
	<div> <%= ymd %></div>
	
	
	
</body>
</html>