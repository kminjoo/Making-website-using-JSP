<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "IsMember" class="signUp.MemberMgrPool" />
<% 
	String memberId ="";
	String memberPw = "";
	if(request.getParameter("memberId") != null)
	  memberId = request.getParameter("memberId");
	if(request.getParameter("memberPw") != null)
	  memberPw = request.getParameter("memberPw");
	if(IsMember.passCheck(memberId, memberPw))
	  {
	  	session.setAttribute("memID", memberId);
%>
<script>
	alert("You are successfully logged in!");
	location.href="SessionLoginConfirm.jsp";
</script>
<%
	  }else{
%>
<script>
	alert("Failed to log in");
	location.href="SessionMemberLogin.jsp";
</script>
<%} %>
