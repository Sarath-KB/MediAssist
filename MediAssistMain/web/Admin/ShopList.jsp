<%-- 
    Document   : UserList.jsp
    Created on : 11 Jan, 2022, 11:04:23 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop List</title>
    </head>
    <body>
    <%common_classes.mailconnection m = new common_classes.mailconnection();
            String mailid[] = {request.getParameter("mailid")};
            String name = request.getParameter("name");
            String subject = "Confirmation";
            if (request.getParameter("aid") != null) {

                String text = "Respected " + name + " Seller, \r\n \r\n"
                        + " This is from Medi Assist team,thank you for signing up to our service. \r\n"
                        + " Medi Assist was established for the primary purpose of helping healthcare. \r\n"
                        + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                        + " we were always happy to help!. \r\n \r\n"
                        + " Team Medi Assist.";
                boolean b = m.sendMail(mailid, subject, text);
                if (b) {
                String up="update tbl_shop set shop_vstatus='1' where shop_id='"+request.getParameter("aid")+"'";
                con.executeCommand(up);
               
                response.sendRedirect("ShopList.jsp");
            }
            }
         
          if (request.getParameter("rid") != null) {
                String text = "Respected " + name + " administrator,\r\n \r\n"
                        + " It has been noticed that,there is a mismatch in the datas that you provided \r\n"
                        + " or this Account has been noticed with inappropriate action. \r\n"
                        + " So we are Suspending your account for some period So this account Freezed. \r\n"
                        + " let us check your information and make actions accordingly... \r\n \r\n"
                        + " Team Medi Assist.";
                boolean b = m.sendMail(mailid, subject, text);
                if (b) {
                String up1="update tbl_shop set shop_vstatus='2' where shop_id='"+request.getParameter("rid")+"'";
                con.executeCommand(up1);
                response.sendRedirect("ShopList.jsp");
            }
         }
         
     
        %>
    <center>    <h1>Shop List</h1>  </center> 
     <a href="../Guest/LoginPage.jsp">Logout</a>
    <table  align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
            <tr>
                <td>Sl.no</td>
                <td>username</td>
                <td>Shop Address</td>
                    <td>Shop Email</td>
                <td>Shop Contact No</td>
                <td>Shop Logo</td>
                 <td>Shop Proof</td>
                    <td>Shop Owner Name</td>
                    <td>Shop Owner Photo</td>
                    <td>Shop Owner Email</td>
                    <td>Shop Owner Proof</td>
                    <td>Shop License Number</td>
                  <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_shop where shop_vstatus='0' ";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
               
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("shop_username")%></td>
                <td><%=rs.getString("shop_address")%></td>
                 <td><%=rs.getString("shop_email")%></td>
                  <td><%=rs.getString("shop_contact")%></td>
                  <td ><img src="../Assets/Shoplogo/<%=rs.getString("shop_logo")%>" width="100" height="100"></td>
                  <td ><a href="../Assets/Shopproof/<%=rs.getString("shop_proof")%>"><img src="../Assets/Shopproof/<%=rs.getString("shop_proof")%>" width="100" height="100"></td>
                   <td><%=rs.getString("shop_ownername")%></td>
                   <td ><img src="../Assets/Shopownerphoto/<%=rs.getString("shop_ownerphoto")%>" width="100" height="100"></td>
                   <td><%=rs.getString("shop_owneremail")%></td>
                   <td ><img src="../Assets/Shopownerproof/<%=rs.getString("shop_ownerproof")%>" width="100" height="100"></td>
                   
                    <td><%=rs.getString("shop_licno")%></td>
                     <td><a href="ShopList.jsp?rid=<%=rs.getString("shop_id")%>&mailid=<%=rs.getString("shop_email")%>&name=<%=rs.getString("shop_name")%>">Reject</a></td>
            </tr>
            <%
            }
            %>
        </table>
      <center>    <h1>Accepted List</h1>  </center> 
       <table border="1" cellpadding="10" style="border-collapse:collapse;" align="center">
            <tr>
                <td>Sl.no</td>
                <td>username</td>
                <td>Address</td>
                    <td>Email</td>
                <td>Contact No</td>
                    <td>Shop Owner Name</td>
                    <td>Shop License Number</td>
                    <td>Action</td>
                       
              
            </tr>
            <%
            String se="select * from tbl_shop where shop_vstatus='1' ";
            ResultSet rs1=con.selectCommand(se);
            int j=0;
            while(rs1.next())
            {
               
            j++;
            %>
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("shop_username")%></td>
                <td><%=rs1.getString("shop_address")%></td>
                 <td><%=rs1.getString("shop_email")%></td>
                  <td><%=rs1.getString("shop_contact")%></td>
                   <td><%=rs1.getString("shop_ownername")%></td>
                    <td><%=rs1.getString("shop_licno")%></td>
                 <td><a href="ShopList.jsp?rid=<%=rs1.getString("shop_id")%>&mailid=<%=rs1.getString("shop_email")%>&name=<%=rs1.getString("shop_name")%>">Reject</a></td>
            </tr>
            </tr>
            <%
            }
            %>
        </table>
       <center>    <h1>Rejected List</h1>  </center> 
       <table border="1"cellpadding="10" style="border-collapse:collapse;" align="center">
            <tr>
                <td>Sl.no</td>
                <td>username</td>
                <td>Address</td>
                    <td>Email</td>
                <td>Contact No</td>
                    <td>Shop Owner Name</td>
                    <td>Shop License Number</td>
                        <td>Action</td>   
             
            </tr>
            <%
            String se1="select * from tbl_shop where shop_vstatus='2' ";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("shop_username")%></td>
                <td><%=rs2.getString("shop_address")%></td>
                 <td><%=rs2.getString("shop_email")%></td>
                  <td><%=rs2.getString("shop_contact")%></td>
                   <td><%=rs2.getString("shop_ownername")%></td>
                    <td><%=rs2.getString("shop_licno")%></td>
                <td><a href="ShopList.jsp?aid=<%=rs2.getString("shop_id")%>&mailid=<%=rs2.getString("shop_email")%>&name=<%=rs2.getString("shop_name")%>">Accept</a></td>
            
            </tr>
            </tr>
            <%
            }
            %>
        </table>
      
    </body>
</html>
