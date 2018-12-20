<%@page import="Trabalho.Usuarios.Usuarios"%>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }

%>