<%-- 
    Document   : Complaintview
    Created on : 18 Mar, 2022, 2:41:06 PM
    Author     : 91974
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint View</title>
    </head>
    <body>
        <h1><center>Complaint View</center></h1>

         <table border="1" align="center">

            <tr>
                <td>Sl.no</td>
                <td>Shop name</td>
                <td>Complaint Description</td>
                <td>Action</td>

                </tr>
 <%
            String se1="select * from tbl_complaints w inner join tbl_shop a on w.shop_id=a.shop_id inner join tbl_branch e on w.branch_id=e.branch_id where w.complaints_vstatus='0'";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("shop_name")%></td>
                <td><%=rs2.getString("complaints_description")%></td>
                <td><a href="shopcomplaintreply.jsp?eid=<%=rs2.getString("complaints_id")%>">Complaint Reply</a></td>
            
            <%
            }
            %>
          </table>
     </body>
</html>