<%-- 
    Document   : update
    Created on : Jul 5, 2020, 10:39:56 PM
    Author     : lenovo
--%>

</html><%@ page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
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
             String id=session.getAttribute("id").toString();
             String name=session.getAttribute("name").toString();
             String year=session.getAttribute("year").toString();
              String money=session.getAttribute("money").toString();
              String amount=request.getParameter("amount");
              String subtract=request.getParameter("subtract");
              String add=request.getParameter("add");
              String delete=request.getParameter("delete");
              
             
      try
      {
       Class.forName("oracle.jdbc.driver.OracleDriver");    
       Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "kreeti1210");  
 
       
       if(delete !=null)
       {
            String qry="delete from foodlog where id=\'"+id+"\'";
            Statement st1 = con1.createStatement();
       ResultSet rs= st1.executeQuery(qry);
       %>
       <p>Customer details deleted!</p>
       <%
       }
      else if(add != null)
       {
           int a=Integer.parseInt(amount);
              int m=Integer.parseInt(money);
           int t=m+a;
           String mm=Integer.toString(t);
          
                    
        String sql1="update foodlog set name=?, year=?, id=?, money=? where id=\'"+id+"\'";
            PreparedStatement ps = con1.prepareStatement(sql1);
            ps.setString(1,name);
            ps.setString(2,year);
            ps.setString(3,id);
            ps.setString(4,mm);
                
            
            int i = ps.executeUpdate();
               if(i > 0)
                {
              %>
              <p>Updated successfully!!</p><br>
              <p> Money added= <%=amount%></p>
       
       <%
               }
                 else
                       {
                     %>
              <p>Error updating data!!!</p><br>
              
       
       <%
               }
      
      }
       else
       {
        int a=Integer.parseInt(amount);
              int m=Integer.parseInt(money);
           int t=m-a;
           String mm=Integer.toString(t);
           
             String sql1="update foodlog set name=?,year=?, id=?, money=? where id=\'"+id+"\'";
            PreparedStatement ps = con1.prepareStatement(sql1);
            ps.setString(1,name);
            ps.setString(2,year);
            ps.setString(3,id);
            ps.setString(4,mm);
                
            
            int i = ps.executeUpdate();
               if(i > 0)
                {
   %>
              <p>Updated successfully!!</p><br>
              <p> Money deducted= <%=amount%></p>
       
       <%
}
else
{
   %>
              <p>Error updating data!!!</p><br>
              
       
       <%
}
           
       }
}
      catch(Exception e)
              {
                  out.print(e);
              }
      %>
      <br>
      <form action="search_candi.jsp" method="post">
			<table align="center">
		
      <tr>
          <th colspan="2" style="padding:20px;">SEARCH CANDIDATE BY ID</th></br>
       </tr>
	    <td>Library Id</td>
	  <td> <input type="text" name="id"/></td></br>
	  
       </tr>
	    <tr>
            <td></td><td><input type="reset" value="Clean"><input type="submit" value="Search"></td> </br> 
        </tr>
        </table>
           <br>
                            <br>
                            <br>
                            
                            <a href="fulldb.jsp" align="centre" style="background-color: brown; color: yellow; font-size: 25px;padding:15px;   ">SEE WHOLE LIST </a><br>
        

    </body>
</html>
