<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<!-- RequestLogin에서 넘어온 아이디와 패스워드를 읽어드림 -->
	<%
	String id =	request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	
	<h2> 
	당신의 아이디는 <%=id %> 이고 패스워드는 <%=pass %> 입니다.
	</h2>
	
	<a href="RequestForward.jsp">다음페이지</a>
</body>
</html>