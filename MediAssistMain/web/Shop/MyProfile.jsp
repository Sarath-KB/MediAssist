 
<%-- 
    Document   : UserList.jsp
    Created on : 11 Jan, 2022, 11:04:23 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
   <%@include file="SessionValidator.jsp" %>
   <html>
       <head>
              <%@include file="Header.jsp" %>
       <br>
       <br>
       <br>
       <br>
       <br>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
    </head>
<body>
<center><h1>Your Profile</h1>
</center>
<table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
   
            <%
            String sel="select * from tbl_shop where shop_id='"+session.getAttribute("suserid")+"' ";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            if(rs.next())
            {
                %>
                 <tr>
                
                   <td colspan="2"><img src="../Assets/Shoplogo/<%=rs.getString("shop_logo")%>" width="100" height="100"></td>
                   
            </tr>
                 <tr>
                   <td>Shop Username</td>
                   <td><%=rs.getString("shop_username")%></td>
               </tr>
             
             
             
                    <td>Shop Email</td>
                  <td><%=rs.getString("shop_email")%></td>
               </tr>
               <tr>
                   <td>Shop Address</td>
                   <td><%=rs.getString("shop_address")%></td>
                   
            </tr>
             <tr>
                 <td>Shop Contact No</td>
                   <td><%=rs.getString("shop_contact")%></td>
                   
            </tr>
            <tr>
                   <td>Shop License No</td>
                   <td><%=rs.getString("shop_licno")%></td>
                   
            </tr>
            
            <tr>
                   <td>Shop Proof</td>
                   <td ><img src="../Assets/Shopproof/<%=rs.getString("shop_proof")%>" width="100" height="100"></td>
                   
            </tr>
               <tr>
                     <td>Shop Owner Photo</td>
                    <td><img src="../Assets/Shopownerphoto/<%=rs.getString("shop_ownerphoto")%>" width="100" height="100"></td>
               
               </tr>
                  <tr><td>Shop Owner Email</td>
                 <td><%=rs.getString("shop_owneremail")%></td>
               </tr>
                <tr>
                    <td>Shop Owner Proof</td>
                    <td><img src="../Assets/Shopownerproof/<%=rs.getString("shop_ownerproof")%>" width="100" height="100"></td>
               </tr>           
</table>       
   </body>
   <%@include file="Footer.jsp" %></html>           <%
            }
            %>
  