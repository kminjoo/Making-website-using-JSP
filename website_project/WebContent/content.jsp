<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<jsp:useBean id="boardBean" class="board.BoardBean"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="style2.css" rel="stylesheet" type="text/css">
<title>Welcome to Minjoo's Website!</title>
</head>
<script>
function editsend(idx){
location.href="edit.jsp?idx="+idx;
}
function delsend(idx){
	location.href="del.jsp?idx="+idx;
}


</script>
<body>
<jsp:include page="header.html"/>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	BoardQuery boardQuery = new BoardQuery();
	boardQuery.boardHitUp(idx);
	boardBean = boardQuery.boardView(idx);
%>

<br>
<br>
<br>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<img style="position:relative; LEFT:3%;" src = "<%=request.getContextPath() %>/images/writenewpost.gif"></div>
<form method="post" name="wform">
<hr>
<table border="1" cellpadding="18" cellspacing="1" width="80%" align="center">
  <tr>
    <th width="13%" align="center" bgcolor="#EFEFEF">Name</th>
    <td width="60%"><%=boardBean.getFirstname()%>&nbsp;<%=boardBean.getLastname() %></td>

  </tr>
  <tr>
    <th width="13%" align="center" bgcolor="#EFEFEF">Email</th>
    <td width="60%"><%=boardBean.getEmail()%></td>
  </tr>
  <tr>
    <th width="13%" height="5%" align="center" bgcolor="#EFEFEF">Views</th>
    <td width="60%"><%=boardBean.getHit()%></td>
  </tr>
  <tr>
    <th width="13%" align="center" bgcolor="#EFEFEF">Title</th>
    <td width="60%"><%=boardBean.getTitle()%></td>
   </tr>
   <tr>
   <td colspan="2" width="100%"><textarea name="content" cols="50" readonly><%=boardBean.getContent() %></textarea></td>
   </tr>
   <tr>
      <th width="13%" align="center" bgcolor="#EFEFEF">Password</th>
      <td width="60%"><input type="password" name="pwd" size = "10"></td>
   </tr>
   <tr>
   <td style="border-bottom:transparent; 
   border-right:transparent;"><div>
   <a href="list.jsp"><img src="<%=request.getContextPath()%>/images/list.gif"></a></div></td>
   
   <td align="right" style="border-bottom:transparent;border-right:transparent;">
   <a href="#" onclick="editsend(<%=idx%>);"><img src="<%=request.getContextPath() %>/images/edit.gif"></a>
   <a href="#" onclick="delsend(<%=boardBean.getIdx()%>);"><img src="<%=request.getContextPath() %>/images/delete.gif"></a></td>
   </tr>

</table>
</form>
</body>
</html>