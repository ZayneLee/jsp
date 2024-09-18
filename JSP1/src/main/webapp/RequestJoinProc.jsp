<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<center>
		<h2>회원 정보 보기</h2>
		<%
		// post방식으로 데이터가 넘어올 때 한글이 깨짐 방지
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		String[] hobby = request.getParameterValues("hobby");

		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String info = request.getParameter("info");

		if (!pass1.equals(pass2)) {
		%>
		<script type="text/javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
		<%
		}
		%>
		<table width="500" border="1">
			<tr height="50">
				<td width="150" align="center">아이디</td>
				<td width="350" align="center">
					<%= id %>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">이메일</td>
				<td width="350" align="center">
					<%= email %>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">전화번호</td>
				<td width="350" align="center">
					<%= tel %>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 관심분야</td>
				<td width="350" align="center">
					<%
						for(int i = 0; i < hobby.length; i++) {
							out.write(hobby[i] + " ");
						}
					%>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">직업은?</td>
				<td width="350" align="center">
					<%= job %>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">하고 싶은 말</td>
				<td width="350" align="center">
					<%= info %>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>