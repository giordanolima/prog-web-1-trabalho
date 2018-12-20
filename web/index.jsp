<!DOCTYPE html>
<html lang="pt-br" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Programação Web 1</title>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 class="text-center">Programação Web 1 - Avaliação</h1>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <!-- FORMULÁRIO DE LOGIN -->
                    <div class="card">
                        <div class="card-header">
                            <h5>Login</h5>
                        </div>
                        <div class="card-body">
                            <form method="post" action="login.jsp">
                                <div class="form-group">
                                    <label>E-mail</label>
                                    <input type="text" name="email" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Senha</label>
                                    <input type="password" name="senha" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-lg btn-primary btn-block">Entrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <!-- FORMULÁRIO DE CADASTRO -->
                    <div class="card">
                        <div class="card-header">
                            <h5>Cadastre-se</h5>
                        </div>
                        <div class="card-body">
                            <form method="post" action="cadastrar_usuario.jsp">
                                <div class="form-group">
                                    <label>Nome</label>
                                    <input type="text" name="nome" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>E-mail</label>
                                    <input type="text" name="email"class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Senha</label>
                                    <input type="password" name="senha"class="form-control" />
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-lg btn-primary btn-block">Cadastrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
