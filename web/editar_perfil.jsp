<%@include file="check_login.jsp" %>
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
        <!-- FORMULÁRIO DE CADASTRO -->
        <div class="card">
          <div class="card-header">
            <h5>Editar dados do usuário</h5>
          </div>
          <div class="card-body">
              <form method="post" action="editar_usuario.jsp">
                <div class="form-group">
                    <label>Nome</label>
                    <input type="text" name="nome" class="form-control" value="<%= usuario.getNome() %>" />
                </div>
                <div class="form-group">
                    <label>E-mail</label>
                    <input type="text" name="email"class="form-control" value="<%= usuario.getEmail() %>" />
                </div>
                <div class="form-group">
                    <label>Senha</label>
                    <input type="password" name="senha"class="form-control" value="<%= usuario.getSenha() %>" />
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-lg btn-primary btn-block">Cadastrar</button>
                </div>
            </form>
          </div>
        </div>
      </div>
  </body>
</html>
