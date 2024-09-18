<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<h2>로그인 처리 페이지</h2>
	<%
	request.setCharacterEncoding("utf-8");

	String dbid = "aaaa";
	String dbpass = "1234";

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	if (dbid.equals(id) && dbpass.equals(pass)) {
		response.sendRedirect("ResponseMain.jsp?id=" + id);
	} else {
	%>
	<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>