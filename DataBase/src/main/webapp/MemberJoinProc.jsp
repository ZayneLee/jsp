<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
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
	
	// 데이터 베이스 클래스 객체 생성
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mbean);
	
	// 회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동시킴
	response.sendRedirect("MemberList.jsp");
	%>
	
</body>
</html>