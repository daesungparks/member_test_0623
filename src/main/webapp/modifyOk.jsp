<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@	page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 완료</title>
</head>
<body>
<% 

		
      request.setCharacterEncoding("utf-8"); //한글깨짐방지

      String mid = request.getParameter("memberId");
      String mpw = request.getParameter("memberPw");
      String mname = request.getParameter("memberName");
      String memail = request.getParameter("memberEmail");
      String mphone = request.getParameter("memberphone");
      String mgender = request.getParameter("memberGender");
      
  	
	  String sessionPw = (String)session.getAttribute("pw");

	  if(sessionPw.equals(mpw)){
           
      String sql = "UPDATE testmember SET name='"+mname+"',email='"+memail+"',phone='"+mphone+"',gender='"+mgender+"'WHERE id='"+mid+"'";
       
      String driverName = "com.mysql.jdbc.Driver";
      String url = "jdbc:mysql://localhost:3306/odbo";
      String username = "root";
      String password = "042200";
      
      Connection conn = null;
      Statement stmt = null;
      
      try{
      Class.forName(driverName);// 드라이버 로딩
      conn = DriverManager.getConnection(url, username, password);
      //데이터베이스 연동
      stmt = conn.createStatement();//sql을 실행해주는 statement 객체 생성
      
      int resultCheck = stmt.executeUpdate(sql);//sql 실행 -> 1이 반환되면 성공, 아니면 실패
      
      if(resultCheck ==1 ){
          response.sendRedirect("modifySuccess.jsp");
      }else{
    	  response.sendRedirect("modify.jsp");
      }
      
      
      
      } catch(Exception e){
         e.printStackTrace();
      } finally{
         try{
            if(conn != null){
               stmt.close();
            }if(conn != null){
               conn.close();
            }
         }catch(Exception e){
            e.printStackTrace();
         }
        }     
      }	else{
    	  response.sendRedirect("modify.jsp");
      }
      
   %>
</body>
</html>