<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String)session.getAttribute("memID");
	if(memberId != null){
%>
<script>
	alert("You are already logged in.");
	location.href = "list.jsp";
</script>
<%} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Minjoo's Website!</title>
<script language="JavaScript" src="script.js"> </script>
</head>
<body><jsp:include page="header.html"/><br><br>
<div align = "center">
	<img src="<%= request.getContextPath() %>/images/welcome.JPG"/>
</div>
<div align = "center">
	<img src = "<%= request.getContextPath() %>/images/login.JPG"/>
</div>
<form name="login" method="post" action="SessionMemberLoginOK.jsp">
<table align="center">

<tr>
	<td><div align="center"><img src = "<%= request.getContextPath() %>/images/id.JPG"/></div></td>
	<td><div align="center"><input type="text" name="mem_id"></div></td>
</tr>
<tr>
	<td><div align="center"><img src = "<%= request.getContextPath() %>/images/pw.JPG"/></div></td>
	<td><div align="center"><input type="password" name="mem_passwd"></div></td>
</tr>
<tr>  
  <td colspan="2"><div align="center">
  <input type="image" src="<%= request.getContextPath() %>/images/click.gif" onClick = "loginCheck()">
    
    </div></td>
</tr>
</table>
</form>

<div align="center">
<input type="image" src="<%= request.getContextPath() %>/images/signup.gif" onClick = "memberReg()"></div>
</body>
</html>