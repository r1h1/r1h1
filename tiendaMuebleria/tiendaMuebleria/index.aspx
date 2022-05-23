<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tiendaMuebleria.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous" />

    <link rel="stylesheet" href="css/index.css" />
    <!-- Google Font: Source Sans Pro -->
    <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link
        rel="stylesheet"
        href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Tempusdominus Bootstrap 4 -->
    <link
        rel="stylesheet"
        href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- iCheck -->
    <link
        rel="stylesheet"
        href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css" />
    <!-- overlayScrollbars -->
    <link
        rel="stylesheet"
        href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css" />
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css" />
    <script src="https://kit.fontawesome.com/bac7f444fd.js" crossorigin="anonymous"></script>

    <title>Bienvenido - Tienda en Linea</title>

    <script src="https://kit.fontawesome.com/bac7f444fd.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- contenedor principal con información relevante -->
            <main class="text-principal">
                <div class="container-fluid container-principal bg-gris text-center">
                    <h1>Bienvenido a</h1>
                    <p>Mueblería Los Alpes</p>
                    <p>
                        ¡Escoge un perfil para iniciar!
          <i class="fa-solid fa-arrow-pointer"></i>
                    </p>
                </div>
            </main>
            <!-- fin contenedor principal -->

            <!-- menu de navegacion -->
            <header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <!-- vacio -->
                </nav>
            </header>
            <!-- fin menu -->

            <section class="content container text-center info-perfil">
                <h2>¿Tú eres?</h2>
            </section>

            <section class="content container perfiles">
                <div class="row">
                    <div class="col-sm-4 mt-4">
                        <div class="card text-center bg-secondary">
                            <a href="views/client/cliente.aspx">
                                <div class="card-body">
                                    <i class="nav-icon fa-solid fa-user fa-6x"></i>
                                    <i class="nav-icon fa-solid fa-cart-shopping fa-2x"></i>
                                    <div class="card-body">
                                        <h4 class="card-title">Cliente</h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-4 mt-4">
                        <div class="text-center">
                            <h1>- o -</h1>
                        </div>
                    </div>
                    <div class="col-sm-4 mt-4">
                        <div class="card text-center text-white bg-danger">
                            <a href="views/ingreso.aspx">
                                <div class="card-body">
                                    <i class="nav-icon fa-solid fa-user-gear fa-6x"></i>
                                    <div class="card-body">
                                        <h4 class="card-title">Administrador</h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- pie de pagina -->
            <footer class="pie-pagina">
                <div class="container-fluid">
                    <!-- columas con los metodos de pago -->
                    <div class="row">
                        <div class="col text-center">
                            <p class="titulo-footer text-center">Formas de pago</p>
                            <i class="fa-brands fa-cc-visa fa-3x"></i>
                            <i class="fa-brands fa-cc-mastercard fa-3x"></i>
                            <i class="fa-brands fa-cc-paypal fa-3x"></i>
                        </div>
                    </div>
                    <!-- fin metodo de pago -->

                    <p class="text-center mt-4">
                        <strong>Copyright &copy; Muebleria Los Alpes</strong> All rights
          reserved.
                    </p>
                </div>
            </footer>
            <!-- fin pie de pagina -->

            <!-- Option 1: Bootstrap Bundle with Popper -->
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
        </div>
    </form>
</body>
</html>
