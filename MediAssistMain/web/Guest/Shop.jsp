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
        <title>New Shop</title>
     
    </head>
    <body>
    <center>   <h1>Shop Registration</h1> </center>
    <form name="frmNew" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/shopregaction.jsp">
            <table align ="center">
                <tr>
                    <td>Shop Name</td>
                <td><input type="text" name="txtfname" required></td>
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
                     <td>Address</td>
                <td><textarea name="txtaddress" required></textarea>
                </td>                  
                </tr>
                
                <tr>
                    <td>District Name</td>
                    <td><select name="txtdistrict" onchange="getPlace(this.value)">
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
                    <td>Place Name</td>
                    <td><select name="txtpname" id="txtpname">
                            <option>--select--</option>
                             
                        
                        </select></tr>  
                  
               
                 <tr>
                <td>Logo</td>
                <td><input type="file" name="shoplogo" required>
                </td>
                </tr>
                <tr>
                <td>Proof</td>
                <td><input type="file" name="shopproof" required>
                </td>
                </tr>
                 <tr>
                      <td>License Number</td>
                <td><input type="text" name="txtlicno" required></td>
                </tr>
                <tr>
                    <td>Shop type</td>
                    <td><select name="txtshop">
                              <option>--select--</option>
                            <%
                               String se="select * from tbl_shoptype";
                               ResultSet rs1=con.selectCommand(se);
                               while(rs1.next())
                               {
                                   %>
                                   <option value="<%=rs1.getString("shoptype_id")%>"><%=rs1.getString("shoptype_name")%></option>
                                   <%
                               }
                           %>
                        
                        </select></tr>
                        <tr>
                <td>Username</td>
                <td><input type="text" name="txtuser" required></td>
                </tr>
                  <tr>
                <td>Owner Name</td>
                <td><input type="text" name="txtoname" required></td>
                </tr>
                 <tr>
                <td>Owner Contact</td>
                <td><input type="text" name="txtocontact" required></td>
                </tr>
                <tr>
                 <td>Owner Email</td>
                <td><input type="email" name="txtowneremail" required></td>
                </tr>
                <tr>
                <td>Owner Photo</td>
                <td><input type="file" name="txtophoto" required>
                </td>
                </tr>
                 <tr>
                <td>Owner Proof</td>
                <td><input type="file" name="ownerproof" required>
                </td>
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
<script src="../Assets/Jq/jQuery.js"></script>
<script>
function getPlace(did)
{
	//alert(did);
	$.ajax({
	url: "../Assets/Ajaxpages/Ajaxplace.jsp?did="+did,
	 
	  success: function(html){
		$("#txtpname").html(html);
                //alert(html);
		
	  }
	});
}
</script>
