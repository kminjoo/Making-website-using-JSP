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
   
}//class ends
