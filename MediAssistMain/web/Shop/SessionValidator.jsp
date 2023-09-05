<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("suserid") == null)
        {
            response.sendRedirect("../");
        }
 %>
    