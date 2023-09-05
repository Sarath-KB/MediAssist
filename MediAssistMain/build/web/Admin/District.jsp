<%-- 
    Document   : District
    Created on : 7 Jan, 2022, 2:58:15 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>
        
          
          <%
              String eid="",name="";
            if(request.getParameter("btnsave")!=null)
            {
                String dis="";
                dis=request.getParameter("txtdistrict");
               
                 if(request.getParameter("txthidden")!=null)
                {
                    String up="update tbl_district set district_name='"+dis+"'where district_id='"+request.getParameter("txthidden")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("District.jsp");
                }
             else
                 {
                 
                      String ins="insert into tbl_district(district_name)values('"+dis+"')";
                con.executeCommand(ins);
                out.print(ins);
                 }
                 
            }
            
            
            
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("District.jsp");
            }
              if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next())
                {
                    eid=rs1.getString("district_id");
                  
                   name=rs1.getString("district_name");
                    
                }
            }
            %>
    <center>    <h1>District</h1></center>
    <form name="frmDistrict" method="post">
        <table align="center">
             <input type="hidden" name="txthidden" value="<%=eid%>">
            <tr>
                <td>District Name</td>
                <td> <td><input type="text" name="txtdistrict" required value="<%=name%>"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="reset" name="btncancel" value="cancel">
                    </td>
                </tr>
        </table>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>District Name</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_district";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
               
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><a href="District.jsp?did=<%=rs.getString("district_id")%>"><img src="../icons/delete.jpg" width="20" height="20"></a>/<a href="District.jsp?eid=<%=rs.getString("district_id")%>"><img src="../icons/edit.png" width="20" height="20"></a></td>
            </tr>
            <%
            }
            %>
        </table>
       
       
    </form>
    </body>
</html>
