<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% String idx = request.getParameter("idx"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Minjoo's Website!</title>
<link href="style2.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<br>
<br>
<form method=post action="del_ok.jsp?idx=<%=idx %>">
<table width="200" align="center" cell-padding="10">
<tr>
	<th align="center" style="height: 28px; width: 210px">Enter the password.</th>
	</tr>
	<tr>
		<td align="center"><input type="password" name="pwd" size="10"></td>
	</tr>
	<tr>
		<td align="center"><a href="#" onClick="this.form.submit()"><img src="<%=request.getContextPath() %>/images/delete.gif"></a>
	</td>
	</tr>
</table>

</form>
</body>
</html>