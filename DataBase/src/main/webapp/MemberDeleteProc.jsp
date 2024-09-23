<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

	<%
	String id = request.getParameter("id");
	MemberDAO mdao = new MemberDAO();
	String pass = mdao.getPass(id);

	if (mbean.getPass1() != null && mbean.getPass1().equals(pass)) {
		mdao.deleteMember(mbean);
		response.sendRedirect("MemberList.jsp");
	} else {
	%>
	<script type="text/javascript">
		alert("패스워드가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>