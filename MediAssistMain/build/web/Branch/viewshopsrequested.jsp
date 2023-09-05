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
        <title>BranchList</title>
        
    </head>
    <body>
     <%@include file="Header.jsp" %>
     <br>
     <br>
     <br>
     <br>
     <br>
   
      <center>    <h1>Requested Shop List</h1>  </center> 
       <table border="1" align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
            <tr>
                <td>Sl.no</td>
                <td>username</td>
                <td>Address</td>
                    <td>Email</td>
                <td>Owner Contact No</td>
                <td>Shop Owner name</td>
                   
                  <td>Action</td>
                       
                       
              
            </tr>
            <%
            String se="select * from tbl_shoppurchasehead b inner join tbl_shop br on br.shop_id=b.shop_id where b.sph_requeststatus='1' ";
            ResultSet rs2=con.selectCommand(se);
            int j=0;
            while(rs2.next())
            {
               
            j++;
            %>
            <tr>
                <td><%=j%></td>
                <td><%=rs2.getString("shop_username")%></td>
                <td><%=rs2.getString("shop_address")%></td>
                 <td><%=rs2.getString("shop_email")%></td>
                  <td><%=rs2.getString("shop_ownercontact")%></td>
                   <td><%=rs2.getString("shop_ownername")%></td>
                  
        <td> <a href="viewshoprequest.jsp?rid=<%=rs2.getString("shop_id")%>">View Detials</a></td>
            </tr>
            <%
            }
            %>
       </table>
    </body>
     <%@include file="Footer.jsp" %>
</html>
