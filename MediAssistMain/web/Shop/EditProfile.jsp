<%-- 
    Document   : editprofile
    Created on : 12 Jan, 2022, 11:31:03 AM
    Author     : Shilpa Shaji
--%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%//@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile </title>
         <%@include file="Header.jsp" %>
    </head>
   
    <body>
        <%
        String contact="", email="", address="", name="",ownername="",ownerphoto="", owneremail="",ownercontact="";
      
        String sel="select * from tbl_shop where shop_id='"+session.getAttribute("suserid")+"'";
        ResultSet rs=con.selectCommand(sel);
                
                if(rs.next())
                    
                {
                    name=rs.getString("shop_name");
                    contact=rs.getString("shop_contact");
                    email=rs.getString("shop_email");
                    address=rs.getString("shop_address");
                
                      ownername=rs.getString("shop_ownername");
                    ownerphoto=rs.getString("shop_ownerphoto");
                    ownercontact=rs.getString("shop_ownercontact");
                      owneremail=rs.getString("shop_owneremail");
                      out.println(owneremail);
                    
                 
             }
                  
                
              
        %>
    <center><h1>Edit Profile</h1></center>
            <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Shopeditaction.jsp">
             <table border="1" cellpadding="10" align="center">
                 
                 <tr>
                     <td>Shop Name</td>
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
                         <textarea><%=address%></textarea>
                     </td>
                 </tr>
                  <tr>
                     <td>
                        Owner Name
                     </td>
                     <td>
                         <input type="text" name="txtoname" required="required" value="<%=ownername%>">
                     </td>
                 </tr>
                 <tr>
                     <td>
                        Owner Email
                     </td>
                     <td>
                         <input type="email" name="txtownermail" required="required" value="<%=owneremail%>">
                     </td>
                 </tr>
                  <tr>
                     <td>
                        Owner Contact
                     </td>
                     <td>
                         <input type="text" name="txtocontact" required="required" value="<%=ownercontact%>">
                     </td>
                 </tr>
                 <tr>
                     <td>
                         Owner photo
                     </td>
                     <td>
                         <a href="#" onclick=""> 
                            
                             <img src="../Assets/Shopownerphoto/<%=ownerphoto%>" name="txtphoto" id="profile-image" height="120" width="120" align="center" />
                           
                            <input id="profile-image-upload" type="file" name="txtlogo" accept='image/*'  onchange="readURL(this)" style="display: none">
                        
                         </a>
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
       <%@include file="Footer.jsp" %>
</html>
<script src="../Assets/JQ/jQuery.js"></script>
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

