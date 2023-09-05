<%-- 
    Document   : MyPurchasedMedicine
    Created on : Apr 29, 2022, 9:17:09 AM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <%@include file="Header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Stock Available Products</title>
        <script>
            function Views(){
               
                    document.getElementById("hide").removeAttribute("hidden");
               
                    
                
               
            }
            </script>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null){
                String up="update tbl_bmedicine set bmedicine_rate='"+request.getParameter("amount")+"' where bmedicine_id='"+request.getParameter("medicineid")+"'";
                con.executeCommand(up);
                response.sendRedirect("MyPurchasedMedicine.jsp");
            }
        %>
        <form method="post">
            <table border="1" cellpadding="10" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Medicine Name</th>
                    <th>Medicine Category</th>
                    <th>Image</th>
                    <th>Company Rate</th>
                    <th>Stock Available</th>
                    <th>Stock Status</th>
                </tr>
                <%
                    String sel="select * from tbl_branchpurchase b inner join tbl_branchpurchasehead bh on bh.bph_id=b.bph_id inner join tbl_cmedicine c on c.cmedicine_id=b.cmedicine_id inner join tbl_medicinecategory mc on mc.medicinecategory_id=c.medicinecategory_id inner join tbl_bmedicine bm on bm.cmedicine_id=b.cmedicine_id inner join tbl_branchstock bs on bs.bmedicine_id=bm.bmedicine_id where bh.branch_id='"+session.getAttribute("buserid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                            <td>
                                <%=i%>
                            </td>
                            <td>
                                <%=rs.getString("cmedicine_name")%>
                            </td>
                            <td>
                                <%=rs.getString("medicinecategory_name")%>
                            </td>
                            <td>
                                <img src="../Assets/Cmedicinephoto/<%=rs.getString("cmedicine_image")%>" width="150" height="150">
                            </td>
                             <td>
                                <%=rs.getString("cmedicine_rate")%>
                            </td>
                        
                             <td>
                                <%=rs.getString("branchstock_qty")%>
                            </td>
                            <td>
                                <%
                                if(Integer.parseInt(rs.getString("branchstock_qty"))<=0){
                                    %>
                                    <span style="color: red">Out Of Stock | <a href="Viewcmedicine.jsp">Purchase Medicine</a></span>
                                    <%
                                }
                                else if(Integer.parseInt(rs.getString("branchstock_qty"))<=15)
                                {
                                     %>
                                    <span style="color: orange">Less Stock | <a href="Viewcmedicine.jsp">Purchase Medicine</a></span>
                                    <%
                                }
                                else{
                                     %>
                                     <span style="color: green">Available | <a href="MyPurchasedMedicine.jsp?medicineid=<%=rs.getString("bmedicine_id")%>" onclick="Views()">Add Rate</a></span>
                                    <%
                                }
                                %>
                            </td>
                        </tr>
                        <%
                    }
                %>
                
            </table>
                <table hidden="" id="hide">
                    <tr>
                        <td>Amount</td>
                        <td><input type="text" name="amount" value=""></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="btnsave" value="Add"><input type="reset" name="btnsave" value="Add"></td>
                    </tr>
                    
                </table>
        </form>
    </body>
        <%@include file="Footer.jsp" %>
</html>
