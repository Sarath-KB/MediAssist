
        
         <%--
    Document   : AjaxDistrictWorkerSearch
    Created on : 28 Jan, 2022, 3:37:23 PM
    Author     : asanj
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cid="";
   
    cid=request.getParameter("cid");
   
    String sel="select * from tbl_cmedicine c  inner join tbl_medicinecategory d on d.medicinecategory_id=c.medicinecategory_id";

    if(cid!="")
    {
        //out.println(wid);
        sel+=" and d.medicinecategory_id='"+cid+"' ";
        //out.println(sel);
    }
    %>
<table>
    <tr>
<%
    ResultSet rs=con.selectCommand(sel);
    System.out.println(sel);
    int i=0;
    while(rs.next())
    {
        i++;
      %>
        <td><p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                <img src="../Assets/Worker/<%=rs.getString("worker_photo")%>" width="100" height="100"><br>
           Name: <%=rs.getString("worker_name") %><br>
           Contact: <%=rs.getString("worker_contact") %><br>
           
                                    <a href="ViewPreviousWork.jsp?wid=<%=rs.getString("worker_id")%>">View Previous Work</a>
                                    <br>
                                    <a href="ViewLatestWork.jsp?wid=<%=rs.getString("worker_id")%>">View Latest Work</a>
                                    <br>
                                    <a href="ViewService.jsp?wid=<%=rs.getString("worker_id")%>">View Services</a>
            </p></td>
     <%
            if(i%4==0)
            {
                out.println("</tr>");
                               
                out.println("<tr>");
                 i=0;
            }
    }
%>
</table>               
                        
            