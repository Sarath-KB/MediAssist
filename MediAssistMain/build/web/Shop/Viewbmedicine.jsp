
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
    
    </head>
     <body>
      
         <script src="../Assets/Jq/jQuery.js"></script>
       <script>
           
           
            function getMedicine()
                                    {

                                        var mcid = document.getElementById("medicinetype").value;
                                        var did = document.getElementById("district").value;
                                        var pid = document.getElementById("place").value;
                                        
                                        $.ajax({
                                            url: "../Assets/Ajaxpages/Ajaxdata_1.jsp?mcid="+mcid+"&did="+did+"&pid="+pid,
                                            success: function(html) {
                                                $("#search").html(html);
                                            }
                                        });
                                    }
            
             function getPlace(did)
            {
                    //alert(did);
                   
                   
                    //alert(cid);
                    $.ajax({
                    url: "../Assets/Ajaxpages/Ajaxplace.jsp?did="+did,
                      success: function(html){
                            $("#place").html(html);
                            //alert(html);                    });

                      }
                    });
            }
           
        </script>

                    <%@include file="Header.jsp" %>
 
        <h1>Search Medicine</h1>
        <br>
        <a href="Homepage.jsp">Home</a>
        <br>
        <br>
        <form name="frmsearch" method="post">
           
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">
                <tr>
                   
                  
                   
                    <td>Category
                   
                        <select name="medicinetype" id="medicinetype" required="" onchange="getMedicine(this.value)">
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
                    <td>District
                   
                        <select name="district" id="district" required="" onchange="getPlace(this.value),getMedicine()">
                            <option value="" selected>--Select--</option>
                            <%
                             String s1="select * from tbl_district";
                             ResultSet rs2=con.selectCommand(s1);
           
                                while(rs2.next())
                                {
                         
                            %>
                            <option value="<%=rs2.getString("district_id")%>"><%=rs2.getString("district_name") %></option>
                            <%
                             }
                            %>
                        </select>    
                    </td>
                                <td>Place
                   
                        <select name="place" id="place" required="" onchange="getMedicine(this.value)">
                            <option value="" >--Select--</option>
                            
                        </select>    
                    </td>
                </tr>
               
            </table>
        
       
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
                            String sel = "select * from tbl_bmedicine b inner join tbl_cmedicine c on b.cmedicine_id=c.cmedicine_id" ;
                         System.out.println(sel);
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

            </div>
        </form>
                                <%@include file="Header.jsp" %>
    </body>
</html>
<script src="../Assets/Jq/jQuery.js"></script>
<script>
                                  
                                    function addCart(id)
                                    {
                                        //alert(id);
                                        $.ajax({
                                            url: "../Assets/Ajaxpages/Ajaxaddshopcart.jsp?id=" + id,
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