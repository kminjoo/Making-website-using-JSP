<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	alert("You have successfully logged out.");
	location.href="SessionMemberLogin.jsp";
</script>
<% session.invalidate(); %>