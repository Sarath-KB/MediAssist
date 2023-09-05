 
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
        <title>HomePage</title>
        <%@include file="SessionValidator.jsp" %>
    </head>
<body>
<center><h1>Your Profile</h1></center>
<table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
   
            <%
            String sel="select * from tbl_company where company_id='"+session.getAttribute("cuserid")+"' ";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            if(rs.next())
            {
                 %>
                  <tr>
                     
                   <td align="center" colspan="2"><img src="../Assets/Companylogo/<%=rs.getString("company_logo")%>" width="100" height="100"></td>
                  
                </tr>
            
                  <tr>
                   <td> Name</td>
                   <td><%=rs.getString("company_name")%></td>
               </tr>
                 <tr>
                   <td> Username</td>
                   <td><%=rs.getString("company_username")%></td>
               </tr>
             
               <tr>
             
                    <td>Email</td>
                  <td><%=rs.getString("company_email")%></td>
               </tr>
               <tr>
                   <td> Address</td>
                   <td><%=rs.getString("company_address")%></td>
                   
            </tr>
             <tr>
                   <td>Contact Number</td>
                   <td><%=rs.getString("company_contact")%></td>
                   
            </tr>
            <tr>
                   <td>License Number</td>
                   <td><%=rs.getString("company_licno")%></td>
                   
            </tr>
           
            
               
            
                   
            <%
            }
            %>
        </table>
</body>
</html>