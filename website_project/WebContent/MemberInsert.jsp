<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="memberMgr" class="signUp.MemberMgrPool"/>
<jsp:useBean id="regBean" class="signUp.RegisterBean"/>
<jsp:setProperty name="regBean" property="*"/>
<% Boolean insert = memberMgr.memberInsert(regBean); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Minjoo's Website!</title>
</head>
<body>
<%
if(insert){
%>
<div align="center"><img src="<%=request.getContextPath()%>/images/testfile.gif"/></div>
<br><br><br>
<jsp:include page="SessionMemberLogin.jsp"/>

<%
} 
else{%>

<div align="center"><img src="<%=request.getContextPath() %>/images/wrong.gif"/></div>
<hr> 
<jsp:include page="Register.jsp"/>

<%}%>

</body>
</html>