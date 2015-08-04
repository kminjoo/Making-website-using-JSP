<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import ="java.sql.*, java.util.*, board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style3.css" rel="stylesheet" type="text/css">
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
</head>
<body>
<%
String find = request.getParameter("find");
String search = request.getParameter("search");
int rcnt = boardQuery.BoardCount(find,search);
PagingCount pc = new PagingCount(rcnt);
%>
<br>

<table width="70%" align="center">
<tr>
<td align="left" width="20%">&nbsp; total number of found posts: <b><%=rcnt %></b></td>
</tr>
</table>
<form action="search.jsp" method=post name="sform">
<table width="70%" align="center">
<tr>
  <td class="search" align="left">
    <select name = "find">
      <option value = title>title</option>
      <option value = content>content</option>
      <option value = firstname>first name</option>     
      </select>
      <input type="text" class = "searchinput" name="search" size="20">
      <a href="#" onclick="searchInputCheck(wform);"><img src="<%=request.getContextPath() %>/images/find.gif"></a>
  </td>
</tr>
</table>
</form>

<img style="position:relative; LEFT:14%;" src="<%=request.getContextPath() %>/images/searchresult.gif">
<table width="70%" align="center">
<tr>
  <td class="top" width="5%">#</td>
  <td class="top" width="50%">title</td>
  <td class="top" width="10%">author</td>
  <td class="top" width="10%">date</td>
  <td class="top" width="10%">views</td>
</tr>


<%
Vector searchList = boardQuery.getSearchList(offset,limit,find,search);

for(int i = 0; i<searchList.size(); ++i){
  BoardBean boardBean = (BoardBean)searchList.elementAt(i);
%>
<tr>
  <td class="contents"><%=boardBean.getIdx() %></td>
  <td class="title"><a style="text-decoration:none;" href="content.jsp?idx=<%=boardBean.getIdx()%>"><%=boardBean.getTitle() %></a></td>
  <td class="contents"><%=boardBean.getFirstname() %>&nbsp;<%=boardBean.getLastname() %></td>
  <td class="contents"><%=boardBean.getWdate() %></td>
  <td class="contents"><%=boardBean.getHit() %></td>
</tr>
<%} 

if(rcnt == 0){
%>
<tr>
<td></td>
 <td align="center"> No search results. </td>
 </tr>
</table>
<%} %>
<%=pc.showPaging(pagelink, "search.jsp",find,search) %>
<br>
<form action="search.jsp" method=post name="sform">
<table width="70%" align="center">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<tr>
  <td align="left">
    <select name = "find">
      <option value = title>title</option>
      <option value = content>content</option>
      <option value = firstname>first name</option>     
      </select>
      <input type="text" class = "searchinput" name="search" size="20">
      <a href="#" onclick="searchInputCheck(wform);"><img src="<%=request.getContextPath() %>/images/find.gif"></a>
  </td>
</tr>
</table>
</form>

</body>
</html>