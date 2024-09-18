<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<h2>이 페이지는 로그인 정보가 넘어오는 페이지 입니다.</h2>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		
		// response.sendRedirect("ResponseRedirect.jsp");
		
	%>
	
	<jsp:forward page="ResponseRedirect.jsp">
		<jsp:param value="mmmm" name="id"/>
	</jsp:forward>
	
	<h3><%=id %></h3>
</body>
</html>