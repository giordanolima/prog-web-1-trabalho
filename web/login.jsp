<%@page import="Trabalho.Usuarios.Usuarios"%>
<%@page import="Trabalho.Usuarios.UsuariosDAO"%>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    UsuariosDAO dao = new UsuariosDAO();
    Usuarios user = dao.login(email, senha);
  
    if(user != null) {
        session.setAttribute("usuario", user);
        response.sendRedirect("postagens.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }

%>