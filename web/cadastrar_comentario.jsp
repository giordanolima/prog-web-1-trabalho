<%@page import="Trabalho.Postagens.PostagensDAO"%>
<%@page import="Trabalho.Postagens.Postagens"%>
<%@page import="Trabalho.Usuarios.Usuarios"%>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");
    String comentario = request.getParameter("comentario");

    Postagens post = new Postagens();
    post.setUsuarioId(usuario.getId());
    post.setComentario(comentario);
    
    PostagensDAO dao = new PostagensDAO();
    dao.inserir(post);
    
    response.sendRedirect("postagens.jsp");
    
%>