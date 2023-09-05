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

        

            String se = "select * from tbl_branchstock where  cmedicine_id='" + request.getParameter("txthidden") + "' ";
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
        
    %>
