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
   
      <center>    <h1>Requested Branch List</h1>  </center> 
       <table border="1" align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
            <tr>
                <td>Sl.no</td>
                <td>username</td>
                <td>Address</td>
                    <td>Email</td>
                <td>Contact No</td>
                    <td>Branch Owner Name</td>
                    <td>Branch License Number</td>
                  <td>Action</td>
                       
                       
              
            </tr>
            <%
            String se="select * from tbl_branchpurchasehead b inner join tbl_branch br on br.branch_id=b.branch_id where b.bph_requeststatus='1' ";
            ResultSet rs2=con.selectCommand(se);
            int j=0;
            while(rs2.next())
            {
               
            j++;
            %>
            <tr>
                <td><%=j%></td>
                <td><%=rs2.getString("branch_username")%></td>
                <td><%=rs2.getString("branch_address")%></td>
                 <td><%=rs2.getString("branch_email")%></td>
                  <td><%=rs2.getString("branch_contact")%></td>
                   <td><%=rs2.getString("branch_ownername")%></td>
                    <td><%=rs2.getString("branch_licno")%></td>
        <td> <a href="viewbranchrequest.jsp?rid=<%=rs2.getString("branch_id")%>">View Detials</a></td>
            </tr>
            <%
            }
            %>
       </table>
    </body>
     <%@include file="Footer.jsp" %>
</html>
