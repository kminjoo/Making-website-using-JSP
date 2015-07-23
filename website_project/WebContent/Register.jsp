<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Minjoo's Website!</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body onLoad="regForm.mem_id.focus()">
<div align="center"><img src="<%=request.getContextPath() %>/images/visit.jpg"/></div>
<div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath() %>/images/basicInfo.JPG"/></div>
<hr>
<table border="1" cellpadding="18" cellspacing="1" width="80%" align="center">
<form name="regForm" method="post" action="RegisterProc.jsp">
	<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">ID</td>
		<td width="60%"><input type="text" name="mem_id" size="18">&nbsp;&nbsp;&nbsp;
		<input type="button" value="ID Check" onClick="idCheck(this.form.mem_id.value)"></td>
	</tr>
	<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">Password</td>
		<td width="60%"><input type="password" name="mem_passwd" size="18">
	</tr>
	<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">Confirm Password</td>
		<td width="60%"><input type="password" name="mem_repasswd" size="18">
	</tr>
	<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">First Name</td>
		<td width="60%"><input type="text" name="mem_firstname" size="18"></td>
	</tr>
	<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">Last Name</td>
		<td width="60%"><input type="text" name="mem_lastname" size="18"></td>
	</tr>
	<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">Email</td>
		<td width="60%"><input type="text" name="mem_email" size="27">
	</tr>
	<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">Phone Number</td>
		<td width="30%"><input type="text" name="mem_phone1" size="3" maxlength="3" 
			onKeyUp="if(this.value.length==3)regForm.mem_phone2.focus()">&nbsp;-&nbsp;
		<input type="text" name="mem_phone2" size="4" maxlength="4" 
		onKeyUp="if(this.value.length==3)regForm.mem_phone3.focus()">
		&nbsp;-&nbsp;<input type="text" name="mem_phone3" size="4" maxlength="4"></td>
	</tr>
	
</table>
<br><br>
<div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath() %>/images/additional.JPG"/></div>
<hr>
<table border="1" cellpadding="18" cellspacing="1" width="80%" align="center">
<tr>
		<td width="13%" align="center" bgcolor="#EFEFEF">BIRTHDAY</td>
		<td width="60%"><input type="text" name="mem_bday" size="8" maxlength="8">
		(YYYYMMDD)</td>
</tr>
</table>
</form>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div align="center">
	<a href="#" onclick="inputCheck(); return false;">
	<img src="<%=request.getContextPath() %>/images/submit.JPG"/></a>
	<a href="#" onclick="history.back();">
	<img src="<%=request.getContextPath() %>/images/goback.JPG"/></a>
	<a href="#" onclick="document.regForm.reset()">
	<img src="<%=request.getContextPath() %>/images/reset.JPG"/></a>
	
</div>

</body>
</html>