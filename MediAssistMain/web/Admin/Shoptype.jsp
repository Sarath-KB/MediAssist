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
        <title>District</title>
    </head>
    <body>
        
          
          <%
              String eid="",name="";
            if(request.getParameter("btnsave")!=null)
            {
                String shop="";
                shop=request.getParameter("txtshop");
               
                 if(!request.getParameter("txthidden").equals(""))
                {
                    String up="update tbl_shoptype set shoptype_name='"+shop+"'where shoptype_id='"+request.getParameter("txthidden")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("Shoptype.jsp");
                }
             else
                 {
                 
                      String ins="insert into tbl_shoptype(shoptype_name)values('"+shop+"')";
                      out.println(ins);
                con.executeCommand(ins);
                 }
                 
            }
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_shoptype where shoptype_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Shoptype.jsp");
            }
              if(request.getParameter("eid")!=null)
            {
                String sel1="select * from tbl_shoptype where shoptype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                if(rs1.next())
                {
                    eid=rs1.getString("shoptype_id");
                  
                   name=rs1.getString("shoptype_name");
                    
                }
            }
            %>
    <center>    <h1>Shop Type </h1></center>
    <form name="frmShoptype" method="post">
        <table align="center">
             <input type="hidden" name="txthidden" value="<%=eid%>">
            <tr>
                <td>Shop name</td>
                <td> <td><input type="text" name="txtshop" required value="<%=name%>"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="reset" name="btncancel" value="cancel">
                    </td>
                </tr>
        </table>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>Shop Name</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_shoptype";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
               
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("shoptype_name")%></td>
                <td><a href="Shoptype.jsp?did=<%=rs.getString("shoptype_id")%>">Delete</a>/<a href="Shoptype.jsp?eid=<%=rs.getString("shoptype_id")%>">Edit</a></td>
            </tr>
            <%
            }
            %>
        </table>
       
       
    </form>
    </body>
</html>