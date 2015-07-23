package signUp;

import java.util.*;
import java.sql.*;
import connectionPool.*;
import signUp.RegisterBean;

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
         regBean.setMem_firstname(rs.getString("firstname"));
         regBean.setMem_lastname(rs.getString("lastname"));
         regBean.setMem_address(rs.getString("address"));
         regBean.setMem_phone1(rs.getString("phone1"));
         regBean.setMem_phone2(rs.getString("phone2"));
         regBean.setMem_phone3(rs.getString("phone3"));
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
       pool.freeConnection(conn, pstmt, rs);
     }
     return result;
   }
   
   public boolean checkId(String mem_id){
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     boolean result = false;
     try{
       conn = pool.getConnection();
       String strQuery = "select id from member where id = ?";
       pstmt = conn.prepareStatement(strQuery);
       pstmt.setString(1, mem_id);
       rs = pstmt.executeQuery();
       result = rs.next();
     }catch(Exception e){
       System.out.println("Exception: " + e);
     }finally{
       pool.freeConnection(conn, pstmt, rs);
     }
     return result;
   }
   
   public boolean memberInsert(RegisterBean regBean){
     Connection conn = null;
     PreparedStatement pstmt = null;
     Boolean insert = false;
     try{
       conn = pool.getConnection();
       String strQuery = "insert into member values (?,?,?,?,?,?,?,?,?)";
       pstmt  = conn.prepareStatement(strQuery);
       pstmt.setString(1, regBean.getMem_id());
       pstmt.setString(2, regBean.getMem_password());
       pstmt.setString(3, regBean.getMem_firstname());
       pstmt.setString(4, regBean.getMem_lastname());
       pstmt.setString(5, regBean.getMem_phone1());
       pstmt.setString(6, regBean.getMem_phone2());
       pstmt.setString(7, regBean.getMem_phone3());
       pstmt.setString(8, regBean.getMem_email());
       pstmt.setString(9, regBean.getMem_birthday());
       int count = pstmt.executeUpdate();
       
       if(count>0){
         insert = true;
       }
     }catch(Exception e){
       System.out.println("Exception: " + e);
     }finally{
       pool.freeConnection(conn, pstmt);
     }
     return insert;
   }
   
   
}//class ends
