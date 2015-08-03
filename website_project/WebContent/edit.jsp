<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.io.*, java.text.*, java.util.*, board.*" %>
<jsp:useBean id="boardBean" class="board.BoardBean"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Minjoo's Website!</title>
<link href="style2.css" rel="stylesheet" type="text/css">
</head>
<script>
function inputCheck(theform){
	if(theform.email.value==""){
		alert("Enter your Email");
		theform.email.focus();
		return false;
	}
	if(theform.title.value==""){
		alert("Enter the title.");
		theform.title.focus();
		return false;
	}
	if(theform.content.value==""){
		alert("The post is empty.");
		theform.content.focus();
		return false;
	}
	if(theform.pwd.value==""){
		alert("Enter the password.");
		theform.pwd.focus();
		return false;
	}
	theform.submit();
}

</script>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
System.out.println("edit.jsp idx: " + idx);
BoardQuery boardQuery = new BoardQuery();
boardBean = boardQuery.boardView(idx);
%>
<body>
<img style="position:relative; LEFT:10%;" src="<%=request.getContextPath() %>/images/editpost.gif">
<form method="post" name="editform" action="edit_ok.jsp">
<hr>
<table border="1" cellpadding="18" cellspacing="1" width="80%" align="center">
  <tr>
    <th width="13%" align="center" bgcolor="#EFEFEF">Name</th>
    <td width="60%"><%=boardBean.getName() %></td>

  </tr>
  <tr>
    <th width="13%" align="center" bgcolor="#EFEFEF">Email</th>
    <td width="60%"><input type="text" name="email" size="30" value="<%=boardBean.getEmail() %>"></td>
  </tr>
  <tr>
    <th width="13%" height="5%" align="center" bgcolor="#EFEFEF">Views</th>
    <td width="60%"><%=boardBean.getHit()%></td>
  </tr>
  <tr>
    <th width="13%" align="center" bgcolor="#EFEFEF">Title</th>
    <td width="60%"><input type="text" name="title" size="50" value="<%=boardBean.getTitle() %>"></td>
   </tr>
   <tr>
   <td colspan="2" width="100%"><textarea name="content" cols="50"><%=boardBean.getContent() %></textarea></td>
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
   <a href="#" onclick="inputCheck(editform);"><img src="<%=request.getContextPath() %>/images/edit.gif"></a>
   <a href="#" onclick="location.href='content.jsp?idx=<%=boardBean.getIdx()%>';"><img src="<%=request.getContextPath() %>/images/cancle.gif"></a></td>
   </tr>

</table>
</form>

</body>
</html>