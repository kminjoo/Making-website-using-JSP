<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% session.invalidate(); %>
<script>
	alert("You have successfully logged out.");
	location.href("SessionMemberLogin.jsp");
</script>