<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="boardBean" class="board.BoardBean"/>
<jsp:setProperty name="boardBean" property="*"/>
<jsp:useBean id = "boardQuery" class="board.BoardQuery"/>

<%
for(int i = 0; i < 10; ++i){
boardQuery.boardInsert(boardBean);
}
%>

<script>
location.href="list.jsp";
</script>