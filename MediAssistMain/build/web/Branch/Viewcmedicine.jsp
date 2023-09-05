
<%-- 
    Document   : ViewItem
    Created on : 18 Feb, 2022, 2:27:22 PM
    Author     : HP
--%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Search Worker</title>
        <script src="../Assets/JQ/jQuery.js"></script>
       <script>
           
           
            function getMedicine()
            {
                    //alert(did);
                   
                    var cid=document.getElementById("medicinetype").value;
                    //alert(cid);
                    $.ajax({
                    url: "../Assets/Ajaxpages/AjaxData.jsp?cid="+cid,
                      success: function(html){
                            $("#search").html(html);
                            //alert(html);
                      }
                    });
            }
           
        </script>
       
    </head>
    <body>
         <%@include file="Header.jsp" %>
        <h1>Search Medicine</h1>
        <br>
        <a href="Homepage.jsp">Home</a>
        <br>
        <br>
        <form name="frmsearch" method="post">
           
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                   
                  
                   
                    <td>Work Type
                   
                        <select name="medicinetype" id="medicinetype" required="" onchange="getMedicine()">
                            <option value="" selected>--Select--</option>
                            <%
                             String s="select * from tbl_medicinecategory";
                             ResultSet rs1=con.selectCommand(s);
           
                                while(rs1.next())
                                {
                         
                            %>
                            <option value="<%=rs1.getString("medicinecategory_id")%>"><%=rs1.getString("medicinecategory_name") %></option>
                            <%
                             }
                            %>
                        </select>    
                    </td>
                </tr>
               
            </table>
        
        <title>view medicine</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .custom-alert-box{
                width: 20%;
                height: 10%;
                position: fixed;
                bottom: 0;
                right: 0;
                left: auto;
            }

            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
                display: none;
            }

            .failure {
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
                display: none;
            }

            .warning {
                color: #8a6d3b;
                background-color: #fcf8e3;
                border-color: #faebcc;
                display: none;
            }
        </style>
       
        <title>JSP Page</title>
    </head>
     <body>
         <div class="custom-alert-box">
            <div class="alert-box success">Successful Added to Cart !!!</div>
            <div class="alert-box failure">Failed to Add Cart !!!</div>
            <div class="alert-box warning">Already Added to Cart !!!</div>
        </div>
       <h3><center>MEDICINES</center></h3>
        <div id="search">
          <table border="0" cellpadding="50" align="center">

                    <tr>
                        <%
                            String sel = "select * from tbl_cmedicine c inner join tbl_branch b on c.company_id=b.company_id where b.branch_id='"+session.getAttribute("buserid")+"'";
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
                                    String stock = "select sum(companystock_qty) as  stock from tbl_companystock where cmedicine_id = '" + rs.getString("cmedicine_id") + "'";
                                    ResultSet rsST = con.selectCommand(stock);
                                    rsST.next();
                                    if (rsST.getString("stock") != null) {
                                        int stocks = Integer.parseInt(rsST.getString("stock"));
                                        if (stocks > 0) {
                                            //out.println(rs.getString("cableitem_id"));
                                %>
                                <a href="javascript:void(0)" onclick="addCart('<%=rs.getString("cmedicine_id")%>')" class="btn btn-success btn-block">Add to Cart</a>
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

            </div>
        </form>
    </body>
    <%@include file="Footer.jsp" %>
</html>
<script src="../Assets/Jq/jQuery.js"></script>
<script>
                                  
                                    function addCart(id)
                                    {
                                        //alert(id);
                                        $.ajax({
                                            url: "../Assets/Ajaxpages/Ajaxaddcart.jsp?id=" + id,
                                            success: function(response) {
                                                if (response.trim() === "Added to Cart")
                                                {
                                                    $("div.success").fadeIn(300).delay(1500).fadeOut(400);
                                                }
                                                else if (response.trim() === "Already Added to Cart")
                                                {
                                                    $("div.warning").fadeIn(300).delay(1500).fadeOut(400);
                                                }
                                                else
                                                {
                                                    $("div.failure").fadeIn(300).delay(1500).fadeOut(400);
                                                }
                                            }
                                        });
                                    }
</script>
