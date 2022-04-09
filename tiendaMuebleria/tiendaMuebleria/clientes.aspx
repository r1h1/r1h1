<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="tiendaMuebleria.clientes" %>

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
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
    <script src="https://kit.fontawesome.com/27018fa2cd.js" crossorigin="anonymous"></script>
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
                                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
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
                                <li class="nav-item">
                                    <a href="index.aspx" class="nav-link btn btn-danger">
                                        <i class="nav-icon fa-solid fa-right-from-bracket"></i>
                                        <p>Cerrar Sesión</p>
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
                                <div class="col-sm-6">
                                    <h1 class="m-0 pl-5 mt-4">Clientes</h1>
                                    </p>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- /.content-header -->

                    <!-- Main content -->
                    <section class="content container mb-4">
                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card bg-light">

                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Tipo de Documento (*)</label>
                                                <select class="form-control" aria-label="Default select example" name="tipoDoc">
                                                    <option selected>Selecciona una opción...</option>
                                                    <option value="1">One</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Número de documento (*)</label>
                                                <input type="number" class="form-control" id="exampleFormControlInput1" name="numDoc"
                                                    placeholder="3054 4444 87559">
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Nombre completo del cliente (*)</label>
                                                <input type="text" class="form-control" id="exampleFormControlInput1" name="nombreCliente"
                                                    placeholder="Juan Antonio Gutierrez Morales">
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Teléfono de residencia (*)</label>
                                                <input type="number" class="form-control" id="exampleFormControlInput1" name="telefonoRes"
                                                    placeholder="6631 8787">
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Teléfono celular</label>
                                                <input type="number" class="form-control" id="exampleFormControlInput1" name="telefonoCelu"
                                                    placeholder="4689 5521">
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">País (*)</label>
                                                <select class="form-control" aria-label="Default select example" name="pais">
                                                    <option selected>Selecciona una opción...</option>
                                                    <option value="1">One</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Departamento / Estado (*)</label>
                                                <select class="form-control" aria-label="Default select example" name="depto">
                                                    <option selected>Selecciona una opción...</option>
                                                    <option value="1">One</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </select>
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Ciudad de residencia (*)</label>
                                                <select class="form-control" aria-label="Default select example" name="ciudad">
                                                    <option selected>Selecciona una opción...</option>
                                                    <option value="1">One</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </select>
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Dirección (*)</label>
                                                <input type="text" class="form-control" id="exampleFormControlInput1"
                                                    placeholder="7 avenida 6-85 Calle Real" name="direccion">
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Profesión</label>
                                                <input type="text" class="form-control" id="exampleFormControlInput1" name="profesion"
                                                    placeholder="Programador">
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Email (*)</label>
                                                <input type="email" class="form-control" id="exampleFormControlInput1" name="email"
                                                    placeholder="nombre@ejemplo.com">
                                            </div>
                                            <div class="col-md-12 mt-4">
                                                <a href="#" class="btn btn-success">Agregar</a>
                                                <a href="clientes.aspx" class="btn btn-danger">Limpiar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 mt-4">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <h5 class="card-title">Clientes Registrados</h5>
                                        <div class="table-responsive mt-5">
                                            <table class="table">
                                                <thead class="table-dark">
                                                    <tr>
                                                        <th scope="col">Tipo Documento</th>
                                                        <th scope="col">No. Documento</th>
                                                        <th scope="col">Nombre</th>
                                                        <th scope="col">Teléfono Residencia</th>
                                                        <th scope="col">Teléfono Celular</th>
                                                        <th scope="col">País</th>
                                                        <th scope="col">Depto / Estado</th>
                                                        <th scope="col">Ciudad</th>
                                                        <th scope="col">Dirección</th>
                                                        <th scope="col">Profesión</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col"></th>
                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>DPI</td>
                                                        <td>3045888878887</td>
                                                        <td>Daniel Rivas</td>
                                                        <td>66314898</td>
                                                        <td>45787878</td>
                                                        <td>Guatemala</td>
                                                        <td>Guatemala</td>
                                                        <td>San Miguel Petapa</td>
                                                        <td>7ma Calle 1-52, Colonia Israel, Zona 9</td>
                                                        <td>Programador y QA</td>
                                                        <td>danielrivas1.gt@gmail.com</td>
                                                        <td><a href="#" class="btn btn-danger">Borrar</a></td>
                                                        <td><a href="#" class="btn btn-warning">Editar</a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
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
            <script src="plugins/jquery/jquery.min.js"></script>
            <!-- jQuery UI 1.11.4 -->
            <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
            <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
            <script>
                $.widget.bridge('uibutton', $.ui.button)
            </script>
            <!-- Bootstrap 4 -->
            <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- ChartJS -->
            <script src="plugins/chart.js/Chart.min.js"></script>
            <!-- Sparkline -->
            <script src="plugins/sparklines/sparkline.js"></script>
            <!-- JQVMap -->
            <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
            <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
            <!-- jQuery Knob Chart -->
            <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
            <!-- daterangepicker -->
            <script src="plugins/moment/moment.min.js"></script>
            <script src="plugins/daterangepicker/daterangepicker.js"></script>
            <!-- Tempusdominus Bootstrap 4 -->
            <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
            <!-- Summernote -->
            <script src="plugins/summernote/summernote-bs4.min.js"></script>
            <!-- overlayScrollbars -->
            <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
            <!-- AdminLTE App -->
            <script src="dist/js/adminlte.js"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="dist/js/demo.js"></script>
            <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
            <script src="dist/js/pages/dashboard.js"></script>

            <script src="js/main.js"></script>
        </div>
    </form>
</body>
</html>
