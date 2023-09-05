<%-- 
    Document   : NewUser.jsp
    Created on : 10 Jan, 2022, 10:04:11 AM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%@include file="SessionValidator.jsp" %>
<!DOCTYPE html>
<html>
    <head>
           <%@include file="Header.jsp" %>
           <br>
    <br>
    <br><br>
    <br>
    <br>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Medicine</title>
     
    </head>
    <body>
    <center>   <h1>Add Medicine</h1> </center>
    <form name="frmNew" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/Addmedicineaction.jsp">
        <table align ="center" cellpadding="10" style="border-collapse:collapse;" border="1">
                <tr>
                    <td>Name</td>
                <td><input type="text" name="txtmname" required></td>
                </tr>
                      <tr>
                 <td>Image</td>
                <td><input type="file" name="mphoto" required></td>
                </tr>
                <tr>
                    <td>Description</td>
                <td><input type="text" name="txtmdes" required></td>
                </tr>
                <tr>
                     <td>Expiry Duration</td>
                <td><input type="date" name="txtmexp" required></textarea>
                </td> 
                </tr>
                <tr>
                     <td>Rate</td>
                <td><input type="text" name="txtmrate" required></textarea>
                </td> 
                </tr>
                <tr>
                       <td>Category</td>
                
                    <td><select name="txtmcat">
                              <option>--select--</option>
                            <%
                               String sel="select * from tbl_medicinecategory";
                               ResultSet rs=con.selectCommand(sel);
                               while(rs.next())
                               {
                                   %>
                                   <option value="<%=rs.getString("medicinecategory_id")%>"><%=rs.getString("medicinecategory_name")%></option>
                                   <%
                               }
                           %>
                        
                        </select>
                </td>  
                </tr>
                
                    <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Add Medicines">
                        <input type="submit" name="btncancel" value="Clear All">
                    </td>
                </tr>
            </table>
    </form>
                           <center><h1>Medicines</h1> </center>
                           <table align ="center" cellpadding="10" style="border-collapse:collapse;" border="1">
            <tr>
                <td>Sl.no</td>
                <td>Name</td>
                <td>Image</td>
                <td>Description</td>
                <td>Stock</td>
                <td>Expiry</td>
                <td>Action</td>
                
            </tr>
            <%
            String se1="select * from tbl_cmedicine";
            ResultSet rs2=con.selectCommand(se1);
            int i=0;
            String medicineStock="";
            while(rs2.next())
            {
               String selStock="select * from tbl_companystock where cmedicine_id='"+rs2.getString("cmedicine_id")+"'";
           
               ResultSet rsStock=con.selectCommand(selStock);
               if(rsStock.next()){
              
               medicineStock=rsStock.getString("companystock_qty");
               }
               else{
              
               medicineStock="0";
               }
               i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs2.getString("cmedicine_name")%></td>
                <td><img src="../Assets/Cmedicinephoto/<%=rs2.getString("cmedicine_image")%>" width="100" height="100"></td>
                <td><%=rs2.getString("cmedicine_description")%></td>
                <td><h3><span style="color:red;"><%= medicineStock %></span></h3></td>
                <td><%=rs2.getString("cmedicine_expduration")%></td>
                <td><a href="Companystock.jsp?id=<%=rs2.getString("cmedicine_id")%>">Add stock</a></td>
            </tr>
                
            <%
            }
            %>
        </table>
       
  
</body>
   <%@include file="Footer.jsp" %>
</html>
    