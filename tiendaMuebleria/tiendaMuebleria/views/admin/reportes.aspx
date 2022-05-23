<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportes.aspx.cs" Inherits="tiendaMuebleria.reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Muebleria - Dashboard</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="../../plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css"/>
    <script src="https://kit.fontawesome.com/bac7f444fd.js" crossorigin="anonymous"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <form id="form1" runat="server">
        <div>
            <div class="wrapper">

                <!-- Navbar -->
                <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                    <!-- Left navbar links -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                        </li>
                        <li class="nav-item d-none d-sm-inline-block">
                            <a href="dashboard.aspx" class="nav-link">Inicio</a>
                        </li>
                        <li class="nav-item d-none d-sm-inline-block">
                            <asp:Button ID="cerrarSesion" runat="server" Text="Cerrar Sesión" class="btn btn-danger" OnClick="cerrarSesion_Click1"/>
                        </li>
                    </ul>
                </nav>
                <!-- /.navbar -->

                <!-- Main Sidebar Container -->
                <aside class="main-sidebar sidebar-dark-primary elevation-4">
                    <!-- Brand Logo -->
                    <a href="index3.aspx" class="brand-link">
                        <span class="brand-text font-weight-light">Muebleria Los Alpes</span>
                    </a>

                    <!-- Sidebar -->
                    <div class="sidebar">

                        <!-- Sidebar Menu -->
                        <nav class="mt-2">
                            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                                data-accordion="false">
                                
                                <li class="nav-item">
                                    <a href="./dashboard.aspx" class="nav-link active btn btn-primary">
                                        <i class="right fas fa-angle-left"></i>
                                        <p>Inicio</p>
                                    </a>
                                </li>
                                <li class="nav-header">Módulos</li>
                                <li class="nav-item">
                                    <a href="clientes.aspx" class="nav-link">
                                        <i class="nav-icon fa-solid fa-person"></i>
                                        <p>
                                            Clientes
                                        </p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="productos.aspx" class="nav-link">
                                        <i class="nav-icon fa-solid fa-box"></i>
                                        <p>
                                            Productos
                                        </p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="reportes.aspx" class="nav-link">
                                        <i class="nav-icon fa-solid fa-align-justify"></i>
                                        <p>
                                            Reportes
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <!-- /.sidebar-menu -->
                    </div>
                    <!-- /.sidebar -->
                </aside>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <div class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-12">
                                    <h1 class="m-0 pl-5 mt-4">Reportes</h1>                                   
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- /.content-header -->

                    <!-- Main content -->
                    <section class="content container">
                        <div class="row">
                            <div class="col-sm-3 mt-4">
                                <div class="card text-center bg-secondary">
                                    <a href="../admin/reports/filtrarVentaCodigo.aspx">
                                        <div class="card-body">
                                            <i class="nav-icon fa-solid fa-cart-shopping fa-4x"></i>
                                            <div class="card-body">
                                                <h5 class="card-title">Consultar Ventas</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-3 mt-4">
                                <div class="card text-center text-white bg-secondary">
                                    <a href="reports/reporteVentasDiarias.aspx">
                                        <div class="card-body">
                                            <i class="nav-icon fas fa-calendar fa-4x"></i>
                                            <div class="card-body">
                                                <h5 class="card-title">Ventas Diarias</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-3 mt-4">
                                <div class="card text-center bg-secondary">
                                    <a href="reports/productoMasVendido.aspx">
                                        <div class="card-body">
                                            <i class="nav-icon fas fa-box fa-4x"></i>
                                            <div class="card-body">
                                                <h5 class="card-title">Producto Más Vendido</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-3 mt-4">
                                <div class="card text-center bg-secondary">
                                    <a href="reports/comprasXCliente.aspx">
                                        <div class="card-body">
                                            <i class="nav-icon fa-solid fa-people-carry-box fa-4x"></i>
                                            <div class="card-body">
                                                <h5 class="card-title">Compras por Cliente</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>                            
                        </div>
                   </section>

                    <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->
                <footer class="main-footer">
                    <strong>Copyright &copy; Muebleria Los Alpes</strong>
                    All rights reserved.
                </footer>

                <!-- Control Sidebar -->
                <aside class="control-sidebar control-sidebar-dark">
                    <!-- Control sidebar content goes here -->
                </aside>
                <!-- /.control-sidebar -->
            </div>
            <!-- ./wrapper -->

            <!-- jQuery -->
            <script src="../../plugins/jquery/jquery.min.js"></script>
            <!-- jQuery UI 1.11.4 -->
            <script src="../../plugins/jquery-ui/jquery-ui.min.js"></script>
            <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
            <script>
                $.widget.bridge('uibutton', $.ui.button)
            </script>
            <!-- Bootstrap 4 -->
            <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- ChartJS -->
            <script src="../../plugins/chart.js/Chart.min.js"></script>
            <!-- Sparkline -->
            <script src="../../plugins/sparklines/sparkline.js"></script>
            <!-- JQVMap -->
            <script src="../../plugins/jqvmap/jquery.vmap.min.js"></script>
            <script src="../../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
            <!-- jQuery Knob Chart -->
            <script src="../../plugins/jquery-knob/jquery.knob.min.js"></script>
            <!-- daterangepicker -->
            <script src="../../plugins/moment/moment.min.js"></script>
            <script src="../../plugins/daterangepicker/daterangepicker.js"></script>
            <!-- Tempusdominus Bootstrap 4 -->
            <script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
            <!-- Summernote -->
            <script src="../../plugins/summernote/summernote-bs4.min.js"></script>
            <!-- overlayScrollbars -->
            <script src="../../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
            <!-- AdminLTE App -->
            <script src="../../dist/js/adminlte.js"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="../../dist/js/demo.js"></script>
            <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
            <script src="../../dist/js/pages/dashboard.js"></script>

            <script src="../../js/main.js"></script>
            <script src="https://kit.fontawesome.com/bac7f444fd.js" crossorigin="anonymous"></script>
        </div>
    </form>
</body>
</html>