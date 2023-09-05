
 
<%-- 
    Document   : UserList.jsp
    Created on : 11 Jan, 2022, 11:04:23 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
 
  <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View company Medicine</title>
    </head>
<body>
<center><h1>Medicines</h1></center>
<table align="center" cellpadding="10" style="border-collapse:collapse;" >
    <tr>
         
    
            <%
                
            String sel="select * from tbl_cmedicine ";
            ResultSet rs2=con.selectCommand(sel);
            int i=0;
            while(rs2.next())
            {
               
            i++;
            %>
            <td>
                <td><p style="text-align:center;border:1px solid #999;margin:22bx;padding:10px">
                         <img src="../Assets/Cmedicinephoto/<%=rs2.getString("cmedicine_image")%>" width="200" height="200">
                         <br> Name:<%=rs2.getString("cmedicine_name")%>
                <br>
                
                  <%=rs2.getString("cmedicine_description")%>
                   <br>
                  <%=rs2.getString("cmedicine_expduration")%>
                   <br>

                   <a href="Ordercmedicine.jsp?id=<%=rs2.getString("cmedicine_id")%>"> 
                       <input type="button" value="Order Now" name=""></a> 
                    </p></td>         
           
                
            <%
            if(i%4==0)
            {
                out.println("</tr>");
                 out.println("<tr>");
            }
            }
            %>
</table>
</body>
</html>