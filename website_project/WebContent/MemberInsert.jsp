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
	out.println("Congratulation blahbalh");
	out.println("login page");
}
else{
  out.println("다시 입력해주세요");
  out.println("회원가입 페이지");
}
%>
</body>
</html>