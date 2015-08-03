package board;

import java.sql.*;
import java.util.*;
import connectionPool.*;

public class BoardQuery {
  String board = " board "; //table name
  String idxNum = " board_idx_seq.nextval "; //auto increment name
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
     String name = boardBean.getName();
     String email = boardBean.getEmail();
     String title = boardBean.getTitle();
     String content = boardBean.getContent();
     String pwd = boardBean.getPwd();
     try{
       sql = " insert into "+board+" values("+idxNum+",'"+name+"','"+email+"','"+title+"','"+content+"',"
           + "'"+pwd+"',sysdate,0)";

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
         boardBean.setName(rs.getString("name"));
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
   
}//class ends
