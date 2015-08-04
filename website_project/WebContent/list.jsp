<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "board.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="boardQuery" class="board.BoardQuery" />
<%
///Pagination
int limit = 10;
int offset = 0;
int pagelink = 1;

String offset_get = request.getParameter("offset");
if(offset_get == null){
  offset = 0;
}else{
  offset = Integer.parseInt(offset_get);
}

String pagelink_get = request.getParameter("pagelink");
if(pagelink_get == null){
  pagelink = 1;
}else{
  pagelink = Integer.parseInt(pagelink_get);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style3.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<br>

<img style="position:relative; LEFT:14%;" src="<%=request.getContextPath() %>/images/latestposts.gif">


<a href="write.jsp"><img style="position:relative; TOP:20px; LEFT:62%;" src="<%=request.getContextPath() %>/images/newpost.gif"></a>
 

<table width="70%" align="center">
<tr>
  <td class="top" width="5%">#</td>
  <td class="top" width="50%">title</td>
  <td class="top" width="10%">author</td>
  <td class="top" width="10%">date</td>
  <td class="top" width="10%">views</td>
</tr>
<%

int rcnt = boardQuery.BoardCount();
Vector listVector = boardQuery.getBoardList(offset,limit);

for(int i = 0; i < listVector.size(); ++i){
  BoardBean boardBean = (BoardBean)listVector.elementAt(i);

%>
<tr>
  <td class="contents"><%=boardBean.getIdx() %></td>
  <td class="title"><a style="text-decoration:none;" href="content.jsp?idx=<%=boardBean.getIdx()%>"><%=boardBean.getTitle() %></a></td>
  <td class="contents"><%=boardBean.getFirstname() %>&nbsp;<%=boardBean.getLastname() %></td>
  <td class="contents"><%=boardBean.getWdate() %></td>
  <td class="contents"><%=boardBean.getHit() %></td>
</tr>
<%} %>
</table>

<%
PagingCount pc = new PagingCount(rcnt);
%>
<%=pc.showPaging(pagelink,"list.jsp") %>
<br>
<form action="search.jsp" method=post name="sform">
<table width="70%" align="center">
<tr>
  <td class="search" align="center">
    <select name = "find">
      <option value = title>title</option>
      <option value = content>content</option>
      <option value = author>author</option>     
      </select>
      <input type="text" class = "searchinput" name="search" size="20">
      <a href="#" onclick="searchInputCheck(wform);"><img src="<%=request.getContextPath() %>/images/find.gif"></a>
  </td>
</tr>
</table>
</form>
</body>
</html>