<%-- 
    Document   : editprofile
    Created on : 12 Jan, 2022, 11:31:03 AM
    Author     : Shilpa Shaji
--%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="SessionValidator.jsp" %>
<!DOCTYPE html>
<html>
    <head>
           <%@include file="Header.jsp" %>
    <br><br>
    <br>
    <br>
    <br>
    <br>
   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <centre> <title>Edit Profile </title></centre>
    </head>
    <body>
        <%
        String contact="", email="", address="", logo="",ownername="",ownercontact="",owneremail="",ownerphoto="";
      
        String sel="select * from tbl_branch where branch_id='"+session.getAttribute("buserid")+"'";
        ResultSet rs=con.selectCommand(sel);
                
                if(rs.next())
                    
                {
                   
                    contact=rs.getString("branch_contact");
                    email=rs.getString("branch_email");
                    address=rs.getString("branch_address");
                    ownername=rs.getString("branch_ownername");
                    ownercontact=rs.getString("branch_ownercontact");
                    owneremail=rs.getString("branch_owneremail");
                    ownerphoto=rs.getString("branch_ownerphoto");
                   
                    
                 
             }
                  
                
              
        %>
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Brancheditaction.jsp">
            <center>   <h1>Edit Profile</h1></center>
             <table border="1" cellpadding="10" align="center">
                 
                  <tr>
                     <td>
                         Email
                     </td>
                     <td>
                         <input type="email" name="txtmail" required="required" value="<%=email%>">
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
                         Address
                     </td>
                     <td>
                         <textarea name="txtaddress"><%=address%></textarea>
                     </td>
                 </tr>
                 
                  <tr>
                     <td>Owner Name</td>
                     <td>
                         <input type="text" name="txtownername" required="required" value="<%=ownername%>"
                                </td>
                 </tr>
                 <tr>
                     <td>Owner Contact</td>
                     <td>
                         <input type="text" name="txtownercontact" required="required" value="<%=ownercontact%>" >
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
                         Owner photo
                     </td>
                     <td>
                         <a href="#" onclick=""> 
                            
                             <img src="../Assets/Branchownerphoto/<%=ownerphoto%>" name="txtphoto" id="profile-image" height="120" width="120" align="center" />
                           
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
