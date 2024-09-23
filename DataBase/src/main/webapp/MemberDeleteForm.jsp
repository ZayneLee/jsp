<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
<center>
		<h2>회원 정보 삭제하기</h2>
		<form action="MemberDeleteProc.jsp" method="post">
			<table width="600" border="1">
				<tr>
					<td width="100">아이디</td>
					<td width="150"><%=request.getParameter("id")%></td>
				</tr>
				<tr>
					<td width="100">패스워드</td>
					<td width="150"><input type="password" name="pass1" ></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%= request.getParameter("id")%>">
					<input type="submit"
						value="회원 삭제하기"> &nbsp;&nbsp;
						<button type="button" onclick="location.href='MemberList.jsp'">회원 전체 목록
							보기</button></td>
				</tr>

			</table>
		</form>
	</center>
</body>
</html>