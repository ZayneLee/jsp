<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<!-- 1. 데이터 베이스에서 모든 회원 정보를 가져옴 2. table 태그를 이용하여 화면의 회원들의 정보를 출력 -->

	<%
	MemberDAO mdao = new MemberDAO();

	// 회원들의 정보가 얼마나 저장되었는지 모르기에 가변길이 Vector 를 이용하여 데이터를 저장해줌
	Vector<MemberBean> vec = mdao.allSelectMember();
	%>

	<center>
		<table width="600" border="1">
			<tr>
				<td align="center" width="150">아이디</td>
				<td align="center" width="250">이메일</td>
				<td align="center" width="150">전화번호</td>
				<td align="center" width="150">나이</td>
			</tr>
			<%
			for (int i = 0; i < vec.size(); i++) {
				MemberBean bean = vec.get(i);
			%>
			<tr>
					<td align="center" width="150"><a
					href="MemberInfo.jsp?id=<%=bean.getId()%>"> <%=bean.getId()%>
				</a></td>
				<td align="center" width="150"><%=bean.getEmail()%></td>
				<td align="center" width="150"><%=bean.getTel()%></td>
				<td align="center" width="150"><%=bean.getAge()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</center>
</body>
</html>