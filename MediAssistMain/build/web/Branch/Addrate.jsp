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
            <title>Branch rate setting</title>
        </head>
        <body>
        <%
             String name = "", des = "", exp = "", rate = "", bid="";
       
            if (request.getParameter("btnsub") != null) 
            {
               
                
                String up="update tbl_bmedicine set bmedicine_rate='"+request.getParameter("txtbrate")+"' where bmedicine_id='"+session.getAttribute("bid")+"'";
                    con.executeCommand(up);
                    out.println(up);
                

            }
        %>
    <center>    <h1>Branch Medicine Rate</h1>  </center> 
    <a href="../Guest/LoginPage.jsp">Logout</a>

    <%
        String sel = "select * from tbl_bmedicine b  inner join tbl_cmedicine c on b.cmedicine_id=c.cmedicine_id where c.cmedicine_id='"+request.getParameter("aid") + "'";
        ResultSet rs = con.selectCommand(sel);
    
        
        int i = 0;
        while (rs.next()) {

            i++;

            name = rs.getString("cmedicine_name");
            des = rs.getString("cmedicine_description");
            exp = rs.getString("cmedicine_expduration");
            rate = rs.getString("cmedicine_rate");
             bid = rs.getString("bmedicine_id");
             session.setAttribute("bid", rs.getString("bmedicine_id"));

        }
        %><form>
    <table  align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
        <tr>
            <td>
                Name
            </td>
            <td>
                <input type="text" name="txtname" required="required" value="<%=name%>" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td>
                Description
            </td>
            <td>
                <input type="text" name="txtdes" required="required" value="<%=des%>" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td>
                Expiry Duration
            </td>
            <td>
                <input type="text" name="txtdura" required="required" value="<%=exp%>" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td>
                Company Rate
            </td>
            <td>
                <input type="text" name="txtcmprate" required="required" value="<%=rate%>" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td>
                Branch Rate
            </td>
            <td>
                <input type="text" name="txtbrate" required="required" value="">
            </td>
        </tr>

        <tr>


            <td colspan="2" align="center" ><input type="submit" value="ADD RATE" name="btnsub"></td>

        </tr>
    </table></form>
    </body>
</html>