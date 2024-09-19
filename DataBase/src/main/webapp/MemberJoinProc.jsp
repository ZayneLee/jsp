<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String[] hobby = request.getParameterValues("hobby");
	String texthobby = "";
	for(int i = 0; i < hobby.length; i++) {
		texthobby += hobby[i] + " ";
	}
	%>
	
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
	
	<%
	mbean.setHobby(texthobby);
	
	// 오라클에 접속하는 소스 작성
	String id = "System";
	String pass = "123456";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	try {
		// 1. 해당 데이터 베이스를 사용한다고 선언(클래스를 등록=오라클용을 사용)
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2. 해당 데이터 베이스에 접속
		Connection con = DriverManager.getConnection(url, id, pass);
	} catch(Exception e) {
		e.printStackTrace();	
	}
	%>
	
	오라클에 접속 성공~
</body>
</html>