<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	%>
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>
	
	<%
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(boardBean);
	%>
</body>
</html>