
<%-- 
    Document   : Login.jsp
    Created on : 10 Jan, 2022, 10:03:24 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
             if(request.getParameter("btnlogin")!=null)
            {
                String user="",pwd="";
                user=request.getParameter("txtuser");
                 pwd=request.getParameter("txtpwd");
                 
                 
                   String sel="select * from tbl_shop where shop_username='"+user+"' and shop_password='"+pwd+"' and shop_vstatus='"+1+"' ";
            ResultSet rs=con.selectCommand(sel);
            
            
             String se="select * from tbl_company where company_username='"+user+"' and company_password='"+pwd+"' and company_vstatus='"+1+"' ";
            ResultSet rs1=con.selectCommand(se);
            
            
             String se1="select * from tbl_branch where branch_username='"+user+"' and branch_password='"+pwd+"'  and branch_vstatus='"+1+"' ";
            ResultSet rs2=con.selectCommand(se1);
            
            
            String se1Admin="select * from tbl_admin where admin_username='"+user+"' and admin_password='"+pwd+"'";
            ResultSet rsAdmin=con.selectCommand(se1Admin);
            
            if(rs.next())
            {
             session.setAttribute("suserid", rs.getString("shop_id"));
             session.setAttribute("suserpass", rs.getString("shop_password"));
              session.setAttribute("susername", rs.getString("shop_username"));
             response.sendRedirect("../Shop/Homepage.jsp");
            }         
            
            else if(rs1.next())
            {
             session.setAttribute("cuserid", rs1.getString("company_id"));
             session.setAttribute("cuserpass", rs1.getString("company_password"));
              session.setAttribute("cusername", rs1.getString("company_username"));
             response.sendRedirect("../Company/Homepage.jsp");
                      
            }
            else if(rs2.next())
            {
             session.setAttribute("buserid", rs2.getString("branch_id"));
             session.setAttribute("buserpass", rs2.getString("branch_password"));
              session.setAttribute("busername", rs2.getString("branch_username"));
             response.sendRedirect("../Branch/Homepage.jsp");
                      
            }
            
              else if(rsAdmin.next())
            {
             
             response.sendRedirect("../Admin/Homepage.jsp");
                      
            }
            else
            {
                %>
                  <script>alert("Username or Password is incorrect");</script>
                <%
            
            }
            }
                
            %>
    <center>  <h1>Login</h1> </center>
        <form name="frmLogin" method="post">
            <table align="center">
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="txtuser" required></td>
                </tr>
                 <tr>
                    <td>Password</td>
                    <td><input type="Password" name="txtpwd" required></td>
                </tr>
                  <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnlogin" value="Login">
                        <input type="Reset" name="btnreset" value="Reset">
                    </td>
                </tr>
                
                       <tr>
                    <td colspan="2" align="center">
                        <a href="Company.jsp">NewCompany</a>
                        <a href="Shop.jsp">NewShop</a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

