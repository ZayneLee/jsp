<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
	BoardDAO bdao = new BoardDAO();
	Vector<BoardBean> v = bdao.getAllBoard();
	%>
</body>
</html>