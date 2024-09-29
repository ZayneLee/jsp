<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%
	request.setCharacterEncoding("utf-8");

	String save = request.getParameter("save");
	String id = request.getParameter("id");
	
	if(save != null) {
		Cookie cookie = new Cookie("id", id);
		cookie.setMaxAge(60*10);
		
		response.addCookie(cookie);
		
		out.write("쿠키 생성 완료");
	}
	%>
</body>
</html>