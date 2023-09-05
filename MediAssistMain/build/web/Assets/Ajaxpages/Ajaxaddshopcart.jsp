
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String id = request.getParameter("id");
    String selQry = "select count(*) as count from tbl_shoppurchasehead where shop_id='" + session.getAttribute("suserid") + "' and sph_status='0'";
    System.out.println(selQry);
    ResultSet rsC = con.selectCommand(selQry);
    rsC.next();
    if (Integer.parseInt(rsC.getString("count")) > 0) {
        String sel = "select sph_id as id from tbl_shoppurchasehead where shop_id='" + session.getAttribute("suserid") + "' and sph_status='0'";
         System.out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        if (rs.next()) {
            String sqlQry = "select count(*) as count from tbl_shoppurchase where sph_id='" + rs.getString("id") + "' and bmedicine_id='" + id + "'";
             System.out.println(sqlQry);
            ResultSet rsc = con.selectCommand(sqlQry);
            rsc.next();
            if (Integer.parseInt(rsc.getString("count")) > 0) {
                out.println("Already Added to Cart");
            } else {
                String insQry = "insert into tbl_shoppurchase(sph_id,bmedicine_id)values('" + rs.getString("id") + "','" + id + "')";
                System.out.println(insQry);
                if (con.executeCommand(insQry)) {
                    out.println("Added to Cart");
                } else {
                    out.println("Failed to Add Cart");
                }
            }
        }
    } else {
        String ins = "insert into tbl_shoppurchasehead(shop_id,sph_date)values('" + session.getAttribute("suserid") + "',curdate())";
         System.out.println(ins);
        if (con.executeCommand(ins)) {
            String sel = "select Max(sph_id) as id from tbl_shoppurchasehead";
             System.out.println(sel);
            ResultSet rs = con.selectCommand(sel);
            if (rs.next()) {
                String insQry = "insert into tbl_shoppurchase(sph_id,bmedicine_id)values('" + rs.getString("id") + "','" + id + "')";
                 System.out.println(insQry);
                if (con.executeCommand(insQry)) {
                    out.println("Added to Cart");
                } else {
                    out.println("Failed to Add Cart");
                }
            }
        }
    }


%>