<%-- 
    Document   : ChangePasssword
    Created on : 11 Jan, 2022, 2:53:59 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%@include file="SessionValidator.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String current="", confirm="";
                String ne=" ";
               
                current=request.getParameter("txtpwd1");
                ne=request.getParameter("txtpwd2");
                confirm=request.getParameter("txtpwd3");
                 String sel="select * from tbl_company where company_id='"+session.getAttribute("cuserid")+"' and company_password='"+current+"' ";
            ResultSet rs1=con.selectCommand(sel);
            
            if(rs1.next())
            {
                   if(ne.equals(confirm))
                 {
                     String up="update tbl_company set company_password='"+ne+"' where company_id='"+session.getAttribute("cuserid")+"'";
                    con.executeCommand(up);
                    %>
                   <script>alert("password updated");</script>
                     <%
                    //response.sendRedirect("ChangePassword.jsp");
                     
                 }
                   else
                   {
                       %>
                    <script>alert("New Password or Confirm Password does not match");</script>
                  <% 
                   }
                 
            }
             
             else
             {
                %>
                     <script>alert("Your current password is incorrect");</script>
                     <% 
             }
            }
        %>
    <center>  <h1>CHANGE PASSWORD</h1> </center>
        <form>
            <table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
                <tr>
                    <td>Current Password</td><td><input type="password" name="txtpwd1"></td>
                </tr>
                <tr>
                    <td>New Password</td><td><input type="password" name="txtpwd2"></td>
                </tr>
                <tr>
                    <td> Confirm Password</td><td><input type="password" name="txtpwd3"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btncancel" value="CANCEL">
                    </td>
                </tr>
            </table>      
        </form>
    </body>
</html>
