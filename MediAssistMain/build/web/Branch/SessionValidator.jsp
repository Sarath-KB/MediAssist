<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("buserid") == null)
        {
            response.sendRedirect("../");
        }
    %>