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



    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">

    </style>
</head>
<body>


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
<div class="fixed-header-default">
            <img src="img/logovota.png" height="50px">
            <h2>Justiça Eleitoral - Eleições 2015</h2>

</div>
    <br><br><br><br><br><br>
    <form name="frmLogin" method="post" action="login.php">
        <div class="row clearfix" >
            <div class="col-md-4"></div>
            <div class="col-md-4">

                <section class="panel">
                    <header class="panel-heading">
                        Efetue o Login
                    </header>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="login" class="col-lg-2 col-sm-2 control-label">Login</label>
                                <div class="col-lg-10">
                                    <input type="login" class="form-control" id="inputEmail1" placeholder="Nome de Usuário">
                                    <br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">Senha</label>
                                <div class="col-lg-10">
                                    <input type="password" class="form-control" id="inputPassword1" placeholder="Senha">
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-lg-offset-2 col-lg-10">
                                    <br>
                                    <button type="submit" class="btn btn-verde">Entrar</button>&nbsp;&nbsp;
                                    <button type="submit" class="btn btn-verde">Registrar-me</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </form>


*=> footer

        <div class="col-md-6 column fixed-footer">

            <h5> Desenvolvido por: André Silva, Daniel Druszcz, Guilherme Cercal e Vinicius Calegari.</h5>
                <h6>Todos os direitos reservados &copy</h6>
            <img src="img/logos-30%20-%20governo%20federal.png" height="50px">
        </div>


</body>
</html>


