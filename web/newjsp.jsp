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
          String fname=request.getParameter("first_name");
          String lname=request.getParameter("last_name");
          String dp=request.getParameter("datepicker");
          String ph=request.getParameter("phone");
          
       String s="insert into reservation values(?,?,?,?)";
        PreparedStatement ps= conn.prepareStatement(s);
        ps.setString(1,fname);
        ps.setString(2,lname);
        ps.setString(3,dp);
        ps.setString(4,ph);
        
       ps.executeUpdate();
        }
     
     catch (Exception e) {
         System.out.println("Error occurred " + e);
      }
     out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link type='text/css' rel='stylesheet' href='stylesheet.css'/>");
            out.println("<title>Servlet gateway</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Table has been successfully reserved!!</h1>");
            out.println("<h1>WE ARE READY TO SERVE YOU!!</h1>");
            out.println("<a style='color:silver' href='index.html'>GO TO HOME!!</a>");
           // out.println("<img src='wallpaper-2.jpg' alt='image' background-size='cover'/>");
            out.println("</body>");
            out.println("</html>");
        %>
        
        <script type="text/javascript">
function alertName(){
alert("Reservation added to database!!!");
} 
</script> 
<script type="text/javascript"> window.onload = alertName; </script>


</body>
</html>