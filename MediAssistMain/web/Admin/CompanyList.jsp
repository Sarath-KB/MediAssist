<%-- 
    Document   : UserList.jsp
    Created on : 11 Jan, 2022, 11:04:23 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <body>
    <%
        common_classes.mailconnection m = new common_classes.mailconnection();
            String mailid[] = {request.getParameter("mailid")};
            String name = request.getParameter("name");
            String subject = "Confirmation";
            if (request.getParameter("aid") != null) {

                String text = "Respected " + name + " Seller, \r\n \r\n"
                        + " This is from Medi Assist team,thank you for signing up to our service. \r\n"
                        + " We established  Aqua Guide in order to bring the  community more closer and effective. \r\n"
                        + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                        + " we were always happy to help!. \r\n \r\n"
                        + " Team Medi Assist.";
                boolean b = m.sendMail(mailid, subject, text);
                if (b) {
                String up="update tbl_company set company_vstatus='1' where company_id='"+request.getParameter("aid")+"'";
                con.executeCommand(up);
                out.println(up);
                response.sendRedirect("CompanyList.jsp");
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
                String up1="update tbl_company set company_vstatus='2' where company_id='"+request.getParameter("rid")+"'";
                con.executeCommand(up1);
                response.sendRedirect("CompanyList.jsp");
            }
         }
        %>
    <center>    <h1>Company List</h1>  </center> 
    <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                 <td>Name</td>
                <td>Username</td>
                <td>Address</td>
                    <td>Email</td>
                <td>Contact No</td>
                    <td>Company Logo</td>
                     <td>Company Proof</td>
                    <td>Company License Number</td>
                       
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_company where company_vstatus='1' ";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
               
            i++;
            %>
            <tr>
                <td><%=i%></td>
                  <td><%=rs.getString("company_name")%></td>
                <td><%=rs.getString("company_username")%></td>
                <td><%=rs.getString("company_address")%></td>
                 <td><%=rs.getString("company_email")%></td>
                  <td><%=rs.getString("company_contact")%></td>
                  <td ><img src="../Assets/Companylogo/<%=rs.getString("company_logo")%>" width="100" height="100"></td>
                  <td ><img src="../Assets/Companyproof/<%=rs.getString("company_proof")%>" width="100" height="100"></td>
                  
                   
                    <td><%=rs.getString("company_licno")%></td>
                    <td><a href="CompanyList.jsp?rid=<%=rs.getString("company_id")%>&mailid=<%=rs.getString("company_email")%>&name=<%=rs.getString("company_name")%>">Reject</a></td>
            </tr>
            <%
            }
            %>
        </table>
      
       <center>    <h1>Rejected List</h1>  </center> 
       <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                 <td>Company Logo</td>
                <td>username</td>
                <td>Address</td>
                    <td>Email</td>
                <td>Contact No</td>
                    <td>Company License Number</td>   
                    <td>Action</td>
                       
             
            </tr>
            <%
            String se1="select * from tbl_company where company_vstatus='2' ";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                  <td><img src="../Assets/Companylogo/<%=rs2.getString("company_logo")%>" width="100" height="100"></td>
                <td><%=rs2.getString("company_username")%></td>
                <td><%=rs2.getString("company_address")%></td>
                 <td><%=rs2.getString("company_email")%></td>
                  <td><%=rs2.getString("company_contact")%></td>
                  
                    <td><%=rs2.getString("company_licno")%></td>
                    <td><a href="CompanyList.jsp?aid=<%=rs2.getString("company_id")%>&mailid=<%=rs2.getString("company_email")%>&name=<%=rs2.getString("company_name")%>">Accept</a></td>
            </tr>
            <%
            }
            %>
        </table>
      
    </body>
</html>
