<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"
            />
        <style>

            .product-image {
                float: left;
                width: 20%;
            }

            .product-details {
                float: left;
                width: 37%;
            }

            .product-price {
                float: left;
                width: 12%;
            }

            .product-quantity {
                float: left;
                width: 10%;
            }

            .product-removal {
                float: left;
                width: 9%;
            }

            .product-line-price {
                float: left;
                width: 12%;
                text-align: right;
            }

            /* This is used as the traditional .clearfix class */
            .group:before,
            .shopping-cart:before,
            .column-labels:before,
            .product:before,
            .totals-item:before,
            .group:after,
            .shopping-cart:after,
            .column-labels:after,
            .product:after,
            .totals-item:after {
                content: "";
                display: table;
            }

            .group:after,
            .shopping-cart:after,
            .column-labels:after,
            .product:after,
            .totals-item:after {
                clear: both;
            }

            .group,
            .shopping-cart,
            .column-labels,
            .product,
            .totals-item {
                zoom: 1;
            }

            /* Apply clearfix in a few places */
            /* Apply dollar signs */
            .product .product-price:before,
            .product .product-line-price:before,
            .totals-value:before {
                content: "₹";
            }

            /* Body/Header stuff */
            body {
                padding: 0px 30px 30px 20px;
                font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
                    "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-weight: 100;
            }

            h1 {
                font-weight: 100;
            }

            label {
                color: #aaa;
            }

            .shopping-cart {
                margin-top: -45px;
            }

            /* Column headers */
            .column-labels label {
                padding-bottom: 15px;
                margin-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            .column-labels .product-image,
            .column-labels .product-details,
            .column-labels .product-removal {
                text-indent: -9999px;
            }

            /* Product entries */
            .product {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }
            .product .product-image {
                text-align: center;
            }
            .product .product-image img {
                width: 100px;
            }
            .product .product-details .product-title {
                margin-right: 20px;
                font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
            }
            .product .product-details .product-description {
                margin: 5px 20px 5px 0;
                line-height: 1.4em;
            }
            .product .product-quantity input {
                width: 40px;
            }
            .product .remove-product {
                border: 0;
                padding: 4px 8px;
                background-color: #c66;
                color: #fff;
                font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
                font-size: 12px;
                border-radius: 3px;
            }
            .product .remove-product:hover {
                background-color: #a44;
            }

            /* Totals section */
            .totals .totals-item {
                float: right;
                clear: both;
                width: 100%;
                margin-bottom: 10px;
            }
            .totals .totals-item label {
                float: left;
                clear: both;
                width: 79%;
                text-align: right;
            }
            .totals .totals-item .totals-value {
                float: right;
                width: 21%;
                text-align: right;
            }
            .totals .totals-item-total {
                font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
            }

            .checkout {
                float: right;
                border: 0;
                margin-top: 20px;
                padding: 6px 25px;
                background-color: #6b6;
                color: #fff;
                font-size: 25px;
                border-radius: 3px;
            }

            .checkout:hover {
                background-color: #494;
            }

            /* Make adjustments for tablet */
            @media screen and (max-width: 650px) {
                .shopping-cart {
                    margin: 0;
                    padding-top: 20px;
                    border-top: 1px solid #eee;
                }

                .column-labels {
                    display: none;
                }

                .product-image {
                    float: right;
                    width: auto;
                }
                .product-image img {
                    margin: 0 0 10px 10px;
                }

                .product-details {
                    float: none;
                    margin-bottom: 10px;
                    width: auto;
                }

                .product-price {
                    clear: both;
                    width: 70px;
                }

                .product-quantity {
                    width: 100px;
                }
                .product-quantity input {
                    margin-left: 20px;
                }

                .product-quantity:before {
                    content: "x";
                }

                .product-removal {
                    width: auto;
                }

                .product-line-price {
                    float: right;
                    width: 70px;
                }
            }
            /* Make more adjustments for phone */
            @media screen and (max-width: 350px) {
                .product-removal {
                    float: right;
                }

                .product-line-price {
                    float: right;
                    clear: left;
                    width: auto;
                    margin-top: 10px;
                }

                .product .product-line-price:before {
                    content: "Item Total: ₹";
                }

                .totals .totals-item label {
                    width: 60%;
                }
                .totals .totals-item .totals-value {
                    width: 40%;
                }
            }


            label{
                margin: 0px 15px;
            }



            /*SWITCH 2 ------------------------------------------------*/
            .switch2{
                position: relative;
                display: inline-block;
                width: 60px;
                height: 32px;
                border-radius: 27px;
                background-color: #bdc3c7;
                cursor: pointer;
                transition: all .3s;
            }
            .switch2 input{
                display: none;
            }
            .switch2 input:checked + div{
                left: calc(100% - 40px);
            }
            .switch2 div{
                position: absolute;
                width: 40px;
                height: 40px;
                border-radius: 25px;
                background-color: white;
                top: -4px;
                left: 0px;
                box-shadow: 0px 0px 0.5px 0.5px rgb(170,170,170);
                transition: all .2s;
            }

            .switch2-checked{
                background-color: #2ecc71;
            }


        </style>
    <%
        String ch = "";
        String flag = "";
        if (request.getParameter("btn_checkout") != null) {

            if (request.getParameter("cb_checkout") != null) {
                flag = "true";
            } else {
                flag = "false";

            }

            String amt = request.getParameter("carttotalamt");

            String selC = "select * from tbl_shoppurchase sp inner join tbl_shoppurchasehead sph on sph.sph_id=sp.sph_id inner join tbl_bmedicine bm on bm.bmedicine_id=sp.bmedicine_id inner join tbl_branch bc on bc.branch_id=bm.branch_id where bc.branch_id='"+session.getAttribute("buserid")+"' and sph.sph_status='0'";
            ResultSet rsC = con.selectCommand(selC);
            if (rsC.next()) {
                String updQry = "update tbl_shoppurchasehead set sph_status ='1',sph_totalamt='"+amt+"' where sph_id='" + rsC.getString("sph_id") + "'";
                con.executeCommand(updQry);

            }

            session.setAttribute("bid", rsC.getString("sph_id"));

            if (flag.equals("true")) {

                response.sendRedirect("Payment.jsp");

            } else {
    %>
    <script type="text/javascript">
        alert("Booking cancelled");
        setTimeout(function() {
            window.location.href = 'HomePage.jsp'
        }, 100);
    </script>
    <%
            }
        }


    %>
    <body onload="recalculateCart()">
         
         <br>
         <br>
         <br>
         <br>
         <br>
         <br>
        <%
        String id="";
        if(request.getParameter("btnreq")!=null)
        {
            out.println(request.getParameter("btnreq"));
                String up2="update tbl_shoppurchasehead set sph_requeststatus='2' where sph_id='"+request.getParameter("btnreq")+"'";
                out.println(up2);
                con.executeCommand(up2);
        }
        %>
        <h1 align="center">Booking Detials</h1>
        <%
         String sel1 = "select * from tbl_shoppurchasehead where shop_id='"+request.getParameter("rid")+"'";
                ResultSet rs1 = con.selectCommand(sel1);
                if (rs1.next()) {%>
        <form method="post">
            
            <div class="column-labels">
                <label class="product-image">Image</label>
                <label class="product-details">Product</label>
                <label class="product-price">Price</label>
                <label class="product-quantity">Quantity</label>
                <label class="product-removal">Remove</label>
                <label class="product-line-price">Total</label>
            </div>
             
            <%      
       
        String sel = "select * from tbl_shoppurchase sp inner join tbl_shoppurchasehead sph on sph.sph_id=sp.sph_id inner join tbl_bmedicine bm on bm.bmedicine_id=sp.bmedicine_id inner join tbl_cmedicine cmd on cmd.cmedicine_id=bm.cmedicine_id inner join tbl_branch bc on bc.branch_id=bm.branch_id where bc.branch_id='"+session.getAttribute("buserid")+"' and sph.sph_status='0'";
        System.out.println(sel);       
        ResultSet rs = con.selectCommand(sel);
                while (rs.next()) {
                    id=rs.getString("sph_id");
//                    out.println(id);
                    String selprd = "select * from tbl_shoppurchase where bmedicine_id='" + rs.getString("bmedicine_id") + "'";
                    ResultSet rsprd = con.selectCommand(selprd);
                    if (rsprd.next()) {
                        String selprdStock = "select sum(branchstock_qty) as stock from tbl_branchstock where bmedicine_id='" + rsprd.getString("bmedicine_id") + "'";
                        ResultSet rsprdStock = con.selectCommand(selprdStock);
                        if (rsprdStock.next()) {
            %>

            <div class="product">
                <div class="product-image">
                    <img
                        src="../Assets/Cmedicinephoto/<%=rs.getString("cmedicine_image")%>"
                        />
                </div>
                <div class="product-details">
                    <div class="product-title"><%=rs.getString("cmedicine_name")%></div>

                </div>
                <div class="product-price"><%=rs.getString("bmedicine_rate")%></div>
                <div class="product-quantity">
                    <input alt="<%=rs.getString("sp_id")%>" type="number" value="<%=rs.getString("sp_qty")%>" min="1" max="<%=rsprdStock.getString("stock")%>"/>
                </div>
                <div class="product-removal">
                    <button class="remove-product" value="<%=rs.getString("sp_id")%>">Remove</button>
                </div>
                <div class="product-line-price">
                    <%
                        float pr = Float.parseFloat(rs.getString("bmedicine_rate"));
                        float qty = Float.parseFloat(rs.getString("sp_qty"));
                        float tot = pr * qty;
                        out.println(String.format("%.2f", tot));
                    %>
                </div>
            </div>
                
            <%
                        }
                    }
                }
                }
            %>
            
            <div class="totals">
                <div class="totals-item totals-item-total">
                    <label>Grand Total</label>
                    <div class="totals-value" id="cart-total">0</div>
                    <input type="hidden" id="cart-totalamt" name="carttotalamt" value=""/>
                   
                     <a class="checkout" href="viewshoprequest.jsp?btnreq=<%=id%>">Accept</a>
                </div>
            </div>   </form>
        <!-- partial -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script>
        /* Set rates + misc */
        var fadeTime = 300;

        /* Assign actions */
        $(".product-quantity input").change(function() {
            $.ajax({
                url: "../Assets/Ajaxpages/shopcartajax.jsp?action=Update&id=" + this.alt + "&qty=" + this.value
            });
            updateQuantity(this);

        });

        $(".product-removal button").click(function() {

            $.ajax({
                url: "../Assets/Ajaxpages/shopcartajax.jsp?action=Delete&id=" + this.value
            });
            removeItem(this);
        });

        /* Recalculate cart */
        function recalculateCart() {
            var subtotal = 0;

            /* Sum up row totals */
            $(".product").each(function() {
                subtotal += parseFloat(
                        $(this).children(".product-line-price").text()
                        );
            });

            /* Calculate totals */
            var total = subtotal;

            /* Update totals display */
            $(".totals-value").fadeOut(fadeTime, function() {
                $("#cart-total").html(total.toFixed(2));
                document.getElementById("cart-totalamt").value = total.toFixed(2);
                if (total == 0) {
                    $(".checkout").fadeOut(fadeTime);
                } else {
                    $(".checkout").fadeIn(fadeTime);
                }
                $(".totals-value").fadeIn(fadeTime);
            });
        }

        /* Update quantity */
        function updateQuantity(quantityInput) {
            /* Calculate line price */
            var productRow = $(quantityInput).parent().parent();
            var price = parseFloat(productRow.children(".product-price").text());
            var quantity = $(quantityInput).val();
            var linePrice = price * quantity;
            /* Update line price display and recalc cart totals */
            productRow.children(".product-line-price").each(function() {
                $(this).fadeOut(fadeTime, function() {
                    $(this).text(linePrice.toFixed(2));
                    recalculateCart();
                    $(this).fadeIn(fadeTime);
                });
            });
        }

        /* Remove item from cart */
        function removeItem(removeButton) {
            /* Remove row from DOM and recalc cart total */
            var productRow = $(removeButton).parent().parent();
            productRow.slideUp(fadeTime, function() {
                productRow.remove();
                recalculateCart();
            });

        }

        $('.switch2 input').on('change', function() {
            var dad = $(this).parent();
            if ($(this).is(':checked'))
                dad.addClass('switch2-checked');
            else
                dad.removeClass('switch2-checked');
        });
        </script>
    </body>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
</html>
