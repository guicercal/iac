*=> header
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
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
<div class="fixed-header-default {hide_aqui}">
    <img src="img/logovota.png" height="50px">
    <h2>Justiça Eleitoral - Eleições 2015</h2>
    <a href="logout.php">
        <div class="btn btn-danger btn-logout {btn_logout}" title="Logout">
            <span class="glyphicon glyphicon-off"> Sair</span>
        </div>
    </a>
</div>
<div class="container conteudo">


*=> menu_principal
<div class="row clearfix">
<div class="col-md-12 column">
<section class="panel panel-info">
<header class="panel-heading">
    <ul class="nav nav-tabs nav-justified">
        <li role="presentation" class="{menu_home_active}"><a href="indexadmin.php">Home</a></li>
        <li role="presentation" class="{menu_eleitores_active}"><a href="eleitores.php">Eleitores</a></li>
        <li role="presentation" class="{menu_partidos_active}"><a href="cadastropartido.php">Partidos</a></li>
    </ul>
</header>
<div class="panel-body">


*=> conteudo_index
<center><font size="25" color="DF0000">Bem vindo a home da super inovadora urna eletronica web.</font></center>

*=> form_candidato

<div class="row clearfix" >
<div class="col-md-12">
<ol class="breadcrumb">
    <li><a href="cadastropartido.php?a=1">Partidos</a></li>
    <li><a href="cadastroCandidato.php?a=1&partido={id_partido}">Candidatos do partido: <b>{nome_partido} - {sigla_partido}</b></a></li>
    <li class="active">Cadastrar novo candidato</b></li>
</ol>
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
    <strong>Ops!</strong> Parece que este CPF de candidato está indisponível, por favor escolha outro nome ou realize o cadastro do candidato!
</div>
<div class="panel-body">
    <div id="alertaExisteEleitor" class="alert alert-info cadastro-sucesso-alert {cadastro_sucesso}">
        <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
            <i class="fa fa-times"></i>
        </button>

        <strong>Hey!</strong> Seu dados de eleitor serão utilizados.
    </div>
    <form id="cadg" action="cadastroCandidato.php?a=2" enctype="multipart/form-data" method="POST" class="form-horizontal" novalidate onsubmit="return validarFormulario(this);">
        <!-- Text input-->
        <input type="hidden" name="frmPassou" value="OK">
        <input type="hidden" name="cpfDisponivel" id="cpfDisponivel" value="true">
        <input type="hidden" name="id_partido" value="{id_partido}">
        <fieldset>
            <legend class="text">
                <h5>
                    Dados pessoais
                </h5>
            </legend>
            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="textinput">CPF</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="cpf" name="cpf" type="text" maxlength="14" onKeyPress ="mascaraCPF(cadg.cpf);" formato="cpf" required placeholder="CPF" class="form-control" onkeyup="verificaCandidato(this);">
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
                <div class="col-md-8">
                    <label class="control-label" for="foto">Foto</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="foto" name="foto" value="{presidente}" accept="image/gif, image/jpeg, image/png" type="file" required class="form-control">
                    </div>
                </div>

            </div>
        </fieldset>

        <fieldset>
            <legend class="text">
                <h5>
                    Dados do endereço
                </h5>
            </legend>

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
                <div class="col-md-4">
                    <label class="control-label" for="bairro">Bairro</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="bairro" name="bairro" type="text" placeholder="Bairro" required maxlength="100" required class="form-control">

                    </div>
                </div>
                <div class="col-md-6">
                    <label class="control-label" for="cidade">Cidade</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="cidade" name="cidade" type="text" placeholder="Cidade" required class="form-control">

                    </div>
                </div>
                <div class="col-md-2">
                    <label class="control-label" for="estado">Estado</label>
                    <div class="controls m-t-10 m-b-10">
                        <select name="estado" required id="estado" class="form-control">
                            <option value="">Estado</option>
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
        </fieldset>

        <fieldset>
            <legend class="text">
                <h5>
                    Dados do candidato
                </h5>
            </legend>
            <div class="row m-b-10">
                <div class="col-md-6">
                    <label class="control-label" for="nomeFantasia">Nome Fantasia</label>
                    <input id="nomeFantasia" name="nomeFantasia" type="text" placeholder="Nome Fantasia" required class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="control-label" for="numeroCandidato">Número do candidato</label>
                    <div>
                        <input id="numeroCandidato" name="numeroCandidato" type="text" pattern="[0-9]" value="{numero_partido}" onkeyup="mascaraNumeroCandidato(this,{numero_partido});" maxlength="5" placeholder="Número do candidato" class="form-control" required>

                    </div>
                </div>
                <div class="col-md-3">
                    <label class="control-label" for="cargo">Cargo</label>
                    <div class="controls">
                        <select  name="cargo" required id="cargo" class="form-control">
                            <option value=""></option>
                            <option value="1">Vereador</option>
                            <option value="2">Deputado Estadual</option>
                            <option value="3">Prefeito</option>
                        </select>
                    </div>
                </div>
            </div>
        </fieldset>
        <br>
        <div class="row m-b-10" align="center">
            <div class="col-md-12">
                <button id="btcadastra" name="btcadastra" class="btn btn-success">Cadastrar</button>&nbsp;&nbsp;
                <a href="login.php"><div id="btcancela" name="btcancela" class="btn btn-danger">Cancelar</div></a>
            </div>
        </div>

    </form>
</div>

</div>
</div>


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
                                <a href="cadastropessoa.php"><div class="btn btn-info">Registrar-me</div></a>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</form>

*=> form_cadastro_pessoa

<div class="row clearfix" >
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <section class="panel">
            <header class="panel-heading">
                Formulário de cadastro de eleitor
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
                <form id="cadg" action="cadastropessoa.php" method="POST" class="form-horizontal" novalidate onsubmit="return(validarFormulario(this) && verificaDisponibilidadeLogin(this));">
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


*=> form_cadastro_partido


<section class="panel">
    <fieldset>
        <legend>
            <ol class="breadcrumb">
                <li><a href="cadastropartido.php?a=1">Partidos</a></li>
                <li class="active">{nome_acao} Partido</li>
            </ol>
        </legend>
    </fieldset>
    <div class="alert alert-block alert-danger form-errors-alert">
        <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
            <i class="fa fa-times"></i>
        </button>
        <strong>Ops!</strong> Os campos em vermelho são obrigatórios ou possuem erros!
    </div>
    <div class="alert alert-success cadastro-sucesso-alert {cadastro_sucesso}">
        <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
            <i class="fa fa-times"></i>
        </button>
        <strong>Parabéns!</strong> A operação foi realizada com sucesso.
    </div>
    <div class="panel-body">
        <form id="cadpar" enctype="multipart/form-data" action="{action}" method="POST" novalidate onsubmit="return validarFormulario(this);">
            <!-- Text input-->
            <input type="hidden" name="frmPassou" value="OK">

            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="presidente">Presidente</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="presidente" name="presidente" value="{presidente}" type="text" maxlength="255" required placeholder="Nome do Presidente" class="form-control">
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="control-label" for="nome">Nome do partido</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="nome" name="nome" type="text" value="{nome}" required placeholder="Nome do partido" class="form-control">
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="control-label" for="numero">Número</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="numeroPartido" name="numeroPartido" value="{numero}" type="text" placeholder="Número do partido" maxlength="2" required class="form-control">
                    </div>
                </div>

            </div>

            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="deferimento">Deferimento</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="deferimento" name="deferimento" value="{deferimento}" type="text" placeholder="Deferimento"  required class="form-control">
                    </div>
                </div>

                <div class="col-md-4">
                    <label class="control-label" for="sigla">Sigla</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="sigla" name="sigla" type="text" placeholder="Sigla" value="{sigla}" required class="form-control">
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="control-label" for="coligacao">Coligação</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="coligacao" name="coligacao" type="text" value="{coligacao}" placeholder="Coligação" required class="form-control">
                    </div>
                </div>
            </div>
            <div class="row m-b-10">
                <div class="col-md-12">
                    <label class="control-label" for="foto">Foto</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="foto" name="foto" value="{presidente}" accept="image/gif, image/jpeg, image/png" type="file" required class="form-control">
                    </div>
                </div>


            </div>
            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="cep">CEP</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="cep" name="cep" type="text" value="{cep}" placeholder="CEP" required maxlength="10" onkeypress="mascaraCep(this);" onkeyup="buscaEndereco(this);" class="form-control">

                    </div>
                </div>
                <div class="col-md-6">
                    <label class="control-label" for="logradouro">Logradouro</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="logradouro" name="logradouro" value="{logradouro}" type="text" placeholder="Logradouro" required class="form-control">

                    </div>
                </div>
                <div class="col-md-2">
                    <label class="control-label" for="numero">Número</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="numero" name="numero_end" type="number" value="{numero_end}" pattern="[0-9]" placeholder="Número" class="form-control" required>

                    </div>
                </div>
            </div>
            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="bairro">Bairro</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="bairro" name="bairro" type="text" value="{bairro}" placeholder="Bairro" required maxlength="100" required class="form-control">

                    </div>
                </div>
                <div class="col-md-6    ">
                    <label class="control-label" for="cidade">Cidade</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="cidade" name="cidade" type="text" value="{cidade}" placeholder="Cidade" required class="form-control">

                    </div>
                </div>
                <div class="col-md-2">
                    <label class="control-label" for="estado">Estado</label>
                    <div class="controls m-t-10 m-b-10">
                        <select name="estado" required id="estado" class="form-control">
                            <option value=""></option>
                            <option value="AC" {AC}>AC</option>
                            <option value="AL" {AL}>AL</option>
                            <option value="AM" {AM}>AM</option>
                            <option value="AP" {AP}>AP</option>
                            <option value="BA" {BA}>BA</option>
                            <option value="CE" {CE}>CE</option>
                            <option value="DF" {DF}>DF</option>
                            <option value="ES" {ES}>ES</option>
                            <option value="GO" {GO}>GO</option>
                            <option value="MA" {MA}>MA</option>
                            <option value="MG" {MG}>MG</option>
                            <option value="MS" {MS}>MS</option>
                            <option value="MT" {MT}>MT</option>
                            <option value="PA" {PA}>PA</option>
                            <option value="PB" {PB}>PB</option>
                            <option value="PE" {PE}>PE</option>
                            <option value="PI" {PI}>PI</option>
                            <option value="PR" {PR}>PR</option>
                            <option value="RJ" {RJ}>RJ</option>
                            <option value="RN" {RN}>RN</option>
                            <option value="RS" {RS}>RS</option>
                            <option value="RO" {RO}>RO</option>
                            <option value="RR" {RR}>RR</option>
                            <option value="SC" {SC}>SC</option>
                            <option value="SE" {SE}>SE</option>
                            <option value="SP" {SP}>SP</option>
                            <option value="TO" {TO}>TO</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 m-t-15 text-center">

                    <button id="btcadastra" name="btcadastra" class="btn btn-success">Cadastrar</button>&nbsp;&nbsp;
                    <a href="cadastropartido.php"><div id="btcancela" name="btcancela" class="btn btn-danger">Cancelar</div></a>
                </div>
            </div>
        </form>
    </div>
</section>



*=> footer
</div>
</div>
</div>
</div>
<div class="col-md-6 column fixed-footer {hide_aqui}">
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
                    Área administrativa - Login
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
    </div>
</form>


*=> form_configuracoes

<section class="panel">
    <fieldset>
        <legend>
            <ol class="breadcrumb">
                <li class="active">Configurações da Eleição</li>
            </ol>
        </legend>

        <div class="alert alert-block alert-danger form-errors-alert">
            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                <i class="fa fa-times"></i>
            </button>
            <strong>Ops!</strong> Os campos em vermelho são obrigatórios ou possuem erros!
        </div>
        <div class="alert alert-block alert-danger form-errors-alert {config_err}">
            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                <i class="fa fa-times"></i>
            </button>
            <strong>Ops!</strong> Algo deu Errado! verifique a validade dos dados informados
        </div>
        <div class="alert alert-block alert-success cadastro-sucesso-alert {config_ok}">
            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                <i class="fa fa-times"></i>
            </button>
            <strong>Muito Bem!</strong> Suas configurações foram salvas com sucesso!
        </div>
        <div class="panel-body">
            <form id="cadg" action="indexadmin.php" method="POST" class="form-horizontal" novalidate onsubmit="return validarFormulario(this) ;">
                <!-- Text input-->
                <input type="hidden" name="frmPassou" value="OK">

                <div class="row m-b-10">
                    <div class="col-md-3">
                        <label class="control-label" for="textinput">Data de início</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="datainicio" name="data_inicio" type="date" value="{data_inicio}" required placeholder="Data de início" onchange="$(datatermino).attr('min',$(this).val());
                            datatermino.value = (datatermino.value < this.value) ? this.value : datatermino.value;" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="control-label" for="textinput">Horário de início</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="horarioinicio" name="horario_inicio" type="time" value="{horario_inicio}" onchange="$(horariotermino).attr('min',$(this).val());" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="control-label" for="textinput">Data de término</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="datatermino" name="data_termino"  type="date" value="{data_termino}" required placeholder="Data de Término" onchange="this.value = (this.value < datainicio.value) ? datainicio.value : this.value" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="control-label" for="textinput">Horário de término</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="horariotermino" name="horario_termino" type="time" value="{horario_termino}" onchange="this.value = (this.value < horarioinicio.value) ? horarioinicio.value : this.value" class="form-control">
                        </div>
                    </div>
                </div>
                <fieldset class="m-t-15">
                    <legend><h5>Quantidade de vagas por cargo</h5></legend>

                    <div class="row m-b-10">
                        <div class="col-md-4">
                            <label class="control-label" for="titulo">Vereadores</label>
                            <div class="controls  m-t-10 m-b-10">
                                <input id="vagasvereador" name="qtd_vagas_vereador" type="number" min="0" step="1" value="{qtd_vagas_vereador}" required class="form-control">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <label class="control-label" for="titulo">Deputados</label>
                            <div class="controls  m-t-10 m-b-10">
                                <input id="vagasdeputado" name="qtd_vagas_deputado" type="number" min="0" step="1" value="{qtd_vagas_deputado}" required class="form-control">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <label class="control-label" for="titulo">Prefeito</label>
                            <div class="controls  m-t-10 m-b-10">
                                <input id="vagasprefeito" name="qtd_vagas_prefeito" type="number" min="0" step="1" value="{qtd_vagas_prefeito}" disabled required class="form-control">

                            </div>
                        </div>
                    </div>
                </fieldset>

                <div class="row clearfix">
                    <div class="col-md-12">
                        <button id="btcadastra" name="btcadastra" class="btn btn-info">Gravar</button>&nbsp;&nbsp;
                    </div>
                </div>
            </form>
        </div>
    </fieldset>
</section>


*=> eleitores_table_head
<table class="table table-hover table-bordered">
    <thead>
    <th class="text-center">CPF</th>
    <th class="text-center">Nome</th>
    <th class="text-center">Votou?</th>
    <th class="text-center">Ações</th>
    </thead>
    *=> eleitores_table_linha
    <tr>
        <td class="text-center">{cpf}</td>
        <td>{nome}</td>
        <td class="text-center">
            <span class="label {cor_votou}">{votou}</span>
        </td>
        <td class="text-center">
            <div class="center-block hidden-phone">
                <a href="{link_editar}"><button class="btn btn-default btn-xs" title="Editar"><i class="fa fa-pencil"></i></button></a>
                <a href="{link_excluir}" onclick="return confirm('Tem certeza que deseja excluir o eleitor {nome} ?');"><button class="btn btn-default btn-xs"><i class="fa fa-trash-o"></i></button></a>
            </div>
        </td>
    </tr>

    *=> eleitores_table_linha_eof
    <tr>
        <td colspan="4" class="text-center">Nenhum registro encontrado!</td>

    </tr>

    *=> eleitores_table_foot
</table>
<div class="box-tools m-b-15">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            {paginacao}
        </div>
        <div class="col-md-4">
            <form name="searcEleitor" action="eleitores.php?a=1" method="get">
                <div class="input-group">

                    <input type="text" name="filtro" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Pesquisar"/>
                    <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                    </div>


                </div>
            </form>
        </div>
    </div>
</div>


*=> form_editar_eleitor
<section class="panel">
    <fieldset>
        <legend>
            <ol class="breadcrumb">

                <li><a href="eleitores.php?a=1">Eleitores</a></li>
                <li class="active">Editar Cadastro de Eleitor</li>
            </ol>
        </legend>
        <div class="alert alert-block alert-danger form-errors-alert">
            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                <i class="fa fa-times"></i>
            </button>
            <strong>Ops!</strong> Os campos em vermelho são obrigatórios ou possuem erros!
        </div>
        <div class="alert alert-block alert-danger form-errors-alert {gravar_err}">
            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                <i class="fa fa-times"></i>
            </button>
            <strong>Ops!</strong> Ocorreu um erro, por favor verifique a validade dos dados informados!
        </div>
        <div class="alert alert-block alert-success cadastro-sucesso-alert {cadastro_sucesso}">
            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                <i class="fa fa-times"></i>
            </button>
            <strong>Muito Bem!</strong> Os dados do eleitor foram salvos com sucesso!
        </div>
        <div class="panel-body">
            <form id="cadg" action="eleitores.php?a=2&id={cpf}" method="POST" class="form-horizontal" novalidate onsubmit="return(validarFormulario(this));">
                <!-- Text input-->
                <input type="hidden" name="frmPassou" value="OK">
                <div class="row m-b-10">
                    <div class="col-md-4">
                        <label class="control-label" for="textinput">CPF</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="cpf" name="cpf" type="text" maxlength="14" value="{cpf}" disabled class="form-control">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label class="control-label" for="nome">Nome</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="nome" name="nome" type="text" value="{nome}" required placeholder="Nome" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label class="control-label" for="Rg">RG</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="rg" name="rg" type="text" value="{rg}" placeholder="RG" required class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row m-b-10">
                    <div class="col-md-4">
                        <label class="control-label" for="titulo">Título</label>
                        <div class="controls  m-t-10 m-b-10">
                            <input id="titulo" name="titulo" type="text" value="{titulo}" placeholder="Título" required maxlength="15" class="form-control">

                        </div>
                    </div>
                    <div class="col-md-4">
                        <label class="control-label" for="login">Login</label>
                        <div class="controls  m-t-10 m-b-10">
                            <input id="login" name="login" value="{login}" type="text" placeholder="Login" required class="form-control">

                        </div>
                    </div>
                    <div class="col-md-4">
                        <label class="control-label" for="password">Senha </label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="senha" name="senha" type="password" placeholder="Senha" class="form-control">

                        </div>
                    </div>
                </div>
                <div class="row m-b-10">
                    <div class="col-md-4">
                        <label class="control-label" for="cep">CEP</label>
                        <div class="controls  m-t-10 m-b-10">
                            <input id="cep" name="cep" type="text" value="{cep}" placeholder="CEP" required maxlength="10" onkeypress="mascaraCep(this);" onkeyup="buscaEndereco(this);" class="form-control">

                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="control-label" for="logradouro">Logradouro</label>
                        <div class="controls  m-t-10 m-b-10">
                            <input id="logradouro" name="logradouro" value="{logradouro}" type="text" placeholder="Logradouro" required class="form-control">

                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="control-label" for="numero">Número</label>
                        <div class="controls m-t-10 m-b-10">
                            <input id="numero" name="numero" type="number" value="{numero}" pattern="[0-9]" placeholder="Número" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="row m-b-10">
                    <div class="col-md-5">
                        <label class="control-label" for="bairro">Bairro</label>
                        <div class="controls  m-t-10 m-b-10">
                            <input id="bairro" name="bairro" type="text" value="{bairro}" placeholder="Bairro" required maxlength="100" required class="form-control">
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label class="control-label" for="cidade">Cidade</label>
                        <div class="controls  m-t-10 m-b-10">
                            <input id="cidade" name="cidade" value="{cidade}" type="text" placeholder="Cidade" required class="form-control">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="control-label" for="estado">Estado</label>
                        <div class="controls m-t-10 m-b-10">
                            <select name="estado" required id="estado" class="form-control">
                                <option value=""></option>
                                <option value="AC" {AC}>AC</option>
                                <option value="AL" {AL}>AL</option>
                                <option value="AM" {AM}>AM</option>
                                <option value="AP" {AP}>AP</option>
                                <option value="BA" {BA}>BA</option>
                                <option value="CE" {CE}>CE</option>
                                <option value="DF" {DF}>DF</option>
                                <option value="ES" {ES}>ES</option>
                                <option value="GO" {GO}>GO</option>
                                <option value="MA" {MA}>MA</option>
                                <option value="MG" {MG}>MG</option>
                                <option value="MS" {MS}>MS</option>
                                <option value="MT" {MT}>MT</option>
                                <option value="PA" {PA}>PA</option>
                                <option value="PB" {PB}>PB</option>
                                <option value="PE" {PE}>PE</option>
                                <option value="PI" {PI}>PI</option>
                                <option value="PR" {PR}>PR</option>
                                <option value="RJ" {RJ}>RJ</option>
                                <option value="RN" {RN}>RN</option>
                                <option value="RS" {RS}>RS</option>
                                <option value="RO" {RO}>RO</option>
                                <option value="RR" {RR}>RR</option>
                                <option value="SC" {SC}>SC</option>
                                <option value="SE" {SE}>SE</option>
                                <option value="SP" {SP}>SP</option>
                                <option value="TO" {TO}>TO</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button id="btcadastra" name="btcadastra" class="btn btn-success">Gravar</button>&nbsp;&nbsp;
                        <div id="btcancela" onclick="window.history.go(-1);" name="btcancela" class="btn btn-danger">Cancelar</div>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>
</section>

*=> partidos_table_head


<table class="table table-hover table-bordered">
    <thead>
    <th class="text-center">Sigla</th>
    <th class="text-center">Nome</th>
    <th class="text-center">Número</th>
    <th class="text-center">Ações</th>

    </thead>
    *=> partidos_table_linha
    <tr>
        <td class="text-center">{sigla}</td>
        <td>{nome}</td>
        <td class="text-center">
            {numero}
        </td>
        <td class="text-center">
            <div class="center-block hidden-phone">
                <a href="{link_candidatos}"><button class="btn btn-default btn-xs" title="Candidato"><i class="fa fa-user"></i></button></a>
                <a href="{link_editar}"><button class="btn btn-default btn-xs" title="Editar"><i class="fa fa-pencil"></i></button></a>
                <a href="{link_excluir}" onclick="return confirm('Tem certeza que deseja excluir o eleitor {nome} ?');" title="Excluir"><button class="btn btn-default btn-xs"><i class="fa fa-trash-o"></i></button></a>
            </div>
        </td>
    </tr>

    *=> partidos_table_linha_eof
    <tr>
        <td colspan="4" class="text-center">Nenhum registro encontrado!</td>

    </tr>

*=> partidos_table_foot
</table>
<div class="box-tools m-b-15">
    <div class="row">
        <div class="col-md-4">
            <a href="cadastropartido.php?a=2" title="Novo Partido">
                <div class="btn btn-info">
                    <span class="glyphicon glyphicon-plus-sign"> Novo</span>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            {paginacao}
        </div>
        <div class="col-md-4">
            <form name="searcEleitor" action="cadastropartido.php?a=1" method="get">
                <div class="input-group">

                    <input type="text" name="filtro" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Pesquisar"/>
                    <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                    </div>


                </div>
            </form>
        </div>
    </div>
</div>

*=> candidatos_table_head
<ol class="breadcrumb">
    <li><a href="cadastropartido.php?a=1">Partidos</a></li>
    <li class="active">Candidatos do partido: <b>{nome_partido} - {sigla_partido}</b></li>
</ol>
<table class="table table-hover table-bordered">
    <thead>
    <th class="text-center">Nome da urna</th>
    <th class="text-center">Nome</th>
    <th class="text-center">Número</th>
    <th class="text-center">Ações</th>

    </thead>

*=> candidatos_table_linha
    <tr>
        <td class="text-center">{nome_fantasia}</td>
        <td>{nome}</td>
        <td class="text-center">
            {numero}
        </td>
        <td class="text-center">
            <div class="center-block hidden-phone">
                <a href="{link_editar}"><button class="btn btn-default btn-xs" title="Ver dados"><i class="fa fa-user"></i></button></a>
                <a href="{link_editar}"><button class="btn btn-default btn-xs" title="Editar"><i class="fa fa-pencil"></i></button></a>
                <a href="{link_excluir}" onclick="return confirm('Tem certeza que deseja excluir o candidato {nome} ?');" title="Excluir"><button class="btn btn-default btn-xs"><i class="fa fa-trash-o"></i></button></a>
            </div>
        </td>
    </tr>

*=> candidatos_table_linha_eof
    <tr>
        <td colspan="4" class="text-center">Nenhum registro encontrado!</td>
    </tr>

*=> candidatos_table_foot
</table>
<div class="box-tools m-b-15">
    <div class="row">
        <div class="col-md-4">
            <a href="cadastroCandidato.php?a=2&id_partido={id_partido}" title="Novo Candidato">
                <div class="btn btn-info">
                    <span class="glyphicon glyphicon-plus-sign"> Novo</span>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            {paginacao}
        </div>
        <div class="col-md-4">
            <form name="searchEleitor" action="eleitores.php?a=1" method="get">
                <div class="input-group">

                    <input type="text" name="filtro" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Pesquisar"/>
                    <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                    </div>


                </div>
            </form>
        </div>
    </div>
</div>

*=> urna
<script type="text/javascript" src="js/urna.js"></script>
<div class="panel panel-default">
    <div class="panel-heading" align="center"> <h4>Vote com consciência! </h4>  </div>
        <div class="panel panel-default">
            <div class="panel-body">
               <div class="row">
                   <div class="col-md-1"></div>
                   <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-6">

                            <div class="row ">
                            <div class="col-md-8" id="cargo">Vereador</div>
                            <div class="col-md-4 row-partido">
                                <img src="img/sem_foto.jpg" id="foto-partido" class="img-circle"  height="100%" width="100%" >
                            </div>
                            </div>
                            <div class="row-candidato">
                           <img src="img/sem_foto.jpg" id="foto-candidato" height="100%" width="100%" class="img-circle">
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-lg-12">
                                    <input type="text" class="form-control" disabled id="nomecandidato" placeholder="Candidato" aria-describedby="sizing-addon">
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-9">
                                    <input type="text" id="campo-voto" disabled class="form-control" placeholder="Candidato" aria-describedby="sizing-addon">
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(1);" >1</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(2);">2</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(3);">3</button>
                                </div>
                                <div class="col-md-1"></div>

                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(4);">4</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(5);">5</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(6);">6</button>
                                </div>
                                <div class="col-md-1"></div>

                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(7);">7</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(8);">8</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(9);">9</button>
                                </div>
                                <div class="col-md-1"></div>

                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-3">

                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-black btn-lg active" onclick="digitaUrna(0);">0</button>
                                </div>
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-default" name="btnBranco" onclick="branco();" value="branco" >BRANCO</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-danger  active" onclick="corrige();">CORRIGE</button>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-success btn-lg active" onclick="confirma();" >CONFIRMA</button>
                                </div>
                                <div class="col-md-1"></div>

                            </div>
                        </div>

                    </div>

                   </div>
                   <div class="col-md-1"></div>
            </div>
                <br>
                <br>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-3">
                       Nome do candidato: <span class="nome-candidato"></span>
                    </div>
                    <div class="col-md-3">
                        Número: <span id="numero-candidato"></span>
                    </div>
                    <div class="col-md-3">
                        Partido: <span id="nome-partido"></span>
                    </div>
                    <div class="col-md-3">
                        Coligação: <span id="coligacao-partido"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<form name="formVotos" id="formVotos" action="computarVoto.php" method="post">

</form>

*=> form_editar_candidato

<div class="row clearfix" >
<div class="col-md-12">
<ol class="breadcrumb">
    <li><a href="cadastropartido.php?a=1">Partidos</a></li>
    <li><a href="cadastroCandidato.php?a=1&partido={id_partido}">Candidatos do partido: <b>{nome_partido} - {sigla_partido}</b></a></li>
    <li class="active">Editar cadastro de candidato</b></li>
</ol>
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
    <strong>Ops!</strong> Parece que este CPF de candidato está indisponível, por favor escolha outro nome ou realize o cadastro do candidato!
</div>
<div class="alert alert-block alert-success login-indisp-alert {cadastro_sucesso}">
    <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
        <i class="fa fa-times"></i>
    </button>
    <strong>Parabéns!</strong> Operação realizada com sucesso
</div>
<div class="panel-body">
    <div id="alertaExisteEleitor" class="alert alert-info cadastro-sucesso-alert">
        <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
            <i class="fa fa-times"></i>
        </button>

        <strong>Hey!</strong> Seu dados de eleitor serão utilizados.
    </div>
    <form id="cadg" enctype="multipart/form-data" action="cadastroCandidato.php?a=3" method="POST" class="form-horizontal" novalidate onsubmit="return validarFormulario(this);">
        <!-- Text input-->
        <input type="hidden" name="frmPassou" value="OK">
        <input type="hidden" name="cpfDisponivel" id="cpfDisponivel" value="true">
        <input type="hidden" name="id_candidato" value="{id_candidato}">
        <fieldset>
            <legend class="text">
                <h5>
                    Dados pessoais
                </h5>
            </legend>
            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="textinput">CPF</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="cpf" name="cpf" type="text" value="{cpf}" maxlength="14" disabled onKeyPress ="mascaraCPF(cadg.cpf);" formato="cpf" required placeholder="CPF" class="form-control" onkeyup="verificaCandidato(this);">
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="control-label" for="nome">Nome</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="nome" name="nome" type="text" value="{nome}" disabled required placeholder="Nome" class="form-control">
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="control-label" for="Rg">RG</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="rg" name="rg" type="text" value="{rg}" maxlength="10" placeholder="RG" disabled required class="form-control">
                    </div>
                </div>
            </div>
            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="titulo">Título</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="titulo" name="titulo" type="text" value="{titulo}" disabled placeholder="Título" required maxlength="15" class="form-control">

                    </div>
                </div>
                <div class="col-md-8">
                    <label class="control-label" for="foto">Foto</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="foto" name="foto" value="{presidente}" accept="image/gif, image/jpeg, image/png" type="file" class="form-control">
                    </div>
                </div>

            </div>
        </fieldset>

        <fieldset>
            <legend class="text">
                <h5>
                    Dados do endereço
                </h5>
            </legend>

            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="cep">CEP</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="cep" name="cep" type="text" value="{cep}" disabled placeholder="CEP" required maxlength="10" onkeypress="mascaraCep(this);" onkeyup="buscaEndereco(this);" class="form-control">

                    </div>
                </div>
                <div class="col-md-6">
                    <label class="control-label" for="logradouro">Logradouro</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="logradouro" name="logradouro" disabled value="{logradouro}" type="text" placeholder="Logradouro" required class="form-control">

                    </div>
                </div>
                <div class="col-md-2">
                    <label class="control-label" for="numero">Número</label>
                    <div class="controls m-t-10 m-b-10">
                        <input id="numero" name="numero" type="number" disabled pattern="[0-9]" value="{numero_end}" placeholder="Número" class="form-control" required>

                    </div>
                </div>
            </div>



            <div class="row m-b-10">
                <div class="col-md-4">
                    <label class="control-label" for="bairro">Bairro</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="bairro" name="bairro" type="text" disabled placeholder="Bairro" value="{bairro}" required maxlength="100" required class="form-control">

                    </div>
                </div>
                <div class="col-md-6">
                    <label class="control-label" for="cidade">Cidade</label>
                    <div class="controls  m-t-10 m-b-10">
                        <input id="cidade" name="cidade" type="text" disabled placeholder="Cidade" value="{cidade}" required class="form-control">

                    </div>
                </div>
                <div class="col-md-2">
                    <label class="control-label" for="estado">Estado</label>
                    <div class="controls m-t-10 m-b-10">
                        <select name="estado" required id="estado" disabled class="form-control">
                            <option value="">Estado</option>
                            <option value="AC" {AC}>AC</option>
                            <option value="AL" {AL}>AL</option>
                            <option value="AM" {AM}>AM</option>
                            <option value="AP" {AP}>AP</option>
                            <option value="BA" {BA}>BA</option>
                            <option value="CE" {CE}>CE</option>
                            <option value="DF" {DF}>DF</option>
                            <option value="ES" {ES}>ES</option>
                            <option value="GO" {GO}>GO</option>
                            <option value="MA" {MA}>MA</option>
                            <option value="MG" {MG}>MG</option>
                            <option value="MS" {MS}>MS</option>
                            <option value="MT" {MT}>MT</option>
                            <option value="PA" {PA}>PA</option>
                            <option value="PB" {PB}>PB</option>
                            <option value="PE" {PE}>PE</option>
                            <option value="PI" {PI}>PI</option>
                            <option value="PR" {PR}>PR</option>
                            <option value="RJ" {RJ}>RJ</option>
                            <option value="RN" {RN}>RN</option>
                            <option value="RS" {RS}>RS</option>
                            <option value="RO" {RO}>RO</option>
                            <option value="RR" {RR}>RR</option>
                            <option value="SC" {SC}>SC</option>
                            <option value="SE" {SE}>SE</option>
                            <option value="SP" {SP}>SP</option>
                            <option value="TO" {TO}>TO</option>
                        </select>
                    </div>
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend class="text">
                <h5>
                    Dados do candidato
                </h5>
            </legend>
            <div class="row m-b-10">
                <div class="col-md-6">
                    <label class="control-label" for="nomeFantasia">Nome Fantasia</label>
                    <input id="nomeFantasia" name="nomeFantasia" type="text" value="{nomeFantasia}" placeholder="Nome Fantasia" required class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="control-label" for="numeroCandidato">Número do candidato</label>
                    <div>
                        <input id="numeroCandidato" name="numeroCandidato" type="text" value="{numero}" onkeyup="mascaraNumeroCandidato(this,{numero_partido});" maxlength="5" placeholder="Número do candidato" class="form-control" required>

                    </div>
                </div>
                <div class="col-md-3">
                    <label class="control-label" for="cargo">Cargo</label>
                    <div class="controls">
                        <select  name="cargo" required id="cargo" class="form-control">
                            <option value=""></option>
                            <option value="1" {cargo_1}>Vereador</option>
                            <option value="2" {cargo_2}>Deputado Estadual</option>
                            <option value="3" {cargo_3}>Prefeito</option>
                        </select>
                    </div>
                </div>
            </div>
        </fieldset>
        <br>
        <div class="row m-b-10" align="center">
            <div class="col-md-12">
                <button id="btcadastra" name="btcadastra" class="btn btn-success">Cadastrar</button>&nbsp;&nbsp;
                <a href="login.php"><div id="btcancela" name="btcancela" class="btn btn-danger">Cancelar</div></a>
            </div>
        </div>

    </form>
</div>

</div>
</div>

*=> voce_ja_votou

<div class="row clearfix">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <div class="alert alert-block alert-success">
            <button data-dismiss="alert" class="close close-sm" type="button" onclick="$(this).parent().fadeOut(400);">
                <i class="fa fa-times"></i>
            </button>
            <strong>Obrigado!</strong> O seu voto foi computado com sucesso! aguarde o resultado das eleições!
        </div>
    </div>
</div>

*=> comprovante_votacao

<div class="row clearfix">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <section class="panel panel-default">
            <div class="panel-heading" style="text-align: center">Comprovante de Votação</div>
            <div class="panel-body" style="text-align: justify">
                O eleitor {nome}, no exercício de seu direito de cidadão,
                participou das eleições 2015 através da urna online
                <br><br>
                chave de validação: <br>{chave}
            </div>
        </section>
    </div>
</div>