package org.apache.jsp.Assets.Ajaxpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Ajaxdata_005f1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');

    String mcid = request.getParameter("mcid");
    String did = request.getParameter("did");
    String pid = request.getParameter("pid");
  

    String sel = "select * from tbl_bmedicine bm inner join tbl_cmedicine cm on cm.cmedicine_id=bm.bmedicine_id inner join tbl_medicinecategory mct on mct.medicinecategory_id=cm.medicinecategory_id inner join tbl_branch bn on bn.branch_id=bm.branch_id inner join tbl_place pl on pl.place_id=bn.place_id inner join tbl_district ds on ds.district_id=pl.district_id where true";

    if (!mcid.equals("")) {
        sel += "and cm.medicinecategory_id='" + mcid + "'";
        System.out.println(sel);

    }
    if (!did.equals("")) {
        sel += "and pl.district_id='" + did + "'";
    System.out.println(sel);

    }
    if (!pid.equals("")) {
        sel += "and bn.place_id='" + pid + "'";
System.out.println(sel);
    }
 

   

     


      out.write("\n");
      out.write("  <table border=\"0\" cellpadding=\"50\" align=\"center\">\n");
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        ");

                            ResultSet rs = con.selectCommand(sel);
                            int Count=0;
                            while(rs.next())
                            {
                                Count++;
                        
      out.write("\n");
      out.write("                \n");
      out.write("<td>\n");
      out.write("                            <p style=\"text-align: center; border: 1px  solid #999;margin: 22px;padding: 10px;\">\n");
      out.write("                                <br>\n");
      out.write("                                <img src=\"../Assets/Cmedicinephoto/");
      out.print(rs.getString("cmedicine_image"));
      out.write("\" width=\"200\" height=\"200\">\n");
      out.write("                                <br>\n");
      out.write("                               ");
      out.print(rs.getString("cmedicine_name"));
      out.write("\n");
      out.write("                        <br>\n");
      out.write("                        ");
      out.print(rs.getString("cmedicine_description"));
      out.write("\n");
      out.write("                        <br>\n");
      out.write("                        ");
      out.print(rs.getString("cmedicine_expduration"));
      out.write("\n");
      out.write("                       \n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        ");
      out.print(rs.getString("cmedicine_rate"));
      out.write("\n");
      out.write("                       \n");
      out.write("                        <br>\n");
      out.write("                      \n");
      out.write("                               \n");
      out.write("                                ");

                                    String stock = "select sum(branchstock_qty) as  stock from tbl_branchstock where bmedicine_id = '" + rs.getString("bmedicine_id") + "'";
                                // out.println(stock);
                                    ResultSet rsST = con.selectCommand(stock);
                                    rsST.next();
                                    if (rsST.getString("stock") != null) {
                                        int stocks = Integer.parseInt(rsST.getString("stock"));
                                        if (stocks > 0) {
                                            //out.println(rs.getString("cableitem_id"));
                                
      out.write("\n");
      out.write("                                <a href=\"javascript:void(0)\" onclick=\"addCart('");
      out.print(rs.getString("bmedicine_id"));
      out.write("')\" class=\"btn btn-success btn-block\">Add to Cart</a>\n");
      out.write("                                ");

                                } else if (stocks == 0) {
                                
      out.write("\n");
      out.write("                                <a href=\"javascript:void(0)\" class=\"btn btn-danger btn-block\">Out of Stock</a>\n");
      out.write("                                ");

                                    }
                                } else {
                                
      out.write("\n");
      out.write("                                <a href=\"javascript:void(0)\" class=\"btn btn-warning btn-block\">Stock Not Found</a>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("\n");
      out.write("                            </p>                                                                  \n");
      out.write("                        </td>\n");
      out.write("\n");
      out.write("                        ");

                            if (Count == 4) {
                        
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        ");

                                Count=0;
                                }
                            }

                        
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
