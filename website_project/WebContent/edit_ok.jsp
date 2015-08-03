<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="boardBean" class="board.BoardBean"/>
<jsp:setProperty name="boardBean" property="*"/>
<jsp:useBean id = "boardQuery" class="board.BoardQuery"/>
<%
int idx = boardBean.getIdx();
System.out.println("idx: "+ idx);
boolean result = false;
result = boardQuery.boardUpdate(boardBean);
	if(result){
		%>
		<script>
		alert("The post is successfully edited!");
		location.href="content.jsp?idx="+idx;
		</script>
<% 
	}else{
		%>
		<script>
		alert("Password does not match.");
		history.back();
		</script>
<% 
	}

%>