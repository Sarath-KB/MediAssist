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
           <%@include file="Header.jsp" %>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Branch</title>

    </head>
    <body>
    <center> <h1>Branch Registration</h1> </center>
    <form name="frmNew" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/BranchUploadAction.jsp">
        <table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
            <tr>
                <td>District Name</td>
                <td><select name="txtdistrict" onchange="getPlace(this.value)">
                        <option>--select--</option>
                        <%
                            String sel = "select * from tbl_district";
                            ResultSet rs = con.selectCommand(sel);
                            while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                        <%
                            }
                        %>

                    </select></tr>
            <tr>
                <td>Place Name</td>
                <td><select name="txtpname" id="txtpname">
                        <option>--select--</option>


                    </select></tr>  
            <tr>
                <td>Contact</td>
                <td><input type="text" name="txtcontact" pattern="[0-9]{10}" required></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="txtemail" required></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><textarea name="txtaddress" required></textarea>
                </td>                  
            </tr>

            <tr>
                <td>Owner name</td>
                <td><input type="text" name="txtname" required></td>
            </tr>
            <tr>
                <td>Owner Contact Number</td>
                <td><input type="text" name="txtocontact" required></td>
            </tr>
            <tr>

                <td>Owner Email</td>
                <td><input type="email" name="txtowneremail" required></td>
            </tr>
            <tr>
                <td>Owner Photo</td>
                <td><input type="file" name="ownerphoto" required>
                </td>
            </tr>

            <tr>
                <td>License Number</td>
                <td><input type="text" name="txtlicno"  required></td>
            </tr>
            <tr>
                <td>License Proof</td>
                <td><input type="file" name="licproof" required>
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
                    <input type="submit" name="btnsave" value="ADD">
                    <input type="submit" name="btncancel" value="CANCEL">
                </td>
            </tr>
        </table>
    </form>
</body>
   <%@include file="Footer.jsp" %>
</html>
<script src="../Assets/Jq/jQuery.js"></script>
<script>
                    function getPlace(did)
                    {
                        //alert(did);
                        $.ajax({
                            url: "../Assets/Ajaxpages/Ajaxplace.jsp?did=" + did,
                            success: function(html) {
                                $("#txtpname").html(html);
                                //alert(html);

                            }
                        });
                    }
</script>