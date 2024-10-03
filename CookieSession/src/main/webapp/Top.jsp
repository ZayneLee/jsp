<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

<%
	String id = (String) session.getAttribute("id");

	if(id == null) {
		id = "guest";
	}
%>
	<center>
		<!-- Top -->
		<table width="800">
			<tr height="100">
				<!-- 로고이미지 -->
				<td colspan="2" align="center" width="200"><img alg="logo"
					src="img/logo.jpg" width="200" height="100"></td>
				<td colspan="5" align="center"><font size="10">낭만 캠핑</font></td>
			</tr>
			<tr height="50">
				<td width="100" align="center">텐트</td>
				<td width="100" align="center">의자</td>
				<td width="100" align="center">식기류</td>
				<td width="100" align="center">침낭</td>
				<td width="100" align="center">테이블</td>
				<td width="100" align="center">화롯대</td>
				<td width="200" align="center">
				<%
				if(id.equals("guest")) {
					%>
					<%=id %> 님 <button onclick="location.href='SessionMain.jsp?center=SessionLoginForm.jsp'">로그인</button>
					<%
				} else {
					%>
					<%=id %> 님 <button onclick="location.href='SessionMain.jsp?center=SessionLogout.jsp'">로그아웃</button>
					<%
				}
				%>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>