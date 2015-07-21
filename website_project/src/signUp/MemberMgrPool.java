package signUp;

import java.util.*;
import java.sql.*;
import connectionPool.*;

public class MemberMgrPool {
   private DBConnectionMgr pool = null;
   
   public MemberMgrPool(){
     try{
       pool = DBConnectionMgr.getInstance();
     }catch (Exception e){
       System.out.println("ERROR: FAILED TO LOAD CONNECTION");
     }
   }// MemberMgrPool()
   
   public Vector getMemberList(){
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     Vector vecList = new Vector();
     
     try{
       conn = pool.getConnection();
       String strQuery = "select * from member";
       pstmt = conn.prepareStatement(strQuery);
       rs = pstmt.executeQuery();
       while(rs.next()){
         RegisterBean regBean = new RegisterBean();
         regBean.setMem_id(rs.getString("id"));
         regBean.setMem_password(rs.getString("passwd"));
         regBean.setMem_name(rs.getString("name"));
         regBean.setMem_address(rs.getString("address"));
         regBean.setMem_phonenum(rs.getString("phone"));
         regBean.setMem_email(rs.getString("email"));
         regBean.setMem_job(rs.getString("job"));
         regBean.setMem_birthday(rs.getString("bday"));
         vecList.add(regBean);
       }
     }catch(Exception e){
       System.out.println("Exception: " + e);
     }finally{
       pool.freeConnection(conn);
     }
     return vecList;
   }
   
   public boolean passCheck(String cust_id, String cust_passwd){
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     boolean result = false;
     try{
       conn = pool.getConnection();
       String strQuery = "select count(*) from member where id = ? and passwd = ?";
       pstmt = conn.prepareStatement(strQuery);
       pstmt.setString(1, cust_id);
       pstmt.setString(2, cust_passwd);
       rs = pstmt.executeQuery();
       rs.next();
       if(rs.getInt(1)>0)
         result = true;
     }catch (Exception e){
       System.out.println("EXCEPTION: " + e);
     }finally{
       pool.freeConnection(conn);
     }
     return result;
   }
   
   
}//class ends
