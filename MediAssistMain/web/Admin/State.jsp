
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
        <title>State</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String st="";
                st=request.getParameter("txtstate");
                String ins="insert into tbl_state(state_name)values('"+st+"')";
                con.executeCommand(ins);
            }
            %>
        <h1>State</h1>
    <form name="frmState" method="post">
        <table >
            <tr>
                <td>State Name</td>
                <td> <td><input type="text" name="txtstate" required></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="reset" name="btncancel" value="cancel">
                    </td>
                </tr>
        </table>
        <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>State Name</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_state";
            ResultSet rs1=con.selectCommand(sel);
            int i=0;
            while(rs1.next())
            {
               
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("state_name")%></td>
                <td></td>
            </tr>
            <%
            }
            %>
        </table>
       
       
    </form>
    </body>
</html>
