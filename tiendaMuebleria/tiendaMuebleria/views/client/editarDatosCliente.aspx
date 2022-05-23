<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editarDatosCliente.aspx.cs" Inherits="tiendaMuebleria.views.client.editarDatosCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <link rel="stylesheet" href="../../css/estilos.css" />

    <title>Muebleria los Alpes - Tienda en Linea</title>

    <script src="https://kit.fontawesome.com/bac7f444fd.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">

        <!-- contenedor principal con información relevante -->
        <main class="text-principal">
            <div class="container-fluid container-principal bg-gris text-center">
                <h1>Edita tus Datos</h1>
                <p>Mueblería Los Alpes</p>
                <p>¡Mantén actualizado tus datos! <i class="fa-solid fa-arrow-pointer"></i></p>
            </div>
        </main>
        <!-- fin contenedor principal -->


        <!-- menu de navegacion -->
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
                    </div>
                    <div class="input-group">
                        <a href="cliente.aspx" class="btn btn-danger m-1">Continuar Comprando</a>
                        <a href="../ingreso.aspx" class="btn btn-secondary m-1">Ingresar</a>
                    </div>
                </div>
            </nav>
        </header>
        <!-- fin menu -->

        <section class="productos">
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h2 class="m-0 pl-5 mt-2 fw-bold text-decoration-underline">Datos del Cliente</h2>
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
                                        <div class="mb-3">
                                            <label for="message-text" class="col-form-label">Número de Documento (*)</label>
                                            <asp:TextBox ID="numeroDoc" runat="server" type="text"
                                                class="form-control" placeholder="3050000040115"></asp:TextBox>
                                        </div>

                                        <div class="mb-3">
                                            <asp:Button ID="buscarCliente" runat="server" Text="Buscar Cliente" class="btn btn-dark" OnClick="buscarCliente_Click" />
                                        </div>
                                        <div class="row" id="panel_info" runat="server">
                                            <div class="col-lg-12 mt-4">
                                                <div class="card bg-light">

                                                    <div class="card-body">
                                                        <div class="row">                                                           
                                                            
                                                            <div class="col-md-12 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Nombre completo del cliente (*)</label>

                                                                <asp:TextBox ID="nombreCompletoCliente" runat="server" type="text" class="form-control" name="nombreCliente"
                                                                    placeholder="Juan Antonio Gutierrez Morales"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-6 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Teléfono de residencia (*)</label>
                                                                <asp:TextBox ID="telefonoResidencia" runat="server" type="number" class="form-control" name="telefonoRes"
                                                                    placeholder="6631 8787"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-6 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Teléfono celular</label>
                                                                <asp:TextBox ID="telefonoCelular" runat="server" type="number" class="form-control" name="telefonoCelu"
                                                                    placeholder="4689 5521"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-6 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">País (*)</label>
                                                                <select id="pais" class="form-control" runat="server" aria-label="Default select example" name="pais">
                                                                    <option>Selecciona una opción...</option>
                                                                    <option value="Guatemala">Guatemala</option>
                                                                    <option value="Mexico">México</option>
                                                                    <option value="El Salvador">El Salvador</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-6 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Departamento / Estado (*)</label>

                                                                <asp:TextBox ID="departamentoEstado" runat="server" type="text" class="form-control"
                                                                    placeholder="Ciudad de Guatemala" name="departamentoEstado"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-12 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Ciudad de residencia (*)</label>

                                                                <asp:TextBox ID="ciudadResidencia" runat="server" type="text" class="form-control"
                                                                    placeholder="Ciudad de Guatemala" name="ciudadResidencia"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-12 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Dirección (*)</label>

                                                                <asp:TextBox ID="direccion" runat="server" type="text" class="form-control"
                                                                    placeholder="7 avenida 6-85 Calle Real" name="direccion"></asp:TextBox>
                                                            </div>
                                                            <div class="col-md-6 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Profesión</label>

                                                                <asp:TextBox ID="profesion" runat="server" type="text" class="form-control" name="profesion"
                                                                    placeholder="Programador" />
                                                            </div>
                                                            <div class="col-md-6 mt-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Email (*)</label>

                                                                <asp:TextBox ID="email" runat="server" type="email" class="form-control" name="email"
                                                                    placeholder="nombre@ejemplo.com" />
                                                            </div>                                                            

                                                            <div class="col-md-6 mt-3">
                                                                <asp:Button ID="editarCliente" runat="server" Text="Editar" class="btn btn-warning" OnClick="editarCliente_Click"/>
                                                                <a href="clientes.aspx" class="btn btn-dark">Limpiar</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <!-- /.content -->
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
                    <strong>Copyright &copy; Muebleria Los Alpes</strong>
                    All rights reserved.
                </p>
            </div>
        </footer>
        <!-- fin pie de pagina -->


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
    </form>
</body>
</html>
