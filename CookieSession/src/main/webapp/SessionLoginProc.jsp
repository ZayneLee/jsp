<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	session.setAttribute("id", id);
	session.setAttribute("pass", pass);

	session.setMaxInactiveInterval(60);
	%>

	<center>
		당신의 아이디는 <%=id%> 입니다. 당신의 패스워드는 <%=pass%> 입니다. 
		<a href="SessionLoginProc2.jsp"> 다음 페이지로 이동 </a>
	</center>
</body>
</html>