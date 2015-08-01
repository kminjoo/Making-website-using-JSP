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
   
   
}//class ends
