<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="cliente.aspx.cs" Inherits="tiendaMuebleria.cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>

    <link rel="stylesheet" href="../../css/estilos.css" />

    <title>Muebleria los Alpes - Tienda en Linea</title>

    <script src="https://kit.fontawesome.com/27018fa2cd.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">

            <!-- contenedor principal con información relevante -->
            <main class="text-principal">
                <div class="container-fluid container-principal bg-gris text-center">
                    <h1>Compra en línea</h1>
                    <p>Mueblería Los Alpes</p>
                    <p>¡Todo lo que necesita tu hogar, a un click! <i class="fa-solid fa-arrow-pointer"></i></p>
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
                            <a href="carrito.aspx" class="btn btn-light"><i class="fa-solid fa-cart-shopping"></i></a>
                            <span class="input-group-text me-2" id="basic-addon2"><asp:Label ID="noProductosCarrito" runat="server" Text=""></asp:Label></span>
                        </div>
                        <a href="../ingreso.aspx" class="btn btn-success">Login</a>
                    </div>
                </nav>
            </header>
            <!-- fin menu -->


        <!-- seccion de productos -->
        <section class="productos">
            <h2 class="fw-bold text-decoration-underline">Nuestros Productos</h2>
            <br />
            <div class="row mt-4">
                <asp:DataList ID="stockProductos" runat="server">
                    <ItemTemplate>
                        <div class="card mb-6" style="max-width: 1400px">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img
                                        src="../../img/sillon.jpg"
                                        class="img-fluid rounded-start"
                                        alt="producto" />
                                </div>
                                <div class="col-lg-7 m-4 d-flex justify-content-center">
                                    <div class="card-body">
                                        <!-- EL ID DEL PRODUCTO ESTÁ OCULTO, SOLO SE USARÁ PARA AGREGAR AL CARRITO -->
                                        <asp:Label ID="PRO_IDLabel" runat="server" Text='<%# Eval("PRO_ID") %>'></asp:Label>
                                        <br /><br />
                                        <asp:Label ID="PRO_NOMBRELabel" class="card-title" runat="server" Text='<%# Eval("PRO_NOMBRE") %>' Font-Bold="true" Font-Size="Large" Visible="True" />
                                        <br /><br />
                                        <asp:Label ID="PRO_PRECIOLabel" class="card-text" runat="server" Text='<%# Eval("PRO_PRECIO") %>' Font-Size="Large" />                                        
                                        <br />
                                        <br />
                                        <div class="input-group">                                            
                                          <asp:Button ID="masInformacion" runat="server" Text="Más Información" class="btn btn-dark m-2" OnClick="masInformacion_Click"/>
                                          <asp:TextBox ID="cantidadComprar" runat="server" type="number" class="form-control m-2" placeholder="Cantidad a Comprar" Text=""></asp:TextBox>
                                          <asp:Button ID="agregarCarrito" runat="server" Text="Agregar al Carrito" class="btn btn-success m-2" OnClick="agregarCarrito_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </section>
            <!-- fin sección de productos -->


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
