
<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String mcid = request.getParameter("mcid");
    String did = request.getParameter("did");
    String pid = request.getParameter("pid");
  

    String sel = "select * from tbl_bmedicine bm inner join tbl_cmedicine cm on cm.cmedicine_id=bm.bmedicine_id inner join tbl_medicinecategory mct on mct.medicinecategory_id=cm.medicinecategory_id inner join tbl_branch bn on bn.branch_id=bm.branch_id inner join tbl_place pl on pl.place_id=bn.place_id inner join tbl_district ds on ds.district_id=pl.district_id where true ";
 System.out.println(sel);
    if (!mcid.equals("")) {
        sel += " and cm.medicinecategory_id='" + mcid + "'";
        System.out.println(sel);

    }
    if (!did.equals("")) {
        sel += " and pl.district_id='" + did + "'";
    System.out.println(sel);

    }
    if (!pid.equals("")) {
        sel += " and bn.place_id='" + pid + "'";
System.out.println(sel);
    }
 

   

     

%>
  <table border="0" cellpadding="50" align="center">

                    <tr>
                        <%
                            ResultSet rs = con.selectCommand(sel);
                            int Count=0;
                            while(rs.next())
                            {
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
                                // out.println(stock);
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


