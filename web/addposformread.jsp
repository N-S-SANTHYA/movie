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
          String name=request.getParameter("posname");
           String pwd=request.getParameter("pwd");
       String s="insert into poslogin (uname,pwd) values(?,?)";
        PreparedStatement ps= conn.prepareStatement(s);
        ps.setString(1,name);
        ps.setString(2,pwd);
       ps.executeUpdate();
        }
     
     catch (Exception e) {
         System.out.println("Error occurred " + e);
      }
     out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link type='text/css' rel='stylesheet' href='stylesheet.css'/>");
            out.println("<title></title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1></h1>");
            out.println("<a style='color:silver' href='index.html'>GO TO HOME!!</a>");
           // out.println("<img src='wallpaper-2.jpg' alt='image' background-size='cover'/>");
            out.println("</body>");
            out.println("</html>");
        %>
        
       <script type="text/javascript">
function alertName(){
alert("POS Officer details added to the database!!!");
} 
</script> 
<script type="text/javascript"> window.onload = alertName; </script>


</html>