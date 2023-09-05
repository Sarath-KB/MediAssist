<%-- 
    Document   : Ajaxplace
    Created on : 10 Jan, 2022, 2:33:24 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean> 
<option>--select--</option>
                            <%
                               String sel="select * from tbl_place where district_id='"+request.getParameter("did")+"'";
                               ResultSet rs=con.selectCommand(sel);
                               while(rs.next())
                               {
                                   %>
                                   <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
                                   <%
                               }
                           %>
                        