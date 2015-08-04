<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "IsMember" class="signUp.MemberMgrPool" />
<% 
	  String memberId = request.getParameter("mem_id");
	  String memberPw = request.getParameter("mem_passwd");
	  System.out.println("member Id: " + memberId + " member Pw: " + memberPw);
	if(IsMember.passCheck(memberId, memberPw))
	  {
	  	session.setAttribute("memID", memberId);
%>
<script>
	alert("You are successfully logged in!");
	location.href="list.jsp";
</script>
<%
	  }else{
%>
<script>
	alert("Failed to log in. \n\r Check your ID and Password.");
	location.href="SessionMemberLogin.jsp";
</script>
<%} %>
