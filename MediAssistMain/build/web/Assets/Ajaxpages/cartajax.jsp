<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("action").equals("Delete")) {
        String id = request.getParameter("id");
        String delQry = "delete from tbl_branchpurchase where bp_id='" + id + "'";
        con.executeCommand(delQry);
    }
    if (request.getParameter("action").equals("Update")) {
        String id = request.getParameter("id");
        String qty = request.getParameter("qty");
        String upQry = "update tbl_branchpurchase set bp_qty = '" + qty + "' where bp_id='" + id + "'";
        System.out.println(upQry);
        con.executeCommand(upQry);
    }
%>