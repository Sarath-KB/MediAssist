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
           <%@include file="Header.jsp" %>
    <br>
    <br>
    <br>
    <br>
    <br>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change password</title>
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
                 String sel="select * from tbl_shop where shop_id='"+session.getAttribute("suserid")+"' and shop_password='"+current+"' ";
            ResultSet rs=con.selectCommand(sel);
            
            if(rs.next())
            {
                   if(ne.equals(confirm))
                 {
                     String up="update tbl_shop set shop_password='"+ne+"' where shop_id='"+session.getAttribute("suserid")+"'";
                    con.executeCommand(up);
                    %>
                   <script>alert("password updated");</script>
                     <%
                    //response.sendRedirect("ChangePassword.jsp");
                     
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
        <h1>CHANGE PASSWORD</h1>
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
                        <input type="submit" name="btnsave" value="save">
                        <input type="reset" name="btncancel" value="cancel">
                    </td>
                </tr>
            </table>      
        </form>
    </body>
</html>
