<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "memMgr" class="signUp.MemberMgrPool"/>
<%
	String mem_id = request.getParameter("mem_id");
	boolean check = memMgr.checkId(mem_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Minjoo's Website!</title>
</head>
<body bgcolor="#FFFFCC">
<br>
<center>
<b><%=mem_id %></b>
<%
	if(check){
	  out.println(" already exists.");
	}else{
	  out.println(" is good to use.");
	}

%>
<br>
<a href="#" onClick="win_close()">Close</a>
</center>

</body>
</html>