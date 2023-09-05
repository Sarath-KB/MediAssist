<%--
    Document   : Payment
    Created on : 4 Dec, 2021, 12:26:47 PM
    Author     : ajula
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en" >
        <head>
            <meta charset="UTF-8">
            <title>Payment Gateway</title>
            <link rel="stylesheet" href="./style.css">
            <style>
                @import url('https://fonts.googleapis.com/css?family=Baloo+Bhaijaan|Ubuntu');

                *{
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Ubuntu', sans-serif;
                }

                body{
                    background: #2196F3;
                    margin: 0 10px;
                }

                .payment{
                    background: #f8f8f8;
                    max-width: 360px;
                    margin: 80px auto;
                    height: auto;
                    padding: 35px;
                    padding-top: 70px;
                    border-radius: 5px;
                    position: relative;
                }

                .payment h2{
                    text-align: center;
                    letter-spacing: 2px;
                    margin-bottom: 40px;
                    color: #0d3c61;
                }

                .form .label{
                    display: block;
                    color: #555555;
                    margin-bottom: 6px;
                }

                .input{
                    padding: 13px 0px 13px 25px;
                    width: 100%;
                    text-align: center;
                    border: 2px solid #dddddd;
                    border-radius: 5px;
                    letter-spacing: 1px;
                    word-spacing: 3px;
                    outline: none;
                    font-size: 16px;
                    color: #555555;
                }

                .card-grp{
                    display: flex;
                    justify-content: space-between;
                }

                .card-item{
                    width: 48%;
                }

                .space{
                    margin-bottom: 20px;
                }

                .icon-relative{
                    position: relative;
                }

                .icon-relative .fas,
                .icon-relative .far{
                    position: absolute;
                    bottom: 12px;
                    left: 15px;
                    font-size: 20px;
                    color: #555555;
                }

                .btn{
                    margin-top: 40px;
                    background: #2196F3;
                    padding: 12px;
                    text-align: center;
                    color: #f8f8f8;
                    border-radius: 5px;
                    cursor: pointer;
                }


                .payment-logo{
                    position: absolute;
                    top: -50px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 100px;
                    height: 100px;
                    background: #f8f8f8;
                    border-radius: 50%;
                    box-shadow: 0 0 5px rgba(0,0,0,0.2);
                    text-align: center;
                    line-height: 85px;
                }

                .payment-logo:before{
                    content: "";
                    position: absolute;
                    top: 5px;
                    left: 5px;
                    width: 90px;
                    height: 90px;
                    background: #2196F3;
                    border-radius: 50%;
                }

                .payment-logo p{
                    position: relative;
                    color: #f8f8f8;
                    font-family: 'Baloo Bhaijaan', cursive;
                    font-size: 58px;
                }

                input[type=submit] {
                    background-color: #2196F3;
                    border: none;
                    color: #f8f8f8;
                    font-size: 16px;
                }

                @media screen and (max-width: 420px){
                    .card-grp{
                        flex-direction: column;
                    }
                    .card-item{
                        width: 100%;
                        margin-bottom: 20px;
                    }
                    .btn{
                        margin-top: 20px;
                    }
                }
            </style>

        </head>
    <%
        if (request.getParameter("btnpay") != null) {
                String up = "update tbl_shoppurchasehead set sph_paymentstatus=1 where sph_id='" + session.getAttribute("bid") + "'";
                if (con.executeCommand(up)) {
                    System.out.println(up);
                    String sel = "select * from tbl_shoppurchase where  sph_id='" + session.getAttribute("bid") + "'";
                    ResultSet rs = con.selectCommand(sel);
                    while (rs.next()) {
                        System.out.println(sel);
                        String sels = "select smedicine_id as id from tbl_smedicine where bmedicine_id='" + rs.getString("bmedicine_id") + "' and shop_id='" + session.getAttribute("suserid") + "'";
                        System.out.println(sels);
                        ResultSet rss = con.selectCommand(sels);
                        if (rss.next()) {
                            String selss = "select shopstock_qty as id from tbl_shopstock where smedicine_id='" + rss.getString("id") + "'";
                            ResultSet ss = con.selectCommand(selss);
                            if (ss.next()) {
                                System.out.println(selss);
                                int stock = Integer.parseInt(ss.getString("id"));
                                int cur = Integer.parseInt(rs.getString("bp_qty"));
                                stock = stock + cur;
                                System.out.println(stock);
                                String upd = "update tbl_shopstock set shopstock_qty='" + stock + "' where smedicine_id='" + rss.getString("id") + "'";
                                if (con.executeCommand(upd)) {
                                    System.out.println(upd);
                                    String seld = "select branchstock_qty as id from tbl_branchstock where bmedicine_id='" + rs.getString("bmedicine_id") + "'";
                                    ResultSet rsdd = con.selectCommand(seld);
                                    if (rsdd.next()) {
                                        System.out.println(seld);
                                        int sr = Integer.parseInt(rsdd.getString("id"));
                                        int c = Integer.parseInt(rs.getString("sp_qty"));
                                        sr = sr - c;
                                        System.out.println(sr);
                                        String upds = "update tbl_branchstock set branchstock_qty='" + sr + "' where  bmedicine_id='" + rs.getString("bmedicine_id") + "'";
                                        if (con.executeCommand(upds)) {
                                            System.out.println(upds);
                                            response.sendRedirect("Homepage.jsp");
                                        }
                                    }

                                }
                            }
                        } else {
                            String ins = "insert into tbl_smedicine(bmedicine_id,branch_id)values('" + rs.getString("bmedicine_id") + "','" + session.getAttribute("buserid") + "')";
                            if (con.executeCommand(ins)) {
                                System.out.println(ins);
                                String selins = "select max(smedicine_id) as id from tbl_smedicine where bmedicine_id='" + rs.getString("bmedicine_id") + "' and branch_id='" + session.getAttribute("buserid") + "'";
                                ResultSet rsins = con.selectCommand(selins);
                                System.out.println(selins);
                                rsins.next();
                                String insstock = "insert into tbl_shopstock(smedicine_id,shopstock_qty)values('" + rsins.getString("id") + "','" + rs.getString("bp_qty") + "')";
                                if (con.executeCommand(insstock)) {

                                    String seld = "select branchstock_qty as id from tbl_branchstock where bmedicine_id='" + rs.getString("bmedicine_id") + "'";
                                    ResultSet rsdd = con.selectCommand(seld);
                                    if (rsdd.next()) {
                                        System.out.println(seld);
                                        int sr = Integer.parseInt(rsdd.getString("id"));
                                        int c = Integer.parseInt(rs.getString("bp_qty"));
                                        sr = sr - c;
                                        System.out.println(sr);
                                        String upds = "update tbl_branchstock set branchstock_qty='" + sr + "' where  bmedicine_id='" + rs.getString("bmedicine_id") + "'";
                                        if (con.executeCommand(upds)) {
                                            System.out.println(upds);
                                            response.sendRedirect("Homepage.jsp");
                                        }
                                    }

                                }
                            }
                        }
                    }
                }

            }

    %>
    <body>
        <!-- partial:index.partial.html -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">

        <div class="wrapper">
            <div class="payment">
                <div class="payment-logo">
                    <p>p</p>
                </div>
                <h2>Payment Gateway</h2>
                <div class="form">
                    <form method="post">
                        <div class="card space icon-relative">
                            <label class="label">Card holder:</label>
                            <input type="text" class="input" placeholder="Card Holder">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="card space icon-relative">
                            <label class="label">Card number:</label>
                            <input type="text" class="input" data-mask="0000 0000 0000 0000" placeholder="Card Number">
                            <i class="far fa-credit-card"></i>
                        </div>
                        <div class="card-grp space">
                            <div class="card-item icon-relative">
                                <label class="label">Expiry date:</label>
                                <input type="text" name="expiry-data" class="input" data-mask="00 / 00" placeholder="00 / 00">
                                <i class="far fa-calendar-alt"></i>
                            </div>
                            <div class="card-item icon-relative">
                                <label class="label">CVV:</label>
                                <input type="text" class="input" data-mask="000" placeholder="000">
                                <i class="fas fa-lock"></i>
                            </div>
                        </div>
                        <div class="btn">
                            <input type="submit" name="btnpay" id="btnpay" value="Pay">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- partial -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js'></script><script  src="./script.js"></script>

    </body>
</html>
