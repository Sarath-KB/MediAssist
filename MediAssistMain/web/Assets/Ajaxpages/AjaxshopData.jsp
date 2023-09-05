        
         <%--
    Document   : AjaxDistrictWorkerSearch
    Created on : 28 Jan, 2022, 3:37:23 PM
    Author     : asanj
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table border="0" cellpadding="50" align="center">

                    <tr>
                        <%
                            String sel = "select * from tbl_cmedicine c  inner join tbl_bmedicine b on c.cmedicine_id=b.bmedicine where true";
                            if(!request.getParameter("cid").equals(""))
                            {
                                 sel+=" and medicinecategory_id='"+request.getParameter("cid")+"' ";
                            }
                            ResultSet rs = con.selectCommand(sel);
                            int Count = 0;
                            while (rs.next()) {

                                Count++;

                        %>
<td>
                            <p style="text-align: center; border: 1px  solid #999;margin: 22px;padding: 10px;">
                                <br>
                                <img src="../Assets/Cmedicinephoto/<%=rs.getString("cmedicine_image")%>" width="200" height="200">
                                <br>
                               <%=rs.getString("cmedicine_name")%>
                        <br>
                        <%=rs.getString("cmedicine_description")%>
                        <br>
                        <%=rs.getString("cmedicine_expduration")%>
                       
                        <br>
                        <br>
                        <%=rs.getString("cmedicine_rate")%>
                       
                        <br>
                      
                               
                                <%
                                    String stock = "select sum(branchstock_qty) as  stock from tbl_branchstock where bmedicine_id = '" + rs.getString("bmedicine_id") + "'";
                                    ResultSet rsST = con.selectCommand(stock);
                                    rsST.next();
                                    if (rsST.getString("stock") != null) {
                                        int stocks = Integer.parseInt(rsST.getString("stock"));
                                        if (stocks > 0) {
                                            //out.println(rs.getString("cableitem_id"));
                                %>
                                <a href="javascript:void(0)" onclick="addCart('<%=rs.getString("bmedicine_id")%>')" class="btn btn-success btn-block">Add to Cart</a>
                                <%
                                } else if (stocks == 0) {
                                %>
                                <a href="javascript:void(0)" class="btn btn-danger btn-block">Out of Stock</a>
                                <%
                                    }
                                } else {
                                %>
                                <a href="javascript:void(0)" class="btn btn-warning btn-block">Stock Not Found</a>
                                <%
                                    }
                                %>

                            </p>                                                                  
                        </td>

                        <%
                            if (Count == 4) {
                        %>
                    </tr>
                    <tr>
                        <%
                                Count=0;
                                }
                            }

                        %>
                    </tr>
                </table>