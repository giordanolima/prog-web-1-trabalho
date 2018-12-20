<%@page import="Trabalho.Usuarios.UsuariosDAO"%>
<%@page import="Trabalho.Usuarios.Usuarios"%>
<%
    
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    Usuarios usuario = new Usuarios();
    usuario.setNome(nome);
    usuario.setEmail(email);
    usuario.setSenha(senha);
    
    UsuariosDAO dao = new UsuariosDAO();
    dao.inserir(usuario);
    
    response.sendRedirect("index.jsp");

%>