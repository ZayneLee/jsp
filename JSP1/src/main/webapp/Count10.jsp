<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1-10 까지 숫자를 화면에 표시</h2>
	<%
	for (int i = 0; i <= 10; i++) {
	%>
	<%=i%><br>
	<%
	}
	%>



</body>
</html>