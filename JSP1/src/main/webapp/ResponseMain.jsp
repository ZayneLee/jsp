<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	
	<h2><%= request.getParameter("id") %>님 반갑습니다.</h2>
</body>
</html>