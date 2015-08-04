package board;

import java.sql.*;
import java.util.*;
import connectionPool.*;

public class BoardQuery {
  String board = " board "; //table name
  String idxNum = " board_seq.nextval "; //auto increment name
  ConnectionPool pool = null;
   public BoardQuery(){
  //Connect when an instance gets created
  try{
    pool = ConnectionPool.getInstance();
  }catch (Exception e ){
    System.out.println("FAIL TO CONNECT.");
  }
} //  BoardQuery()
   
   public void boardInsert(BoardBean boardBean) throws SQLException {
     Connection conn = pool.getConnection();
     Statement stmt = conn.createStatement();
     String sql = "";
     String firstname = boardBean.getFirstname();
     String lastname = boardBean.getLastname();
     String email = boardBean.getEmail();
     String title = boardBean.getTitle();
     title = title.replaceAll("'", "''");
     String content = boardBean.getContent();
     content = content.replaceAll("'", "''");
     String pwd = boardBean.getPwd();
     try{
       sql = " insert into "+board+" values("+idxNum+",'"+firstname+"','"+lastname+"','"+email+"','"+title+"','"+content+"',"
           + "'"+pwd+"',sysdate,0)";
       System.out.println(sql);
       stmt.executeUpdate(sql);
       
     }catch(Exception e){
       System.out.println(e);
     }finally{
       stmt.close();
       pool.releaseConnection(conn);
     }
     
   }
   
   public int BoardCount() throws SQLException{
     Connection conn = null;
     Statement stmt = null;
     ResultSet rs = null;
     String sql = null;
     int count = 0 ;
     try{
       conn = pool.getConnection();
       stmt = conn.createStatement();
       sql = " select count(*) from "+board+" ";
       rs = stmt.executeQuery(sql);
       rs.next();
       count = rs.getInt(1);
     }catch(Exception e){
       System.out.println("BoardCount Exception: "+ e);
     }finally{
       rs.close();
       stmt.close();
       pool.releaseConnection(conn);
     }
     return count;
   }
   public Vector getBoardList(int offset, int limit) throws SQLException{
     Connection conn = null;
     Statement stmt = null;
     ResultSet rs = null;
     String sql = null;
     Vector boardList = new Vector();
     
     try{
       conn = pool.getConnection();
       stmt = conn.createStatement();
       sql = " select a.* " + 
       " from ( " + 
       " select ROWNUM as RNUM, b.* " + 
       " from ( " + 
       " select * " + 
       " from "+board+" " +
       " order by idx desc " +
       " ) b " +
       " ) a " + 
       " where a.RNUM > " + offset + " " +
       " and a.RNUM <= " + (offset+limit) + " ";
    
       rs = stmt.executeQuery(sql);
       
       while(rs.next()){
         BoardBean boardBean = new BoardBean();
         boardBean.setIdx(rs.getInt("idx"));
         boardBean.setHit(rs.getInt("hit"));
         boardBean.setFirstname(rs.getString("firstname"));
         boardBean.setLastname(rs.getString("lastname"));
         boardBean.setTitle(rs.getString("title"));
         boardBean.setWdate(rs.getString("wdate").substring(0,19));
         boardList.add(boardBean);
       }
       }catch(Exception e){
         System.out.println("Get Board List Exception: " + e);
       }finally{
         rs.close();
         stmt.close();
         pool.releaseConnection(conn);
       }
     return boardList;
   }
   
   public void boardHitUp(int idx) throws SQLException{
	   Connection conn = pool.getConnection();
	   Statement stmt = conn.createStatement();
	   
	   try{
		   String sql = " update "+board+" set hit = hit + '1' where idx = '"+idx+"'";
		   stmt.execute(sql);
	   }catch(Exception e){
		   System.out.println(e);
	   }finally{
		  stmt.close();
		  pool.releaseConnection(conn);
	   }
   }
   
   public BoardBean boardView(int idx) throws SQLException{
	   BoardBean boardBean = null;
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   String sql = null;
	   
	   try{
		   conn = pool.getConnection();
		   stmt = conn.createStatement();
		   sql = "select * from "+board+" where idx="+idx;
		   rs = stmt.executeQuery(sql);
		   boardBean = new BoardBean();
		   if(rs.next()){
			   boardBean.setIdx(rs.getInt("idx"));
			   boardBean.setHit(rs.getInt("hit"));
			   boardBean.setFirstname(rs.getString("firstname"));
			   boardBean.setLastname(rs.getString("lastname"));
			   boardBean.setEmail(rs.getString("email"));
			   boardBean.setTitle(rs.getString("title"));
			   String content = rs.getString("content");
			   boardBean.setContent(content);
			   boardBean.setWdate(rs.getString("wdate"));
		   }
	   }catch(Exception e){
		   System.out.println(e);
	   }finally{
		   rs.close();
		   stmt.close();
		   pool.releaseConnection(conn);
	   }
	   return boardBean;
   }
   
   public boolean passwordCheck(int idx, String pwd) throws SQLException{
	   boolean check = false;
	   Connection conn = pool.getConnection();
	   Statement stmt = conn.createStatement();
	   ResultSet rs = null;
	   String sql = "";
	   String correctPw = "";
	   try{
		   sql = "select pwd from "+board+" where idx="+idx;
		   System.out.println(sql);
		   rs = stmt.executeQuery(sql);
		   if(rs.next()){
		   correctPw = rs.getString(1);
		   pwd = pwd.trim();
		   correctPw = correctPw.trim();
		   System.out.println("correctpw: " + correctPw + "pwd: " + pwd);
		   }else{
			   System.out.println("wrong pwd");
		   }
		   if(pwd.equals(correctPw)){
			   check = true;
		   }
	   }catch(Exception e){
		   System.out.println(e);
	   }finally{
		   rs.close();
		   stmt.close();
		   pool.releaseConnection(conn);
	   }
	   return check;
   }
   
   public boolean boardUpdate(BoardBean boardBean) throws SQLException{
	   boolean result = false;
	   Connection conn = pool.getConnection();
	   Statement stmt = conn.createStatement();
	   String sql = "";
	   int idx = boardBean.getIdx();
	   String firstname=boardBean.getFirstname();
	   String lastname = boardBean.getLastname();
	   String email= boardBean.getEmail();
	   String title = boardBean.getTitle();
	   title = title.replaceAll("'", "''");
	
	   String content = boardBean.getContent();
	   content = content.replaceAll("'", "''");
	   System.out.println(content);
	   String pwd = boardBean.getPwd();
	   try{
		   if(passwordCheck(idx,pwd)){
			   sql= "Update "+board+" set firstname='"+firstname+"', lastname='"+lastname+"', email = '"+email+"', title='"+title+"', content='"+content+"' where idx="+idx;
			   System.out.println(sql);
			   stmt.execute(sql);
			   
			   result = true;
		   }else{
			   result = false;
		   }
	   }catch(Exception e){
		   System.out.println(e);
	   }finally{
		   stmt.close();
		   pool.releaseConnection(conn);
	   }
	   return result;
   }
   
   public boolean boardDelete(int idx, String pwd) throws SQLException{
	   boolean result = false;
	   Connection conn = pool.getConnection();
	   Statement stmt = conn.createStatement();
	   String sql = "";
	   try{
		   if(passwordCheck(idx,pwd)){
			   sql="delete from "+board+" where idx="+idx;
			   stmt.executeUpdate(sql);
			   result = true;
		   }else{
			   result = false;
		   }
	   }catch(Exception e){
		   System.out.println(e);
		   
	   }finally{
		   stmt.close();
		   pool.releaseConnection(conn);
	   }
	   return result;
   }
   
   public int BoardCount (String find, String search) throws SQLException{
     int count = 0;
     Connection conn = null;
     Statement stmt = null;
     ResultSet rs = null;
     String sql = null;
     if(find== "author"){
       find = "firstname";
     }
     try{
       conn = pool.getConnection();
       stmt = conn.createStatement();
       sql = " select count(*) from "+board+" where "+find+" like "+"'%"+search+"%'";
       rs = stmt.executeQuery(sql);
       if(rs!= null){
         if(rs.next())
           count = rs.getInt(1);
       }
     }catch(Exception e){
       System.out.println(e);
     }finally{
       if(rs!=null){
       rs.close();
       }
       stmt.close();
       pool.releaseConnection(conn);
     }
     return count;
   }
   
   
   public Vector getSearchList(int offset, int limit, String find, String search) throws SQLException{
     Connection conn = null;
     Statement stmt = null;
     ResultSet rs = null;
     String sql = null;
     if(find == "author"){
       find = "firstname";
     }
     Vector searchList = new Vector();
     try{
       conn = pool.getConnection();
       stmt = conn.createStatement();
       sql = " select a.* " + 
       "from ( " + 
       " select ROWNUM as RNUM, b.* " + 
       " from ( " + 
       " select * " + 
       " from "+board+" " + 
       " where "+find+" like " + "'%"+search+"%' order by idx desc" 
       + " ) b " +
       " ) a " + 
           " where a.RNUM > " + offset + " " +
       " and a.RNUM <= " + (offset + limit) + " ";
       rs = stmt.executeQuery(sql);
       
       while(rs.next()){
         BoardBean boardBean = new BoardBean();
         boardBean.setIdx(rs.getInt("idx"));
         boardBean.setHit(rs.getInt("hit"));
         boardBean.setFirstname(rs.getString("firstname"));
         boardBean.setLastname(rs.getString("lastname"));
         boardBean.setEmail(rs.getString("email"));
         String title = rs.getString("title");
         title.replaceAll("'", "''");
         boardBean.setTitle(rs.getString("title"));
        
         String content = rs.getString("content");
         content = content.replaceAll("\n", "<br>");
         content = content.replaceAll("'", "''");
         boardBean.setContent(content);
         boardBean.setWdate(rs.getString("wdate").substring(0,19));
         searchList.add(boardBean);
       }
     }catch(Exception e){
       System.out.println(e);
     }finally{
       if(rs!=null){
       rs.close();
       }
       stmt.close();
       pool.releaseConnection(conn);
     }
     return searchList;
   }
}//class ends
