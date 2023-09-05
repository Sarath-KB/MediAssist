<%-- 
    Document   : editprofile
    Created on : 12 Jan, 2022, 11:31:03 AM
    Author     : Shilpa Shaji
--%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile </title>
    </head>
    <body>
        <%
        String contact="", email="", address="", name="", logo="";
      
        String sel="select * from tbl_company where company_id='"+session.getAttribute("cuserid")+"'";
        ResultSet rs=con.selectCommand(sel);
                
                if(rs.next())
                    
                {
                    name=rs.getString("company_name");
                    contact=rs.getString("company_contact");
                    email=rs.getString("company_email");
                    address=rs.getString("company_address");
                    logo=rs.getString("company_logo");
                    
                 
             }
                  
                
              
        %>
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Companyeditaction.jsp">
             <table border="1" cellpadding="10" align="center">
                 <tr>
                     <td colspan="2" align="center">
                         <a href="#" onclick=""> 
                            
                             <img src="../Assets/Companylogo/<%=logo%>" name="txtlogo" id="profile-image" height="120" width="120" align="center" />
                           
                            <input id="profile-image-upload" type="file" name="txtlogo" accept='image/*'  onchange="readURL(this)" style="display: none">
                        
                         </a>
                     </td>
                 </tr>
                 <tr>
                     <td>Company Name</td>
                     <td>
                         <input type="text" name="txtname" required="required" value="<%=name%>"
                                </td>
                 </tr>
                 <tr>
                     <td>Contact</td>
                     <td>
                         <input type="text" name="txtcontact" required="required" value="<%=contact%>" >
                     </td>
                 </tr>
                 <tr>
                     <td>
                         Email
                     </td>
                     <td>
                         <input type="email" name="txtmail" required="required" value="<%=email%>">
                     </td>
                 </tr>
                 <tr>
                     <td>Address</td>
                     <td>
                         <input type="text" name="txtaddress" required="required" value="<%=address%>">
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2" align="center">
                         <input type="submit" name="txtbtn" value="Save">
                     </td>
                 </tr>
              
             </table>
                 
             </table>
           
        </form>
    </body>
</html>
<script src="../Assets/Jq/jQuery.js"></script>
<script>
$('#profile-image').on('click', function(callback) {
    $('#profile-image-upload').click();
});
 function readURL(input) {
    if (input.files && input.files[0]) {
    
      var reader = new FileReader();
      reader.onload = function (e) { 
        document.querySelector("#profile-image").setAttribute("src",e.target.result);
      };

      reader.readAsDataURL(input.files[0]); 
    }
  }

	</script>