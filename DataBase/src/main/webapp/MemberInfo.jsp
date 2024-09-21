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
		<h2>회원 정보 보기</h2>
		<table width="600" border="1">
			<tr>
				<td width="100">아이디</td>
				<td width="150"><%=mbean.getId()%></td>
			</tr>
			<tr>
				<td width="100">이메일</td>
				<td width="150"><%=mbean.getEmail()%></td>
			</tr>
			<tr>
				<td width="100">전화</td>
				<td width="150"><%=mbean.getTel()%></td>
			</tr>
			<tr>
				<td width="100">취미</td>
				<td width="150"><%=mbean.getHobby()%></td>
			</tr>
			<tr>
				<td width="100">직업</td>
				<td width="150"><%=mbean.getJob()%></td>
			</tr>
			<tr>
				<td width="100">나이</td>
				<td width="150"><%=mbean.getAge()%></td>
			</tr>
			<tr>
				<td width="100">정보</td>
				<td width="150"><%=mbean.getInfo()%></td>
			</tr>
		</table>
	</center>

</body>
</html>