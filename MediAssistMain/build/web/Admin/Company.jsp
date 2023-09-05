<%-- 
    Document   : NewUser.jsp
    Created on : 10 Jan, 2022, 10:04:11 AM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Company</title>
     
    </head>
    <body>
    <center> <h1>Company Registration</h1> </center>
        <form name="frmNew" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/companyregaction.jsp">
            <table align="center">
                 <tr>
                    <td>Company Name</td>
                <td><input type="text" name="txtcname" required></td>
                </tr>
                                <tr>
                 <td>Contact</td>
                <td><input type="text" name="txtcontact" pattern="[0-9]{10}" required></td>
                </tr>
                         <tr>
                <td>Email</td>
                <td><input type="email" name="txtemail" required></td>
                </tr>
                 <tr>
                    <td>District Name</td>
                    <td><select name="txtdistrict" >
                              <option>--select--</option>
                            <%
                               String sel="select * from tbl_district";
                               ResultSet rs=con.selectCommand(sel);
                               while(rs.next())
                               {
                                   %>
                                   <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                   <%
                               }
                           %>
                        
                        </select></tr>
                <tr>
                     <td>Address</td>
                <td><textarea name="txtaddress" required></textarea>
                </td>                  
                </tr>
                 <tr>
                <td>Logo</td>
                <td><input type="file" name="clogo" required>
                </td>
                </tr>
                </tr>
                 <tr>
                      <td>License Number</td>
                <td><input type="text" name="txtlicno" required></td>
                </tr>
                 <tr>
                <td> Proof</td>
                <td><input type="file" name="cproof" required>
                </td>
                </tr>
                 
                   
                 
                <tr>
                    <td>Username</td>
                <td><input type="text" name="txtuser" required></td>
                </tr>
                 
                <tr>
                <td>Password</td>
                <td><input type="password" name="txtpsswd" required></td>
                </tr>
                <tr>
                <td>Confirm Password</td>
                <td><input type="password" name="txtpsswd1" required></td>
                </tr>
                 
                 
                
                        <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="submit" name="btncancel" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>

</html>