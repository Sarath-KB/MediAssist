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
        <title>Buy Medicine</title>
    </head>
    <body>
                
        <form name="frmcompanystock" method="post">
    <center>    <h1>Medicine  </h1></center>



    <%

        if (request.getParameter("btnsave") != null) {

            String se = "select * from tbl_companystock where  cmedicine_id='" + request.getParameter("txthidden") + "' ";
            ResultSet rs1 = con.selectCommand(se);
             
                //  out.println(se);
            if (rs1.next()) {
                  int a= Integer.parseInt(rs1.getString("companystock_qty"));
               int b=Integer.parseInt(request.getParameter("txtqty"));
                if(a>b)
                {
                int cstock = a-b;
                String up = "update tbl_companystock set companystock_qty='" + cstock + "' where cmedicine_id='" + request.getParameter("txthidden") + "'";
                con.executeCommand(up);
                }
                else
                {
                 %>
                  <script>alert("No available stock");</script>
                <%   
            }
              //  out.println(up);
            }
        }
    %>
  
        <table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
              <input type="hidden" name="txthidden" value="<%=request.getParameter("id")%>">
               
            <tr>
            <%
                String sel = "select * from tbl_cmedicine c inner join tbl_medicinecategory m on c.medicinecategory_id= m.medicinecategory_id where c.cmedicine_id='" + request.getParameter("id") + "' ";
                ResultSet rs = con.selectCommand(sel);
                if (rs.next()) {
            %>
           

                <td align="center" colspan="2"><img src="../Assets/Cmedicinephoto/<%=rs.getString("cmedicine_image")%>" width="100" height="100"></td>

            </tr>

            <tr>

                <td> Name</td>
                <td><%=rs.getString("cmedicine_name")%></td>
            </tr>

            <tr>

                <td>Description</td>
                <td><%=rs.getString("cmedicine_description")%></td>
            </tr>
            <tr>
                <td> Expiry Duration</td>
                <td><%=rs.getString("cmedicine_expduration")%></td>

            </tr>
            <tr>
                <td>Category</td>
                <td><%=rs.getString("medicinecategory_name")%></td>

            </tr>


           <%
                }
           
           
           %>      

        </table>
        <center><h1>Order Detials </h1></center>
         <a href="../Guest/LoginPage.jsp">Logout</a>
        <table align="center" cellpadding="10" style="border-collapse:collapse;" border="1">

            <tr>
                <td>No of Bottles/Strips</td>
                <td> <input type="text" name="txtqty" required ></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btnsave" value="Buy Medicine">
                    <input type="reset" name="btncancel" value="cancel">
                </td>
            </tr>
        </table>


    </form>
</body></html>

