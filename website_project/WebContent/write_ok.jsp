<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="boardBean" class="board.BoardBean"/>
<jsp:setProperty name="boardBean" property="*"/>
<%
System.out.println(boardBean.getFirstname());
%>
<jsp:useBean id = "boardQuery" class="board.BoardQuery"/>

<%
boardQuery.boardInsert(boardBean);
%>

<script>
location.href="list.jsp";
</script>