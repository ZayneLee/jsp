<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 연습</h2>
	
	<%
		String name = "shin";
		session.setAttribute("name1", name);
		// 세션 시간 세팅
		session.setMaxInactiveInterval(10);
	%>
	
	<a href="SessionName.jsp">세션 네임 페이지로 이동</a>
</body>
</html>