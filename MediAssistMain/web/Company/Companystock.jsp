<%-- 
    Document   : District
    Created on : 7 Jan, 2022, 2:58:15 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%@include file="SessionValidator.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CompanyStock</title>
    </head>
    <body>


        <%

            
           // out.println(id);
            //System.out.println(id);
          
            if (request.getParameter("btnsave") != null) 
            {
                String sel = "select * from tbl_companystock where cmedicine_id='" +  request.getParameter("id")+ "'";
                ResultSet rs = con.selectCommand(sel);
                //out.println(rs);
                if (rs.next()) 
                {
                    
                int sum=Integer.parseInt(rs.getString("companystock_qty"))+ Integer.parseInt(request.getParameter("txtqty"));
                    String up = "update tbl_companystock set companystock_qty='"+sum+"' where cmedicine_id='" +  request.getParameter("id")+ "'";;
                    con.executeCommand(up);
                    //out.println(up);
                }   
                else
                {

                    String ins = "insert into tbl_companystock(companystock_qty,cmedicine_id)values('" +request.getParameter("txtqty") + "','" + request.getParameter("id") + "')";
                    out.println(ins);
                    con.executeCommand(ins);
                }
                    response.sendRedirect("Addmedicine.jsp");
            }


        %>
    <center>    <h1>Add stock  </h1></center>
    <form name="frmcompanystock" method="POST" >
        <table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">

            <tr>
                <td>Quantity</td>
                <td> <td><input type="text" name="txtqty" value="" placeholder="Enter Stock Now" required ></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btnsave" value="save">
                    <input type="reset" name="btncancel" value="cancel">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
