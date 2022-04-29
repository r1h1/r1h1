<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="descripcionProducto.aspx.cs" Inherits="tiendaMuebleria.descripcionProducto" %>

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

    <link rel="stylesheet" href="../../css/estilos.css" />

    <title>Muebleria los Alpes - Tienda en Linea</title>

    <script
        src="https://kit.fontawesome.com/27018fa2cd.js"
        crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- contenedor principal con información relevante -->
            <main class="text-principal">
                <div class="container-fluid container-principal bg-gris text-center">
                    <h1>Detalle del Producto</h1>
                    <p>Mueblería Los Alpes</p>
                </div>
            </main>
            <!-- fin contenedor principal -->

            <!-- menu de navegación -->
            <header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <div class="container-fluid">
                        <button
                            class="navbar-toggler"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <!-- nothing -->
                            </ul>
                            <form class="d-flex">
                                <a href="cliente.aspx" class="btn btn-danger me-2">Continuar Comprando</a>
                                <a href="../ingreso.aspx" class="btn btn-success">Ingresar</a>
                            </form>
                        </div>
                    </div>
                </nav>
            </header>

            <!-- SE TOMA EL ID DEL PRODUCTO PARA FILTRAR -->
            <asp:TextBox ID="idProducto" runat="server" type="hidden" disabled></asp:TextBox>


            <section class="productos">
                <div class="card mb-6" style="max-width: 1400px">
                    <div class="row g-0">
                        <asp:DataList ID="detalleProducto" runat="server">
                            <ItemTemplate>
                                <div class="card mb-6" style="max-width: 1400px">
                                    <div class="row g-0">
                                        <div class="col-md-4">
                                            <asp:Image ID="imgProducto" runat="server" src='<%# Eval("PRO_RUTA_IMAGEN") %>' class="img-fluid rounded-start"/>
                                        </div>
                                        <div class="col-md-6 m-4">
                                            <div class="card-body">
                                                <asp:Label ID="nombreProducto" runat="server" Text='<%# Eval("PRO_NOMBRE") %>' class="card-title" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="descProducto" runat="server" Text='<%# Eval("PRO_DESCRIPCION") %>' class="card-title"></asp:Label>
                                                <br />
                                                <br />
                                                Q <asp:Label ID="precioProducto" runat="server" Text='<%# Eval("PRO_PRECIO") %>' class="card-title" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
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
