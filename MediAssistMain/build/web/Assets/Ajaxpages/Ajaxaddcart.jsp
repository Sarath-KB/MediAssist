
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String id = request.getParameter("id");
    String selQry = "select count(*) as count from tbl_branchpurchasehead where branch_id='" + session.getAttribute("buserid") + "' and bph_status='0'";
    ResultSet rsC = con.selectCommand(selQry);
    rsC.next();
    if (Integer.parseInt(rsC.getString("count")) > 0) {
        String sel = "select bph_id as id from tbl_branchpurchasehead where branch_id='" + session.getAttribute("buserid") + "' and bph_status='0'";
        ResultSet rs = con.selectCommand(sel);
        if (rs.next()) {
            String sqlQry = "select count(*) as count from tbl_branchpurchase where bph_id='" + rs.getString("id") + "' and cmedicine_id='" + id + "'";
            ResultSet rsc = con.selectCommand(sqlQry);
            rsc.next();
            if (Integer.parseInt(rsc.getString("count")) > 0) {
                out.println("Already Added to Cart");
            } else {
                String insQry = "insert into tbl_branchpurchase(bph_id,cmedicine_id)values('" + rs.getString("id") + "','" + id + "')";
                if (con.executeCommand(insQry)) {
                    out.println("Added to Cart");
                } else {
                    out.println("Failed to Add Cart");
                }
            }
        }
    } else {
        String ins = "insert into tbl_branchpurchasehead(branch_id,bph_date)values('" + session.getAttribute("buserid") + "',curdate())";
        if (con.executeCommand(ins)) {
            String sel = "select Max(bph_id) as id from tbl_branchpurchasehead";
            ResultSet rs = con.selectCommand(sel);
            if (rs.next()) {
                String insQry = "insert into tbl_branchpurchase(bph_id,cmedicine_id)values('" + rs.getString("id") + "','" + id + "')";
                if (con.executeCommand(insQry)) {
                    out.println("Added to Cart");
                } else {
                    out.println("Failed to Add Cart");
                }
            }
        }
    }


%>