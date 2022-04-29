<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productos.aspx.cs" Inherits="tiendaMuebleria.productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Muebleria - Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- JQVMap -->
    <link rel="stylesheet" href="../../plugins/jqvmap/jqvmap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css" />
    <!-- summernote -->
    <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css" />
    <script src="https://kit.fontawesome.com/27018fa2cd.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
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
                                    <asp:Button ID="cerrarSesion" runat="server" Text="Cerrar Sesión" class="nav-link btn btn-danger text-black" OnClick="cerrarSesion_Click"/>                                
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
                                    <h1 class="m-0 pl-5 mt-4">Productos</h1>
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
                                             <div class="col-md-4 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Código Producto (Editar y Borrar)</label>
                                                <asp:TextBox ID="idproducto" runat="server" type="text" class="form-control"  
                                                    placeholder="** EDITAR Y BORRAR **"></asp:TextBox>
                                            </div>
                                            <div class="col-md-8 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Nombre (*)</label>
                                                <asp:TextBox ID="nombre" runat="server" type="text" class="form-control"  
                                                    placeholder="Mesa para 6"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Descripción</label>
                                                <asp:TextBox ID="descripcion" runat="server" type="text" class="form-control"  
                                                    placeholder="Mueble para sala"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Tipo (*)</label>
                                                <select id="tipoDeMueble" runat="server" class="form-control" aria-label="Default select example">
                                                    <option>Selecciona una opción...</option>
                                                    <option value="Interior">Interior</option>
                                                    <option value="Exterior">Exterior</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Material</label>
                                                <asp:TextBox ID="material" runat="server" type="text" class="form-control"  
                                                    placeholder="Madera de Caoba"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Alto (CM) *</label>
                                                <asp:TextBox ID="altura" runat="server" type="number" step="0.01" class="form-control"  
                                                    placeholder="26"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Ancho (CM) *</label>
                                                <asp:TextBox ID="anchura" runat="server" type="number" step="0.01" class="form-control"  
                                                    placeholder="05"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Profundidad (CM) *</label>
                                                <asp:TextBox ID="profundidad" runat="server" type="number" step="0.01" class="form-control"  
                                                    placeholder="200.62"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Color</label>
                                                <asp:TextBox ID="color" runat="server" type="text" class="form-control"  
                                                    placeholder="Verde"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Peso (Gramos) *</label>
                                                <asp:TextBox ID="peso" runat="server" type="number" step="0.01" class="form-control"  
                                                    placeholder="161.55"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Precio Q (*)</label>
                                                <asp:TextBox ID="precio" runat="server" type="number" step="0.01" class="form-control"  
                                                    placeholder="1250.89"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <label for="exampleFormControlInput1" class="form-label">Cantidad (*)</label>
                                                <asp:TextBox ID="cantidad" runat="server" type="number" class="form-control"  
                                                    placeholder="2"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12 mt-4">
                                                <label for="exampleFormControlInput1" class="form-label">Fotografía del Producto (*)</label>
                                                <input id="fotografia" type="file" runat="server" class="form-control" accept="image/png, image/jpeg"/>
                                            </div>
                                            <div class="col-md-12 mt-4">
                       
                                                <asp:Button ID="agregarProducto" runat="server" Text="Añadir" class="btn btn-success" OnClick="agregarProducto_Click"/>
                                                <asp:Button ID="editarProducto" runat="server" Text="Editar" class="btn btn-dark" OnClick="editarProducto_Click" />
                                                <asp:Button ID="borrarProducto" runat="server" Text="Borrar" class="btn btn-danger" OnClick="borrarProducto_Click" />
                                                <a class="btn btn-info" onclick="abrirBusquedaProductos()">Buscar / Ver</a>
                                                <a href="productos.aspx" class="btn btn-warning">Limpiar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 mt-4">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <h5 class="card-title">Producos Registrados</h5>
                                        <div class="table-responsive mt-5">
                                            <asp:GridView ID="gridProductos" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                                                BorderStyle="None" BorderWidth="1px" CellPadding="10" CellSpacing="10" ForeColor="Black" 
                                                GridLines="Horizontal" ShowHeaderWhenEmpty="True">
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                <SortedDescendingHeaderStyle BackColor="#242121" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="formulario-registro-cliente">
                    <div class="modal" id="busquedaDatosProductos">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title text-muted" id="exampleModalLabel">Búsqueda de Productos</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="formulario-carrito">

                                        <div class="mb-3">
                                            <label for="message-text" class="col-form-label">Dato a buscar (*)</label>
                                            <asp:TextBox ID="datoBusqueda" runat="server" type="text"
                                                class="form-control" placeholder="Mesa de Caoba"></asp:TextBox>
                                        </div>

                                        <div class="mb-3">
                                            <asp:Button ID="buscarDatoModal" runat="server" Text="Buscar Dato" class="btn btn-dark" OnClick="buscarProducto_Click"/>
                                        </div>

                                        <div class="mb-3">
                                            <div class="table-responsive mt-5">
                                                <asp:GridView ID="gridBusquedaP" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Horizontal" ShowHeaderWhenEmpty="True">
                                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                                </asp:GridView>
                                            </div>
                                        </div>


                                        <div class="modal-footer">
                                            <asp:Button ID="cancel" runat="server" Text="Salir" class="btn btn-danger" data-bs-dismiss="modal" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- fin modal info clientes -->
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

        <!-- javascript de bootstrap 5  -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>

        <!-- script para validaciones -->
        <script src="../../js/main.js"></script>
        </div>
    </form>
</body>
</html>
