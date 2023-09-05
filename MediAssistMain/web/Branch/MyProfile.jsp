 
<%-- 
    Document   : UserList.jsp
    Created on : 11 Jan, 2022, 11:04:23 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<head>
        <%@include file="Header.jsp" %>
        <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
</head>
<body>
<center><h1>Your Profile</h1></center>
 <a href="../Guest/LoginPage.jsp">Logout</a>
<table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
   
            <%
            String sel="select * from tbl_branch where branch_id='"+session.getAttribute("buserid")+"' ";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            if(rs.next())
            {
                %>
                 <tr>
                   <td>Branch Username</td>
                   <td><%=rs.getString("branch_username")%></td>
               </tr>
             
             
             
                    <td>Branch Email</td>
                  <td><%=rs.getString("branch_email")%></td>
               </tr>
               <tr>
                   <td>Branch Address</td>
                   <td><%=rs.getString("branch_address")%></td>
                   
            </tr>
             <tr>
                   <td>Branch Contact No</td>
                   <td><%=rs.getString("branch_contact")%></td>
                   
            </tr>
            <tr>
                   <td>Branch License No</td>
                   <td><%=rs.getString("branch_licno")%></td>
                   
            </tr>
            <tr>
                   <td>Branch License Proof</td>
                   <td ><img src="../Assets/Branchlicproof/<%=rs.getString("branch_licproof")%>" width="100" height="100"></td>
                   
            </tr>
               <tr>
                     <td>Branch Owner Photo</td>
                    <td><img src="../Assets/Branchownerphoto/<%=rs.getString("branch_ownerphoto")%>" width="100" height="100"></td>
                </tr>
                  <tr><td>Owner Contact No</td>
                 <td><%=rs.getString("branch_ownercontact")%></td>
               </tr>
               </tr>
                  <tr><td>Owner Email</td>
                 <td><%=rs.getString("branch_owneremail")%></td>
               </tr>
               
               <tr>
                   
            <%
            }
            %>
        </table>
</body>
    <%@include file="Footer.jsp" %>
</html>
   