*=> header
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{title}</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
    <!-- bootstrap 3.0.2 -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- fullCalendar -->
    <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
    <!-- Daterange picker -->
    <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- iCheck for checkboxes and radio inputs -->
    <link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Theme style -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery.min.js" ></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript" src="js/scripts.js" ></script>
    <script type="text/javascript" src="js/jquery.validate.js" ></script>
</head>
<body>
<div class="fixed-header-default">
    <img src="img/logovota.png" height="50px">
    <h2>Justiça Eleitoral - Eleições 2015</h2>

</div>
<div class="container conteudo">


*=> menu_principal
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-pills">
                <li class="active">
                    <a href="#">Home</a>
                </li>
                <li class="">
                    <a href="#">Partidos</a>
                </li>
                <li class="">
                    <a href="#">Candidatos</a>
                </li>
                <li class="">
                    <a href="#">Eleitores</a>
                </li>
                <li class="disabled">
                    <a href="#">Eleições</a>
                </li>



            </ul>
        </div>
    </div>
    <br>

*=> conteudo_index
    <center><font size="25" color="DF0000">Bem vindo a home da super inovadora urna eletronica web.</font></center>

*=> form_login

    <form name="frmLogin" method="post" action="login.php" onsubmit="return validarFormulario(this);">
        <div class="row clearfix" >
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <section class="panel">
                    <header class="panel-heading">
                        Efetue o Login
                    </header>
                    <div class="panel-body">
                        <!-- alerta de sucesso ao cadastrar usuario -->
                        <div class="alert alert-success cadastro-sucesso-alert {cadastro_sucesso}">
                            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Parabéns!</strong> Seu cadastro foi realizado com sucesso.
                        </div>
                        <div class="alert alert-block alert-danger form-errors-alert {login_error}">
                            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Ops!</strong> Parece que as credenciais digitadas estão incorretas, por favor verifique!
                        </div>
                        <form class="form-horizontal" role="form">
                            <input type="hidden" name="frmPassou" value="OK">
                            <div class="form-group">
                                <label for="login" class="col-lg-2 col-sm-2 control-label">Login</label>
                                <div class="col-lg-10">
                                    <input name="login" type="login" class="form-control" id="inputEmail1" placeholder="Nome de Usuário">
                                    <br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Senha</label>
                                <div class="col-lg-10">
                                    <input name="senha" type="password" class="form-control" id="inputPassword1" placeholder="Senha">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <br>
                                    <button type="submit" class="btn btn-success">Entrar</button>&nbsp;&nbsp;
                                    <a href="registro.php"><div class="btn btn-info">Registrar-me</div></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </form>

*=> form_registro

    <div class="row clearfix" >
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <section class="panel">
                <header class="panel-heading">
                    Formulário de Registro
                </header>
                <div class="alert alert-block alert-danger form-errors-alert">
                    <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong>Ops!</strong> Os campos em vermelho são obrigatórios ou possuem erros!
                </div>
                <div class="alert alert-block alert-danger cpf-indisp-alert">
                    <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong>Ops!</strong> Parece que este CPF já está cadastrado, por favor verifique!
                </div>
                <div class="alert alert-block alert-danger login-indisp-alert">
                    <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                        <i class="fa fa-times"></i>
                    </button>
                    <strong>Ops!</strong> Parece que este nome de login está indisponível, por favor escolha outro nome!
                </div>
                <div class="panel-body">
                    <form id="cadg" action="registro.php" method="POST" class="form-horizontal" novalidate onsubmit="return(validarFormulario(this) && verificaDisponibilidadeLogin(this));">
                        <!-- Text input-->
                        <input type="hidden" name="frmPassou" value="OK">
                        <input type="hidden" name="loginDisponivel" id="loginDisponivel" value="true">
                        <div class="row m-b-10">
                            <div class="col-md-4">
                                <label class="control-label" for="textinput">CPF</label>
                                <div class="controls m-t-10 m-b-10">
                                    <input id="cpf" name="cpf" type="text" maxlength="14" onKeyPress ="mascaraCPF(cadg.cpf);" formato="cpf" required placeholder="CPF" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label" for="nome">Nome</label>
                                <div class="controls m-t-10 m-b-10">
                                    <input id="nome" name="nome" type="text" required placeholder="Nome" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label" for="Rg">RG</label>
                                <div class="controls m-t-10 m-b-10">
                                    <input id="rg" name="rg" type="text" placeholder="RG" required class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row m-b-10">
                            <div class="col-md-4">
                                <label class="control-label" for="titulo">Título</label>
                                <div class="controls  m-t-10 m-b-10">
                                    <input id="titulo" name="titulo" type="text" placeholder="Título" required maxlength="15" class="form-control">

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label" for="login">Login</label>
                                <div class="controls  m-t-10 m-b-10">
                                    <input id="login" name="login" type="text" placeholder="Login" required class="form-control">
                                    <p class="help-block">Para acesso a urna</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="control-label" for="password">Senha</label>
                                <div class="controls m-t-10 m-b-10">
                                    <input id="senha" name="senha" type="password" placeholder="Senha" class="form-control" required>
                                    <p class="help-block">Para acesso a urna</p>
                                </div>
                            </div>
                        </div>
                        <div class="row m-b-10">
                            <div class="col-md-4">
                                <label class="control-label" for="cep">CEP</label>
                                <div class="controls  m-t-10 m-b-10">
                                    <input id="cep" name="cep" type="text" placeholder="CEP" required maxlength="10" onkeypress="mascaraCep(this);" onkeyup="buscaEndereco(this);" class="form-control">

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="control-label" for="logradouro">Logradouro</label>
                                <div class="controls  m-t-10 m-b-10">
                                    <input id="logradouro" name="logradouro" type="text" placeholder="Logradouro" required class="form-control">

                                </div>
                            </div>
                            <div class="col-md-2">
                                <label class="control-label" for="numero">Número</label>
                                <div class="controls m-t-10 m-b-10">
                                    <input id="numero" name="numero" type="number" pattern="[0-9]" placeholder="Número" class="form-control" required>

                                </div>
                            </div>
                        </div>
                        <div class="row m-b-10">
                            <div class="col-md-5">
                                <label class="control-label" for="bairro">Bairro</label>
                                <div class="controls  m-t-10 m-b-10">
                                    <input id="bairro" name="bairro" type="text" placeholder="Bairro" required maxlength="100" required class="form-control">

                                </div>
                            </div>
                            <div class="col-md-5">
                                <label class="control-label" for="cidade">Cidade</label>
                                <div class="controls  m-t-10 m-b-10">
                                    <input id="cidade" name="cidade" type="text" placeholder="Cidade" required class="form-control">

                                </div>
                            </div>
                            <div class="col-md-2">
                                <label class="control-label" for="estado">Estado</label>
                                <div class="controls m-t-10 m-b-10">
                                    <select name="estado" required id="estado" class="form-control">
                                        <option value=""></option>
                                        <option value="AC">AC</option>
                                        <option value="AL">AL</option>
                                        <option value="AM">AM</option>
                                        <option value="AP">AP</option>
                                        <option value="BA">BA</option>
                                        <option value="CE">CE</option>
                                        <option value="DF">DF</option>
                                        <option value="ES">ES</option>
                                        <option value="GO">GO</option>
                                        <option value="MA">MA</option>
                                        <option value="MG">MG</option>
                                        <option value="MS">MS</option>
                                        <option value="MT">MT</option>
                                        <option value="PA">PA</option>
                                        <option value="PB">PB</option>
                                        <option value="PE">PE</option>
                                        <option value="PI">PI</option>
                                        <option value="PR">PR</option>
                                        <option value="RJ">RJ</option>
                                        <option value="RN">RN</option>
                                        <option value="RS">RS</option>
                                        <option value="RO">RO</option>
                                        <option value="RR">RR</option>
                                        <option value="SC">SC</option>
                                        <option value="SE">SE</option>
                                        <option value="SP">SP</option>
                                        <option value="TO">TO</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <button id="btcadastra" name="btcadastra" class="btn btn-success">Cadastrar</button>&nbsp;&nbsp;
                                <a href="login.php"><div id="btcancela" name="btcancela" class="btn btn-danger">Cancelar</div></a>
                            </div>
                        </div>

                    </form>
                </div>
            </section>
        </div>
    </div>


*=> footer
</div>
<div class="col-md-6 column fixed-footer">

    <h5> Desenvolvido por: André Silva, Daniel Druszcz, Guilherme Cercal e Vinicius Calegari.</h5>
        <h6>Todos os direitos reservados &copy</h6>
    <img src="img/logo_governo.png" height="50px">
</div>


</body>
</html>



*=> form_login_admin

<form name="frmLogin" method="post" action="loginadmin.php" onsubmit="return validarFormulario(this);">
    <div class="row clearfix" >
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <section class="panel">
                <header class="panel-heading">
                    Área administrativa - Login {invalid_login_alert}
                </header>
                <div class="panel-body">
                    <div class="alert alert-block alert-danger cpf-indisp-alert {invalid_login_alert}">
                        <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                            <i class="fa fa-times"></i>
                        </button>
                        <strong>Ops!</strong> Parece que as credenciais digitadas estão incorretas, por favor verifique!
                    </div>
                    <form class="form-horizontal" role="form">
                        <input type="hidden" name="frmPassou" value="OK">
                        <div class="form-group">
                            <label for="login" class="col-lg-2 col-sm-2 control-label">Login</label>
                            <div class="col-lg-10">
                                <input type="text" name="login" class="form-control" id="inputEmail1" placeholder="Nome de Usuário">
                                <br>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Senha</label>
                            <div class="col-lg-10">
                                <input type="password" name="senha" class="form-control" id="inputPassword1" placeholder="Senha">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <br>
                                <button type="submit" class="btn btn-success">Entrar</button>&nbsp;&nbsp;
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</form>
