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
           <%@include file="Header.jsp" %>
           <br>
    <br>
    <br><br>
    <br>
    <br>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BranchList</title>
        
    </head>
    <body>
    <%
        
        if(request.getParameter("rid")!=null)
            {
                String up1="update tbl_branch set branch_vstatus='2' where branch_id='"+request.getParameter("rid")+"'";
                con.executeCommand(up1);
                response.sendRedirect("BranchList.jsp");
            }
        if(request.getParameter("aid")!=null)
            {
                String up2="update tbl_branch set branch_vstatus='1' where branch_id='"+request.getParameter("aid")+"'";
                con.executeCommand(up2);
                response.sendRedirect("BranchList.jsp");
            }
        %>
   
      <center>    <h1>Accepted List</h1>  </center> 
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
            String se="select * from tbl_branch where branch_vstatus='1' ";
            ResultSet rs1=con.selectCommand(se);
            int j=0;
            while(rs1.next())
            {
               
            j++;
            %>
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("branch_username")%></td>
                <td><%=rs1.getString("branch_address")%></td>
                 <td><%=rs1.getString("branch_email")%></td>
                  <td><%=rs1.getString("branch_contact")%></td>
                   <td><%=rs1.getString("branch_ownername")%></td>
                    <td><%=rs1.getString("branch_licno")%></td>
            <td> <a href="BranchList.jsp?rid=<%=rs1.getString("branch_id")%>">Reject</a></td>
            </tr>
            <%
            }
            %>
        </table>
       <center>    <h1>Rejected List</h1>  </center> 
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
            String se1="select * from tbl_branch where branch_vstatus='2' ";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("branch_username")%></td>
                <td><%=rs2.getString("branch_address")%></td>
                 <td><%=rs2.getString("branch_email")%></td>
                  <td><%=rs2.getString("branch_contact")%></td>
                   <td><%=rs2.getString("branch_ownername")%></td>
                    <td><%=rs2.getString("branch_licno")%></td>
                      <td> <a href="BranchList.jsp?aid=<%=rs2.getString("branch_id")%>">Accept</a></td>
            </tr>
            <%
            }
            %>
        </table>
      
    </body>
       <%@include file="Footer.jsp" %>
</html>
