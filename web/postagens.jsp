<%@page import="java.util.ArrayList"%>
<%@page import="Trabalho.Postagens.Postagens"%>
<%@page import="Trabalho.Postagens.PostagensDAO"%>
<%@include file="check_login.jsp" %>
<%    PostagensDAO dao = new PostagensDAO();
    ArrayList<Postagens> lista = dao.buscar();

%>
<!DOCTYPE html>
<html lang="pt-br" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Programação Web 1</title>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark mb-3">
            <span class="navbar-brand mb-0 h1">Programação Web 1 - Avaliação</span>
            <ul class="navbar-nav float-right">
                <li class="nav-item active">
                    <a class="nav-link" href="editar_perfil.jsp"><%= usuario.getNome()%></a>
                </li>
            </ul>
        </nav>
        <div class="container">
            <!-- FORMULÁRIO DE CADASTRO DAS POSTAGENS -->
            <div class="card mb-3">
                <div class="card-header">
                    <h5>Postar Comentário</h5>
                </div>
                <div class="card-body">
                    <form action="cadastrar_comentario.jsp" method="post">
                        <div class="form-group">
                            <textarea name="comentario" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-sm btn-primary">Enviar comentário</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- ÍNICIO DAS POSTAGENS -->
            <% for (Postagens post : lista) {%>
            <div class="card mb-3">
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <p><%= post.getComentario()%></p>
                        <footer class="blockquote-footer"><%= post.getUsuario().getNome()%></cite></footer>
                    </blockquote>
                </div>
                <div class="card-footer text-right">
                    <% if(post.getUsuarioId() == usuario.getId()) { %>
                    <a href="excluir_comentario.jsp?id=<%= post.getId() %>" class="btn btn-sm btn-danger">Excluir</a>
                    <% } %>
                </div>
            </div>
            <% }%>
        </div>
    </body>
</html>
