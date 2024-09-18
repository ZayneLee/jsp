<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<h2>리다이렉트 페이지 입니다.</h2>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
	%>
	
	<h3>아이디는 <%=id %></h3>
</body>
</html>