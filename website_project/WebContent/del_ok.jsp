<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="boardQuery" class="board.BoardQuery"/>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String pwd = request.getParameter("pwd");

boolean result = false;
result = boardQuery.boardDelete(idx,pwd);
if(result){
%>

	<script>
	alert("This post is successfully deleted.");
	location.href="list.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("Password doesn't match.");
	history.back();
	</script>
<%
}
%>
