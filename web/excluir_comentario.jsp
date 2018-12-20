<%@page import="Trabalho.Usuarios.Usuarios"%>
<%@page import="Trabalho.Postagens.Postagens"%>
<%@page import="Trabalho.Postagens.PostagensDAO"%>
<%

    int id = Integer.parseInt(request.getParameter("id"));
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");
    PostagensDAO dao = new PostagensDAO();
    
    Postagens post = dao.getById(id);
    if(post.getUsuarioId() == usuario.getId()){
        dao.excluir(id);
    }
    
    response.sendRedirect("postagens.jsp");

%>