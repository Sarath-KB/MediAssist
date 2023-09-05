package org.apache.jsp.Shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.websocket.Session;
import java.sql.ResultSet;

public final class Viewbmedicine_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Shop/Header.jsp");
  }

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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("         <title>view medicine</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- jQuery library -->\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Popper JS -->\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Latest compiled JavaScript -->\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            .custom-alert-box{\n");
      out.write("                width: 20%;\n");
      out.write("                height: 10%;\n");
      out.write("                position: fixed;\n");
      out.write("                bottom: 0;\n");
      out.write("                right: 0;\n");
      out.write("                left: auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .success {\n");
      out.write("                color: #3c763d;\n");
      out.write("                background-color: #dff0d8;\n");
      out.write("                border-color: #d6e9c6;\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .failure {\n");
      out.write("                color: #a94442;\n");
      out.write("                background-color: #f2dede;\n");
      out.write("                border-color: #ebccd1;\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .warning {\n");
      out.write("                color: #8a6d3b;\n");
      out.write("                background-color: #fcf8e3;\n");
      out.write("                border-color: #faebcc;\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    \n");
      out.write("    </head>\n");
      out.write("     <body>\n");
      out.write("      \n");
      out.write("         <script src=\"../Assets/Jq/jQuery.js\"></script>\n");
      out.write("       <script>\n");
      out.write("           \n");
      out.write("           \n");
      out.write("            function getMedicine()\n");
      out.write("                                    {\n");
      out.write("\n");
      out.write("                                        var mcid = document.getElementById(\"medicinetype\").value;\n");
      out.write("                                        var did = document.getElementById(\"district\").value;\n");
      out.write("                                        var pid = document.getElementById(\"place\").value;\n");
      out.write("                                        \n");
      out.write("                                        $.ajax({\n");
      out.write("                                            url: \"../Assets/Ajaxpages/Ajaxdata_1.jsp?mcid=\"+mcid+\"&did=\"+did+\"&pid=\"+pid,\n");
      out.write("                                            success: function(html) {\n");
      out.write("                                                $(\"#search\").html(html);\n");
      out.write("                                            }\n");
      out.write("                                        });\n");
      out.write("                                    }\n");
      out.write("            \n");
      out.write("             function getPlace(did)\n");
      out.write("            {\n");
      out.write("                    //alert(did);\n");
      out.write("                   \n");
      out.write("                   \n");
      out.write("                    //alert(cid);\n");
      out.write("                    $.ajax({\n");
      out.write("                    url: \"../Assets/Ajaxpages/Ajaxplace.jsp?did=\"+did,\n");
      out.write("                      success: function(html){\n");
      out.write("                            $(\"#place\").html(html);\n");
      out.write("                            //alert(html);                    });\n");
      out.write("\n");
      out.write("                      }\n");
      out.write("                    });\n");
      out.write("            }\n");
      out.write("           \n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("                    ");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n");
      out.write("\n");
      out.write("  <title>Medicio Bootstrap Template - Index</title>\n");
      out.write("  <meta content=\"\" name=\"description\">\n");
      out.write("  <meta content=\"\" name=\"keywords\">\n");
      out.write("\n");
      out.write("  <!-- Favicons -->\n");
      out.write("  <link href=\"assets/img/favicon.png\" rel=\"icon\">\n");
      out.write("  <link href=\"assets/img/apple-touch-icon.png\" rel=\"apple-touch-icon\">\n");
      out.write("\n");
      out.write("  <!-- Google Fonts -->\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- Vendor CSS Files -->\n");
      out.write("  <link href=\"assets/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/animate.css/animate.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/aos/aos.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/bootstrap-icons/bootstrap-icons.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/boxicons/css/boxicons.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/glightbox/css/glightbox.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/swiper/swiper-bundle.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- Template Main CSS File -->\n");
      out.write("  <link href=\"assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- =======================================================\n");
      out.write("  * Template Name: Medicio - v4.7.0\n");
      out.write("  * Template URL: https://bootstrapmade.com/medicio-free-bootstrap-theme/\n");
      out.write("  * Author: BootstrapMade.com\n");
      out.write("  * License: https://bootstrapmade.com/license/\n");
      out.write("  ======================================================== -->\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("  <!-- ======= Top Bar ======= -->\n");
      out.write("  <div id=\"topbar\" class=\"d-flex align-items-center fixed-top\">\n");
      out.write("    <div class=\"container d-flex align-items-center justify-content-center justify-content-md-between\">\n");
      out.write("      <div class=\"align-items-center d-none d-md-flex\">\n");
      out.write("        <i class=\"bi bi-clock\"></i> Monday - Saturday, 8AM to 10PM\n");
      out.write("      </div>\n");
      out.write("      <div class=\"d-flex align-items-center\">\n");
      out.write("        <i class=\"bi bi-phone\"></i> Call us now +1 5589 55488 55\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <!-- ======= Header ======= -->\n");
      out.write("  <header id=\"header\" class=\"fixed-top\">\n");
      out.write("    <div class=\"container d-flex align-items-center\">\n");
      out.write("\n");
      out.write("      <a href=\"index.html\" class=\"logo me-auto\"><img src=\"assets/img/logo/mediassist.jpg\" alt=\"\" width=\"200\" height=\"300\"></a>\n");
      out.write("      <!-- Uncomment below if you prefer to use an image logo -->\n");
      out.write("      <!-- <h1 class=\"logo me-auto\"><a href=\"index.html\">Medicio</a></h1> -->\n");
      out.write("\n");
      out.write("      <nav id=\"navbar\" class=\"navbar order-last order-lg-0\">\n");
      out.write("        <ul>\n");
      out.write("            \n");
      out.write("             \n");
      out.write("       \n");
      out.write("       \n");
      out.write("          <li><a class=\"nav-link scrollto\" href=\"Viewbmedicine.jsp\">Branch medicines</a></li>\n");
      out.write("          <li><a class=\"nav-link scrollto\" href=\"mycart.jsp\">My Cart</a></li>\n");
      out.write("          \n");
      out.write("          <li><a class=\"nav-link scrollto\" href=\"complaints.jsp\">Complaints</a></li>\n");
      out.write("     \n");
      out.write("          <li class=\"dropdown\"><a href=\"#\"><span>Settings</span> <i class=\"bi bi-chevron-down\"></i></a>\n");
      out.write("            <ul>\n");
      out.write("              <li><a href=\"MyProfile.jsp\">My Profile</a></li>\n");
      out.write("              \n");
      out.write("              <li><a href=\"EditProfile.jsp\">Edit Profile</a></li>\n");
      out.write("              <li><a href=\"ChangePassword.jsp\">Change Password</a></li>\n");
      out.write("             \n");
      out.write("            </ul>\n");
      out.write("          </li>\n");
      out.write("       \n");
      out.write("        </ul>\n");
      out.write("        <i class=\"bi bi-list mobile-nav-toggle\"></i>\n");
      out.write("      </nav><!-- .navbar -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("  </header><!-- End Header -->\n");
      out.write("\n");
      out.write(" \n");
      out.write("        <h1>Search Medicine</h1>\n");
      out.write("        <br>\n");
      out.write("        <a href=\"Homepage.jsp\">Home</a>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <form name=\"frmsearch\" method=\"post\">\n");
      out.write("           \n");
      out.write("            <table border=\"1\" align=\"center\" cellpadding=\"10\" style=\"border-collapse: collapse\">\n");
      out.write("                <tr>\n");
      out.write("                   \n");
      out.write("                  \n");
      out.write("                   \n");
      out.write("                    <td>Category\n");
      out.write("                   \n");
      out.write("                        <select name=\"medicinetype\" id=\"medicinetype\" required=\"\" onchange=\"getMedicine(this.value)\">\n");
      out.write("                            <option value=\"\" selected>--Select--</option>\n");
      out.write("                            ");

                             String s="select * from tbl_medicinecategory";
                             ResultSet rs1=con.selectCommand(s);
           
                                while(rs1.next())
                                {
                         
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rs1.getString("medicinecategory_id"));
      out.write('"');
      out.write('>');
      out.print(rs1.getString("medicinecategory_name") );
      out.write("</option>\n");
      out.write("                            ");

                             }
                            
      out.write("\n");
      out.write("                        </select>    \n");
      out.write("                    </td>\n");
      out.write("                    <td>District\n");
      out.write("                   \n");
      out.write("                        <select name=\"district\" id=\"district\" required=\"\" onchange=\"getPlace(this.value),getMedicine()\">\n");
      out.write("                            <option value=\"\" selected>--Select--</option>\n");
      out.write("                            ");

                             String s1="select * from tbl_district";
                             ResultSet rs2=con.selectCommand(s1);
           
                                while(rs2.next())
                                {
                         
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rs2.getString("district_id"));
      out.write('"');
      out.write('>');
      out.print(rs2.getString("district_name") );
      out.write("</option>\n");
      out.write("                            ");

                             }
                            
      out.write("\n");
      out.write("                        </select>    \n");
      out.write("                    </td>\n");
      out.write("                                <td>Place\n");
      out.write("                   \n");
      out.write("                        <select name=\"place\" id=\"place\" required=\"\" onchange=\"getMedicine(this.value)\">\n");
      out.write("                            <option value=\"\" >--Select--</option>\n");
      out.write("                            \n");
      out.write("                        </select>    \n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("               \n");
      out.write("            </table>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("         <div class=\"custom-alert-box\">\n");
      out.write("            <div class=\"alert-box success\">Successful Added to Cart !!!</div>\n");
      out.write("            <div class=\"alert-box failure\">Failed to Add Cart !!!</div>\n");
      out.write("            <div class=\"alert-box warning\">Already Added to Cart !!!</div>\n");
      out.write("        </div>\n");
      out.write("       <h3><center>MEDICINES</center></h3>\n");
      out.write("        <div id=\"search\">\n");
      out.write("          <table border=\"0\" cellpadding=\"50\" align=\"center\">\n");
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        ");

                            String sel = "select * from tbl_bmedicine b inner join tbl_cmedicine c on b.cmedicine_id=c.cmedicine_id" ;
                         System.out.println(sel);
                            ResultSet rs = con.selectCommand(sel);
                            int Count = 0;
                            while (rs.next()) {

                                Count++;

                        
      out.write("\n");
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
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("                                ");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n");
      out.write("\n");
      out.write("  <title>Medicio Bootstrap Template - Index</title>\n");
      out.write("  <meta content=\"\" name=\"description\">\n");
      out.write("  <meta content=\"\" name=\"keywords\">\n");
      out.write("\n");
      out.write("  <!-- Favicons -->\n");
      out.write("  <link href=\"assets/img/favicon.png\" rel=\"icon\">\n");
      out.write("  <link href=\"assets/img/apple-touch-icon.png\" rel=\"apple-touch-icon\">\n");
      out.write("\n");
      out.write("  <!-- Google Fonts -->\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- Vendor CSS Files -->\n");
      out.write("  <link href=\"assets/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/animate.css/animate.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/aos/aos.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/bootstrap-icons/bootstrap-icons.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/boxicons/css/boxicons.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/glightbox/css/glightbox.min.css\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"assets/vendor/swiper/swiper-bundle.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- Template Main CSS File -->\n");
      out.write("  <link href=\"assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  <!-- =======================================================\n");
      out.write("  * Template Name: Medicio - v4.7.0\n");
      out.write("  * Template URL: https://bootstrapmade.com/medicio-free-bootstrap-theme/\n");
      out.write("  * Author: BootstrapMade.com\n");
      out.write("  * License: https://bootstrapmade.com/license/\n");
      out.write("  ======================================================== -->\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("  <!-- ======= Top Bar ======= -->\n");
      out.write("  <div id=\"topbar\" class=\"d-flex align-items-center fixed-top\">\n");
      out.write("    <div class=\"container d-flex align-items-center justify-content-center justify-content-md-between\">\n");
      out.write("      <div class=\"align-items-center d-none d-md-flex\">\n");
      out.write("        <i class=\"bi bi-clock\"></i> Monday - Saturday, 8AM to 10PM\n");
      out.write("      </div>\n");
      out.write("      <div class=\"d-flex align-items-center\">\n");
      out.write("        <i class=\"bi bi-phone\"></i> Call us now +1 5589 55488 55\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <!-- ======= Header ======= -->\n");
      out.write("  <header id=\"header\" class=\"fixed-top\">\n");
      out.write("    <div class=\"container d-flex align-items-center\">\n");
      out.write("\n");
      out.write("      <a href=\"index.html\" class=\"logo me-auto\"><img src=\"assets/img/logo/mediassist.jpg\" alt=\"\" width=\"200\" height=\"300\"></a>\n");
      out.write("      <!-- Uncomment below if you prefer to use an image logo -->\n");
      out.write("      <!-- <h1 class=\"logo me-auto\"><a href=\"index.html\">Medicio</a></h1> -->\n");
      out.write("\n");
      out.write("      <nav id=\"navbar\" class=\"navbar order-last order-lg-0\">\n");
      out.write("        <ul>\n");
      out.write("            \n");
      out.write("             \n");
      out.write("       \n");
      out.write("       \n");
      out.write("          <li><a class=\"nav-link scrollto\" href=\"Viewbmedicine.jsp\">Branch medicines</a></li>\n");
      out.write("          <li><a class=\"nav-link scrollto\" href=\"mycart.jsp\">My Cart</a></li>\n");
      out.write("          \n");
      out.write("          <li><a class=\"nav-link scrollto\" href=\"complaints.jsp\">Complaints</a></li>\n");
      out.write("     \n");
      out.write("          <li class=\"dropdown\"><a href=\"#\"><span>Settings</span> <i class=\"bi bi-chevron-down\"></i></a>\n");
      out.write("            <ul>\n");
      out.write("              <li><a href=\"MyProfile.jsp\">My Profile</a></li>\n");
      out.write("              \n");
      out.write("              <li><a href=\"EditProfile.jsp\">Edit Profile</a></li>\n");
      out.write("              <li><a href=\"ChangePassword.jsp\">Change Password</a></li>\n");
      out.write("             \n");
      out.write("            </ul>\n");
      out.write("          </li>\n");
      out.write("       \n");
      out.write("        </ul>\n");
      out.write("        <i class=\"bi bi-list mobile-nav-toggle\"></i>\n");
      out.write("      </nav><!-- .navbar -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("  </header><!-- End Header -->\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("<script src=\"../Assets/Jq/jQuery.js\"></script>\n");
      out.write("<script>\n");
      out.write("                                  \n");
      out.write("                                    function addCart(id)\n");
      out.write("                                    {\n");
      out.write("                                        //alert(id);\n");
      out.write("                                        $.ajax({\n");
      out.write("                                            url: \"../Assets/Ajaxpages/Ajaxaddshopcart.jsp?id=\" + id,\n");
      out.write("                                            success: function(response) {\n");
      out.write("                                                if (response.trim() === \"Added to Cart\")\n");
      out.write("                                                {\n");
      out.write("                                                    $(\"div.success\").fadeIn(300).delay(1500).fadeOut(400);\n");
      out.write("                                                }\n");
      out.write("                                                else if (response.trim() === \"Already Added to Cart\")\n");
      out.write("                                                {\n");
      out.write("                                                    $(\"div.warning\").fadeIn(300).delay(1500).fadeOut(400);\n");
      out.write("                                                }\n");
      out.write("                                                else\n");
      out.write("                                                {\n");
      out.write("                                                    $(\"div.failure\").fadeIn(300).delay(1500).fadeOut(400);\n");
      out.write("                                                }\n");
      out.write("                                            }\n");
      out.write("                                        });\n");
      out.write("                                    }\n");
      out.write("</script>");
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
