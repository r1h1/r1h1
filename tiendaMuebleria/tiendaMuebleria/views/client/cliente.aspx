<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cliente.aspx.cs" Inherits="tiendaMuebleria.cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="../../css/estilos.css" />

    <title>Muebleria los Alpes - Tienda en Linea</title>

    <script src="https://kit.fontawesome.com/27018fa2cd.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

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
                            <form class="d-flex">
                                <div class="input-group">
                                    <a href="carrito.aspx" class="btn btn-light"><i class="fa-solid fa-cart-shopping"></i></a>
                                    <span class="input-group-text me-2" id="basic-addon2">3</span>
                                </div>
                                <a href="../ingreso.aspx" class="btn btn-success">Ingresar</a>
                            </form>
                        </div>
                    </div>
                </nav>
            </header>
            <!-- fin menu -->


            <!-- seccion de productos -->
            <section class="productos">                
                    <asp:Label ID="cantidadProductos" runat="server" Text="" Style="color: white;"></asp:Label>
                    <% 
                        int i = 0;
                        int rep = Convert.ToInt32(cantidadProductos.Text.Trim());
                        for (i = 1; i < rep; i++)
                        {
                    %>
                    <% Response.Write("<br>" + i.ToString());%>
                    <% 
                        }
                    %>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="jumbotron" style="background-color: white">
                                    <table class="table table-responsive">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <h1>Lista de Productos</h1>
                                                    <asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton1" Width="120" Height="120" runat="server" ImageUrl="~/Imagenes/carro-de-compras.jpg"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                    <asp:DataList ID="DataList1" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" Width="140" Height="120" runat="server"/>
                                                            <br />
                                                            <br />
                                                            Código :
                                   
                                                            <asp:Label ID="codproductoLabel" runat="server" Text='codprod' />
                                                            <br />
                                                            Producto :
                                   
                                                            <asp:Label ID="desproductoLabel" runat="server" Text='des' />
                                                            <br />
                                                            Categoria :
                                   
                                                            <asp:Label ID="codcategoriaLabel" runat="server" Text='categoria' />
                                                            <br />
                                                            Precio :
                                   
                                                            <asp:Label ID="preproductoLabel" runat="server" Text='preprod' />
                                                            <br />
                                                            Cantidad :
                                   
                                                            <asp:Label ID="canproductoLabel" runat="server" Text='cantidad' />
                                                            <br />
                                                            <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Agregar al Carrito" />
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
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
        </div>
    </form>
</body>
</html>
