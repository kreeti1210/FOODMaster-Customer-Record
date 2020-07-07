<%-- 
    Document   : search_candi
    Created on : Jul 5, 2020, 8:24:24 PM
    Author     : lenovo
--%>

</html><%@ page import="java.sql.*"%>
<html>
    
    <body>
        <% String money="",name="",year="";%>
     <style>
            body{
                background-color: black;
                color: white;
                padding: 50px;
            }
            td,th{
                font-size: 20px;
    padding:10px;
            }
            p
               {
                   font-size: 20px;
               padding:10px;
                font-family: serif;
            background: crimson;
    }
        </style>        
        <%
              String id= request.getParameter("id");
      try
      {
       Class.forName("oracle.jdbc.driver.OracleDriver");    
       Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "kreeti1210");  
       Statement statement = con1.createStatement();
			String sql ="SELECT * FROM foodlog where id="+id;
			ResultSet resultSet = statement.executeQuery(sql);
		
                                    if(resultSet.next()==false)
                                    {
                                         %>
              <p>Error finding data!!!</p><br>
              
       
       <%
                                    }
else
{                 %>
                        
                                <table>
                    <tr>
                    
                    <th>Name         </th><br>
                    <th>Year   </th><br>
		<th>Library Id   </th><br>
		<th>Money    </th><br>
                </tr>
		
                                <%
                                    
		while(resultSet.next()){
		%>
                
		<tr>
                    
                    <td><%=resultSet.getString("name") %></td><br>
		<td><%=resultSet.getString("year") %></td><br>
		<td><%=resultSet.getString("id") %></td><br>
		<td><%=resultSet.getString("money") %></td><br>
                <% money=resultSet.getString("money"); %>
                <% year=resultSet.getString("year"); %>
                <% name=resultSet.getString("name"); %>
               <% id=resultSet.getString("id"); %>
		</tr>
              
		<%
        }

        %>  
                                </table> 
                                <%
        }
        
        }
        catch(Exception ex)
        {
            out.println("Error!!");
            
        }
        
        
        
        
      %>  
      <br>
      <br>
      <br>
     
     
   
         <form action="update.jsp" method="post">    
     <table style="float:right;font-size:20px;font-family: sans-serif">
      <tr>
          <th colspan="2" style="padding:10px;font-family: serif; background-color: brown;font-size: 25px;">SELECT TO MODIFY</th>
       </tr>
       <tr>
      <th>Amount:</th><th><input  type="text" name="amount"/> </th>
       </tr> 
       <tr><th> Add:<input   type="radio" name="add" value="add"/></th>
       <th> Subtract:<input   type="radio" name="subtract" value="subtract"/></th>
       <th> delete:<input   type="radio" name="delete" value="delete"/></th></tr>
       <%
        session.setAttribute("id", id);
        session.setAttribute("year", year);
        session.setAttribute("name",name);
        session.setAttribute("money", money);
        %>
       <tr><th></th><th> <input style="background-color: crimson; color: white;"type="submit" value="Next"/></th>
       </tr>
     </table>
        <a href="index.html" style="background-color: crimson; color: yellow; font-size: 25px;padding:15px;  margin-top: 100px;">Go Back </a><br>
     
    </body>
     
        
        
      
        
    </body>
</html>
