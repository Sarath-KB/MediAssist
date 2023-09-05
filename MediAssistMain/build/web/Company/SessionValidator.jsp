<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("cuserid") == null)
        {
            response.sendRedirect("../");
        }
    %>