<%-- 
    Document   : Homepage
    Created on : 11 Jan, 2022, 12:05:01 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="Header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(assets/img/slide/slide-1.jpg)">
          <div class="container">
            <h2>Welcome to <span>Medi Assist</span></h2>
            <p>Medi Assist allows you to track your claim in real-time, anytime and from anywhere – just click the Claims tile to check your claim status. Additionally, Medi Assist sends SMS notifications throughout the lifecycle of your claim that keeps you updated on your claim status.</p>
            <a href="#about" class="btn-get-started scrollto">Read More</a>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(assets/img/slide/slide-2.jpg)">
          <div class="container">
            <h2>Lorem Ipsum Dolor</h2>
            <p>Medi Assist allows you to track your claim in real-time, anytime and from anywhere – just click the Claims tile to check your claim status. Additionally, Medi Assist sends SMS notifications throughout the lifecycle of your claim that keeps you updated on your claim status.</p>
            <a href="#about" class="btn-get-started scrollto">Read More</a>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(assets/img/slide/slide-3.jpg)">
          <div class="container">
            <h2></h2>
            <p>Medi Assist allows you to track your claim in real-time, anytime and from anywhere – just click the Claims tile to check your claim status. Additionally, Medi Assist sends SMS notifications throughout the lifecycle of your claim that keeps you updated on your claim status.</p>
            <a href="#about" class="btn-get-started scrollto">Read More</a>
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section>
   
    

</body>
<%@include file="Footer.jsp" %>
</html>