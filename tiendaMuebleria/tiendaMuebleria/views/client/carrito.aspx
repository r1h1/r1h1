<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="tiendaMuebleria.carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <link rel="stylesheet" href="../../css/carrito.css" />

    <title>Muebleria los Alpes - Carrito</title>

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 2px;
        }

        body {
            overflow-x: hidden;
        }
    </style>
    <form id="form1" runat="server">
        <div>
            <!-- contenedor principal con información relevante -->
            <main class="text-principal">
                <div class="container-fluid container-principal bg-gris text-center">
                    <h1>Productos Agregados</h1>
                    <p>Mueblería Los Alpes</p>
                    <p>¡Verifica lo que quieres comprar!</p>
                </div>
            </main>
            <!-- fin contenedor principal -->

            <!-- menu de navegación -->
            <header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <!-- nothing -->
                            </ul>
                            <form class="d-flex">
                                <a href="cliente.aspx" class="btn btn-danger me-2">Seguir Comprando</a>
                                <a href="../ingreso.aspx" class="btn btn-success">Ingresar</a>
                            </form>
                        </div>
                    </div>
                </nav>
            </header>

            <!-- seccion de productos -->
            <section class="principal">

                <div class="row">

                    <div class="col-md-6 mt-4 mb-4">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h2 class="mb-4">Detalle Compra</h2>
                                    <p>
                                        Tienes
                                        <asp:Label ID="cantProdCar" runat="server" class="fw-bold text-decoration-underline"></asp:Label>
                                        en el carrito de compras
                                    </p>

                                    <p class="fw-bold">Referencia de compra: </p>

                                    <div class="col-md-12 mt-4">
                                        <div class="input-group">
                                            <asp:TextBox ID="codigoBorrar" runat="server" type="number" class="form-control m-1" name="codigoBorrar"
                                                placeholder="COD" />
                                            <asp:Button ID="borrarCod" runat="server" Text="Borrar" class="btn btn-dark m-1" OnClick="borrarCod_Click" />
                                            <asp:Button ID="borrarTodo" runat="server" Text="Borrar Todo" class="btn btn-danger m-1" OnClick="borrarTodo_Click" />
                                        </div>

                                    </div>

                                    <div class="table-responsive mt-3">
                                        <asp:GridView ID="productosEnCarrito" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" ShowHeaderWhenEmpty="True" CellPadding="4" Width="725px">
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

                    <div class="col-md-6 mt-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="mb-4">Tipo de Pago</h2>
                                <br />

                                <!-- tipos de tarjetas para pago -->
                                <div class="row row-cols-auto">
                                    <div class="col">
                                        <div>
                                            <asp:CheckBox ID="visa" runat="server" value="" />
                                            <label class="form-check-label" for="flexCheckDefault">
                                                <p><i class="fa-brands fa-cc-visa fa-3x"></i></p>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div>
                                            <asp:CheckBox ID="mastercard" runat="server" value="" />
                                            <label class="form-check-label" for="flexCheckDefault">
                                                <p><i class="fa-brands fa-cc-mastercard fa-3x"></i></p>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div>
                                            <asp:CheckBox ID="paypal" runat="server" value="" />
                                            <label class="form-check-label" for="flexCheckDefault">
                                                <p><i class="fa-brands fa-cc-paypal fa-3x"></i></p>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <!-- fin tipo de tarjetas -->

                                <label for="exampleFormControlInput1" class="form-label">
                                    Nombre del Titular
                             <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span></label>
                                <input type="text" class="form-control" id="nombreTitular" name="nombretitular"
                                    placeholder="Ej: DAVID ORTEGA" onkeyup="this.value = this.value.toUpperCase();" />

                                <label for="exampleFormControlInput1" class="form-label">
                                    Número de Tarjeta 
                            <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span>
                                </label>
                                <input type="number" class="form-control" id="numeroTarjeta" name="numerotarjeta"
                                    placeholder="Ej: 4444555566668888" minlength="1" maxlength="16"
                                    oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />

                                <div class="row">
                                    <label for="exampleFormControlInput1" class="form-label">
                                        Fecha de Vencimiento 
                                <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="number" class="form-control" id="fechaVencimiento" placeholder="Mes"
                                            minlength="1" maxlength="2"
                                            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                    </div>
                                    <div class="col-md-6">
                                        <input type="number" class="form-control" id="fechaVencimiento" placeholder="Año" minlength="4" maxlength="4"
                                            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                    </div>
                                </div>

                                <label for="exampleFormControlInput1" class="form-label">
                                    CVV (Dígitos de la parte
                            trasera) <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span></label>
                                <input type="number" class="form-control" id="cvv" placeholder="EJ: 085" minlength="1"
                                    maxlength="3"
                                    oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />

                                <hr />

                                <!-- total a pagar por los productos adquiridos -->
                                <br />
                                <div class="row">
                                    <div class="col">
                                        <p>Total a pagar</p>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="totalAPagar" runat="server" Text="" class="fw-bold"></asp:Label>

                                    </div>
                                </div>
                                <!-- fin total a pagar -->

                                <div id="alerta">
                                    <!-- alerta que indica que no está y si está lleno -->
                                </div>
                                <br />
                                <a class="btn btn-success" onclick="finalizarVenta()">Continuar</a>
                                <a href="cliente.aspx" class="btn btn-danger">Cancelar</a>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- fin sección de productos -->

            <section class="formulario-registro-cliente">
                <!-- modal para registrar los datos del cliente, y si ya existen, se ignoran -->
                <div class="modal" id="datosCliente">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-muted" id="exampleModalLabel">Registro de Cliente</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <!-- formulario para validar el registro del cliente -->
                                <div class="formulario-carrito">

                                    <!-- tipo de documento -->
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Tipo de Documento (*)</label>
                                        <select id="docTipo" name="selectDocTipo" runat="server" class="form-control" aria-label="Default select example">
                                            <option>Selecciona una opción...</option>
                                            <option value="DPI">DPI / CUI</option>
                                            <option value="NIT">NIT</option>
                                            <option value="PASAPORTE">PASAPORTE</option>
                                            <option value="OTRO">OTRO</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Número de Documento</label>
                                        <asp:TextBox ID="numeroDocumento" runat="server" type="number" class="form-control" placeholder="1515489699999" MaxLength="13"
                                            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Nombre Completo</label>
                                        <asp:TextBox ID="nombreCompleto" runat="server" type="text" class="form-control" placeholder="JUAN DAVID MONZÓN TORRES"
                                            onkeyup="this.value = this.value.toUpperCase();"></asp:TextBox>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="message-text" class="col-form-label">
                                                Teléfono de
                                        Residencia</label>
                                            <asp:TextBox ID="telefonoResidencia" runat="server" type="number" class="form-control" placeholder="66314589" MaxLength="8"
                                                oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="message-text" class="col-form-label">
                                                Teléfono
                                        Celular</label>
                                            <asp:TextBox ID="telefonoCelular" runat="server" type="number" class="form-control" placeholder="45858787" MaxLength="8"
                                                oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">País (*)</label>
                                        <select id="pais" class="form-control" runat="server" aria-label="Default select example" name="pais">
                                            <option>Selecciona una opción...</option>
                                            <option value="Guatemala">Guatemala</option>
                                            <option value="Mexico">México</option>
                                            <option value="El Salvador">El Salvador</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Departamento / Estado (*)</label>

                                        <asp:TextBox ID="departamentoEstado" runat="server" type="text" class="form-control"
                                            placeholder="Ciudad de Guatemala" name="departamentoEstado"></asp:TextBox>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Ciudad de residencia (*)</label>

                                        <asp:TextBox ID="ciudadResidencia" runat="server" type="text" class="form-control"
                                            placeholder="Ciudad de Guatemala" name="ciudadResidencia"></asp:TextBox>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Dirección (*)</label>

                                        <asp:TextBox ID="direccion" runat="server" type="text" class="form-control"
                                            placeholder="7 avenida 6-85 Calle Real" name="direccion"></asp:TextBox>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Profesión</label>
                                        <asp:TextBox ID="estudiante" runat="server" type="text"
                                            class="form-control" placeholder="Estudiante"></asp:TextBox>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Correo Electrónico</label>
                                        <asp:TextBox ID="correoElectronico" runat="server" type="email"
                                            class="form-control" placeholder="ejemplo@ejemplo.com"></asp:TextBox>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="cancelarCompra" runat="server" Text="Cancelar Compra" class="btn btn-danger" data-bs-dismiss="modal" />
                                        <asp:Button ID="finalizarCompra" runat="server" Text="Finalizar Compra" class="btn btn-success" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- fin modal info clientes -->
            </section>



            <!-- pie de pagina -->
            <footer class="pie-pagina">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col text-center">
                            <p class="titulo-footer text-center">Formas de pago</p>
                            <i class="fa-brands fa-cc-visa fa-3x"></i>
                            <i class="fa-brands fa-cc-mastercard fa-3x"></i>
                            <i class="fa-brands fa-cc-paypal fa-3x"></i>
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <strong>Copyright &copy; Muebleria Los Alpes</strong>
                        All rights reserved.
                    </p>
                </div>
            </footer>


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
