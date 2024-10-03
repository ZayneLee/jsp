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

	session.setMaxInactiveInterval(60*2);
	
	response.sendRedirect("SessionMain.jsp");
	%>

</body>
</html>