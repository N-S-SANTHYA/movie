<%-- 
    Document   : viewpos
    Created on : Jul 10, 2015, 7:59:22 PM
    Author     : ANITHA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link type="text/css" rel="stylesheet" href="css4.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All POS</title>
    </head>
    <body background="yellow-3.png">
        <h1>POS List:</h1>
        
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
         int i=1;
        stmt = conn.createStatement();
        result = stmt.executeQuery("SELECT * FROM poslogin");
        out.println("<h3>");
        while(result.next())
            {String name=result.getString(1);
            out.println("\n");
            
            out.println(i+")  "+name);
            out.println("<br>");
            out.println("<br>");
            i++;
            }
        out.println("</h3>");
        }
     
     catch (SQLException e) {
         System.out.println("Error occurred " + e);
      }
        %>
        
    </body>
</html>
