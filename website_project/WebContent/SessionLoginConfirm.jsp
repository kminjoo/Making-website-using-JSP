<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "IsMember" class="signUp.MemberMgrPool"/>
<%
	String memberId = (String)session.getAttribute("memID");
	if(memberId == null) {
%>
<script>
	alert("You are not logged in.");
	location.href="SessionMemberLogin.jsp";
</script>
<% }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Minjoo's Website!</title>
</head>
<body>
<table align="center">
	<tr>
		<td height="190">
			<table align="center">
			<tr>
				<td><div align="center"><img src="<%=request.getContextPath() %>/images/minjoo.JPG"/></div></td>
			</tr>
			<tr>
				<td><div align="center">
					<strong><img src="images/hello.JPG"/><%=memberId %></strong></div>
				</td>
			</tr>
			<tr>
				<td><div align="center">
				<a href="SessionLogOut.jsp"><img src="<%=request.getContextPath() %>/images/logout.JPG"/></a>
				</div></td>
			</tr>
		</table>
		</td>
		</tr>
		
				
</table>
</body>
</html>