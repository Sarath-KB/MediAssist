<%-- 
    Document   : Complaint
    Created on : 18 Mar, 2022, 12:53:18 PM
    Author     : 91974
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <body>
      <%
          
             if(request.getParameter("btnsave")!=null)
            {
             String s="insert into tbl_complaint(company_id,branch_id,complaint_senddate,complaint_description) values('"+request.getParameter("txtcompany")+"','"+session.getAttribute("buserid")+"',curdate(),'"+request.getParameter("txtcomplaint")+"')"; 
            //out.println(s);
             con.executeCommand(s);
             %>
             <script>alert("Complaint Uploaded Successfully");
             </script>
              <%   
            }
        %>
            <h1><center>Complaint</center></h1>
    <form name="frmComplaint" method="post">
        <table align="center">
            <input type="hidden" name="txthidden"  required>
             <tr>
                    <td>Company</td>
                    <td><select name="txtcompany">
                            <option>--select--</option>
                            <%
                                String sel="select * from tbl_company";
                                ResultSet rs =con.selectCommand(sel);
                                while(rs.next())
                                {
                                    %>
                                    <option value="<%=rs.getString("company_id")%>"><%=rs.getString("company_name")%></option>
                                            <%
                                }
                                %>
                                }
                        </select></tr>
          <tr>
                <td>Complaint</td>
                <td><textarea name="txtcomplaint" required></textarea></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Send Complaint">
                    </td>
                </tr>
        </table>
                               
                                
                                
                                <table border="1" align="center">                  
                                 <tr>
                <td>Sl.no</td>
                <td>Complaint Reply</td>

                </tr>
 <%
            String se1="select * from tbl_complaint w inner join tbl_branch a on w.branch_id=a.branch_id inner join tbl_company e on w.company_id=e.company_id where w.complaint_vstatus='1' and a.branch_id='"+session.getAttribute("buserid")+"'";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                
                <td><%=rs2.getString("complaint_reply")%></td>
            
            <%
            }
            %>
          </table>
        </form>
    </body>
</html>