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
	
	<center>
		<h2>게시글 보기</h2>
		<table width="700" border="1">
			<tr>
				<td align="center" width="150">번호</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="150">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="150">조회 수</td>
			</tr>
			<%
			for (int i = 0; i < v.size(); i++) {
				BoardBean bean = v.get(i);
			%>
			<tr>
				<td align="center" width="150"><%=i+1%></td>
				<td align="left" width="150">
					<a href="BoardInfo.jsp?id=<%=bean.getNum()%>"> <%=bean.getSubject()%></a>
				</td>
				<td align="center" width="150"><%=bean.getWriter()%></td>
				<td align="center" width="150"><%=bean.getReg_date().toString()%></td>
				<td align="center" width="150"><%=bean.getReadcount()%></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td align="center" colspan="5">
					<input type="button" onclick="location.href='BoardWriteForm.jsp'" value="글쓰기">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>