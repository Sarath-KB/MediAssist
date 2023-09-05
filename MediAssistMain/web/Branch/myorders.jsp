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
        <title>My Orders</title>
        
    </head>
    <body>
         <%@include file="Header.jsp" %>
         <br>
         <br>
         <br>
         <br>
          <br>
         <br>
         <br>
         <br>
    
      <center>    <h1>My Orders</h1>  </center> 
       <table border="1" align="center" cellpadding="10" style="border-collapse:collapse;" border="1">
            <tr>
                 <td>Sl.no</td>
                <td>Medicine name</td>
                <td> Quantity</td>
                <td>Totatl Amount</td>
                    <td>Date</td>
                
                       
                       
              
            </tr>
            <%
            String se="select * from tbl_branchpurchase bp inner join tbl_branchpurchasehead bph on bph.bph_id=bp.bph_id inner join tbl_cmedicine cm on cm.cmedicine_id=bp.cmedicine_id inner join tbl_branch br on br.branch_id=bph.branch_id where bph.branch_id='"+session.getAttribute("buserid")+"'";
            ResultSet rs1=con.selectCommand(se);
            int j=0;
            while(rs1.next())
            {
               
            j++;
            %>
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("cmedicine_name")%></td>
                <td><%=rs1.getString("bp_qty")%></td>
                 <td><%=rs1.getString("bph_totalamt")%></td>
                  <td><%=rs1.getString("bph_date")%></td>
                 
            </tr>
            <%
            }
            %>
        </table>
      
      
    </body>
        <%@include file="Footer.jsp" %>
</html>
