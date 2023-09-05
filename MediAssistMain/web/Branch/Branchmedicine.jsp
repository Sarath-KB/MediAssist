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
    <%@include file="Header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Branch medicine List</title>
    </head>
    <body>
        <br><br><br><br><br><br><br><br><br><br>    
    <center>    <h1>Medicine List</h1>  </center> 
     <a href="../Guest/LoginPage.jsp">Logout</a>
    <table  align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
            <tr>
                <td>Sl.no</td>
                <td>Name</td>
                <td>Description</td>
                    <td>Expiry Duration</td>
                <td>Company Rate</td>
               
                  <td>Action</td>
            </tr>
            <%
           String name = "", des = "", exp = "", rate = "";
        String sel = "select * from tbl_bmedicine b inner join tbl_cmedicine c on b.cmedicine_id=c.cmedicine_id where b.branch_id='" + session.getAttribute("buserid") + "'";
        ResultSet rs = con.selectCommand(sel);
     
            int i=0;
            while(rs.next())
            {
               
            i++;
            %>
            <tr> 
                <td><%=i%></td>
                <td><%=rs.getString("cmedicine_name")%></td>
                <td><%=rs.getString("cmedicine_description")%></td>
                 <td><%=rs.getString("cmedicine_expduration")%></td>
                  <td><%=rs.getString("cmedicine_rate")%></td>
                   <td><a href="Addrate.jsp?aid=<%=rs.getString("cmedicine_id")%>">Branch Rate</a></td>
            </tr>
            <%
            }
            %>
        </table>
</body><br><br><br><br>
<%@include file="Footer.jsp" %>