
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
             String s="insert into tbl_complaints(branch_id,shop_id,complaints_senddate,complaints_description) values('"+request.getParameter("txtbranch")+"','"+session.getAttribute("suserid")+"',curdate(),'"+request.getParameter("txtcomplaints")+"')"; 
            out.println(s);
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
                    <td>Shop Name</td>
                    <td><select name="txtbranch">
                            <option>--select--</option>
                            <%
                                String sel="select * from tbl_branch";
                                ResultSet rs =con.selectCommand(sel);
                                while(rs.next())
                                {
                                    %>
                                    <option value="<%=rs.getString("branch_id")%>"><%=rs.getString("branch_ownername")%></option>
                                            <%
                                }
                                %>
                                }
                        </select></tr>
          <tr>
                <td>Complaint</td>
                <td><textarea name="txtcomplaints" required></textarea></td>
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
            String se1="select * from tbl_complaints w inner join tbl_shop a on w.shop_id=a.shop_id inner join tbl_branch e on w.branch_id=e.branch_id where w.complaints_vstatus='1' and a.shop_id='"+session.getAttribute("suserid")+"'";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                
                <td><%=rs2.getString("complaints_reply")%></td>
            
            <%
            }
            %>
          </table>
        </form>
    </body>
</html>