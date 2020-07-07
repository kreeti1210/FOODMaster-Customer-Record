<%-- 
    Document   : insert_candidate
    Created on : Jul 5, 2020, 7:37:06 PM
    Author     : lenovo
--%>

<%@ page import="java.sql.*"%>
<html>
    
    <body>
        <style>
            body{
                background-color: black;
                color: white;
                padding: 50px;
            }
               p,th,td
               {
                   font-size: 20px;
               padding:10px;
                font-family: serif;
            background: crimson;
    }
        </style>
        <%
         String name= request.getParameter("rname");
         String year= request.getParameter("year");  
         String id= request.getParameter("id");
         String money= request.getParameter("money");
       
         
         
    try{
         Class.forName("oracle.jdbc.driver.OracleDriver");    
         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "kreeti1210");  
          PreparedStatement pst = con.prepareStatement("insert into foodlog values(?,?,?,?)"); 
          pst.setString(1, name);
          pst.setString(2, year);
          pst.setString(3, id);
          pst.setString(4, money);
         int x = pst.executeUpdate();
         if(x!=0)
         {
              %>
              <p>Candidate <%=name%> added successfully!!</p><br>
              
       
       <%
         }
         else
         {
           %>
              <p>Error updating data!!!</p><br>
              
       
       <%
         }
         }
         catch(Exception e)
         {
             out.print(e);
         }
        

        %>
        
        
        <br>
        <br>
         <a href="index.html" style="background-color: crimson; color: yellow; font-size: 25px;padding:15px;  margin-top: 100px; margin-bottom: 200px;">Go Back </a><br>
        
        
        
    </body>
</html>


