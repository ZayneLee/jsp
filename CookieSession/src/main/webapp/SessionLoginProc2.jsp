<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%
		String id = (String) session.getAttribute("id");
		String pass = (String) session.getAttribute("pass");
	
	%>
	
	<center>
		당신의 아이디는	<%=id%>	입니다. 당신의 패스워드는	<%=pass%> 입니다.
	</center>
</body>
</html>