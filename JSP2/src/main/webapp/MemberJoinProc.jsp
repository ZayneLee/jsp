<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<center>
	<h2>회원 정보 보기</h2>
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="mbean" class="bean.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
	
	<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
	<h2>당신의 패스는 <jsp:getProperty property="pass1" name="mbean"/></h2>
	<h2>당신의 이메일는 <jsp:getProperty property="email" name="mbean"/></h2>
	</center>
</body>
</html>