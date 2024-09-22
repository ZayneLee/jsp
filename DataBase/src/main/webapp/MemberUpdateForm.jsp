<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>


	<!-- 1. 데이터 베이스에서 한 회원 정보를 가져옴 2. table 태그를 이용하여 화면에 회원의 정보를 출력 -->

	<%
	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = mdao.oneSelectMember(request.getParameter("id"));
	%>

	<center>
		<h2>회원 정보 수정하기</h2>
		<form action="MemberUpdateProc.jsp" method="post">
			<table width="600" border="1">
				<tr>
					<td width="100">아이디</td>
					<td width="150"><%=mbean.getId()%></td>
				</tr>
				<tr>
					<td width="100">이메일</td>
					<td width="150"><input type="email" name="email"
						value="<%=mbean.getEmail()%>"></td>
				</tr>
				<tr>
					<td width="100">전화</td>
					<td width="150"><input type="tel" name="tel"
						value="<%=mbean.getTel()%>"></td>
				</tr>
				<tr>
					<td width="100">패스워드</td>
					<td width="150"><input type="password" name="pass1" ></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%= mbean.getId()%>">
					<input type="submit"
						value="회원 수정하기"> &nbsp;&nbsp;
						<button type="button" onclick="location.href='MemberList.jsp'">회원 전체 목록
							보기</button></td>
				</tr>

			</table>
		</form>
	</center>
</body>
</html>