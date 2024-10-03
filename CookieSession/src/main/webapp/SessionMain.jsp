<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

<%
	String center = request.getParameter("center");

	if(center == null) {
		center = "Center.jsp";
	}
%>

	<center>
		<table border="1" width="800">
			<!-- Top -->
			<tr height="150">
				<td align="center" colspan="2"><jsp:include page="Top.jsp" />
			</tr>

			<!-- Left -->
			<tr height="400">
				<td align="center" width="200"><jsp:include page="Left.jsp" />
				</td>


				<!-- Center -->
				<td align="center" width="600"><jsp:include page="<%= center %>" />
				</td>
			</tr>

			<!-- Bottom -->
			<tr height="100">
				<td align="center" colspan="2"><jsp:include page="Bottom.jsp" />
				</td>
			</tr>
		</table>
	</center>
</body>
</html>