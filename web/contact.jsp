<%-- 
    Document   : contact
    Created on : 1 Dec, 2015, 4:32:55 PM
    Author     : N.S.SANTHYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Using GET Method to Read Form Data</title>
</head>
<body>
<%   
             Connection conn = null;
    ResultSet result = null;
    Statement stmt = null;


    try {
      Class c = Class.forName("com.mysql.jdbc.Driver");
    }
    catch (Exception e) {
      System.out.println("Error occurred " + e);
     }
     try {
         
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sse", "root","admin");
     }
     catch (SQLException e) {
        System.out.println("Error occurred " + e);
     }
     try {
         stmt = conn.createStatement();
          String name=request.getParameter("name");
          String mail=request.getParameter("emsil");
          String sub=request.getParameter("subject");
          String mess=request.getParameter("messsage");
          
       String s="insert into contact values(?,?,?,?)";
        PreparedStatement ps= conn.prepareStatement(s);
        ps.setString(1,name);
        ps.setString(2,mail);
        ps.setString(3,sub);
        ps.setString(4,mess);
        
       ps.executeUpdate();
        }
     
     catch (Exception e) {
         System.out.println("Error occurred " + e);
      }
     out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link type='text/css' rel='stylesheet' href='stylesheet.css'/>");
            out.println("<title>Message Sent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>YOUR MESSAGE HAS BEEN SUCCESFULLY SENT!!</h1>");
            out.println("<h1>YOUR FEEDBACK MEANS A LOT TO US!!</h1>");
            out.println("<a style='color:silver' href='index.html'>GO TO HOME!!</a>");
           // out.println("<img src='wallpaper-2.jpg' alt='image' background-size='cover'/>");
            out.println("</body>");
            out.println("</html>");
        %>
        
        <script type="text/javascript">
function alertName(){
alert("Message sent!!!");
} 
</script> 
<script type="text/javascript"> window.onload = alertName; </script>


</body>
</html>
    </body>
</html>
