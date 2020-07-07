<%@ page import="java.sql.*"%>
<html>
    
    <body>
       
     <style>
            body{
                background-color: black;
                color: white;
             
            }
            td,th{
                font-size: 20px;
    padding-left:50px;
    padding-bottom: 15px;
    
            }
        </style>        
        <%
              
      try
      {
       Class.forName("oracle.jdbc.driver.OracleDriver");    
       Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "kreeti1210");  
       Statement statement = con1.createStatement();
			String sql ="SELECT * FROM foodlog";
			ResultSet resultSet = statement.executeQuery(sql);
                        %>
                        <div style="float:centre; ">
                                <table>
                    <tr>
                    
                    <th>Name         </th><br>
                    <th>Year   </th><br>
		<th>Library Id   </th><br>
		<th>Money    </th><br>
                </tr>
		
                                <%
		while(resultSet.next()){
                    if(resultSet.getString("name")==null)
                    continue;
		%>
                
		<tr> 
                <td><%=resultSet.getString("name")%></td><br>
		<td><%=resultSet.getString("year") %></td><br>
		<td><%=resultSet.getString("id") %></td><br>
		<td><%=resultSet.getString("money") %></td><br>
               
		</tr>
              
		<%
        }
        %>  
                                </table> 
                        </div>
                                <%
        }
        catch(Exception ex)
        {
            out.println("Error!!");
            
        }
        
        
        
        
      %>  
      <br>
      <br>
      <br>
      <div style="float:centre; ">
       <a href="index.html" style="background-color: crimson; color: yellow; font-size: 25px;padding:15px;  margin: 200px;  align-content: center">Go Back </a><br>
      </div>  </body>
</html>