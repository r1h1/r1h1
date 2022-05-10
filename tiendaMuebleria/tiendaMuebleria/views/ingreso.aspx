<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ingreso.aspx.cs" Inherits="tiendaMuebleria.ingreso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>

    <link rel="stylesheet" href="../css/login.css"/>
    <script src="https://kit.fontawesome.com/bac7f444fd.js" crossorigin="anonymous"></script>

    <title>Bienvenido - MLA</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- contenedor flexible para login -->
            <div class="d-lg-flex half justify-content-center principal">
                <div class="bg order-1 order-md-2"></div>
                <div class="contents order-2 order-md-1">

                    <!-- contenedor principal -->
                    <div class="container">
                        <div class="card bg-white">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-md-12">

                                        <div class="mb-lg-4 texto-bienvenida">
                                            <h1>Ingreso al Sistema</h1>
                                            <p class="mb-4">Bienvenido, inicia sesión para continuar.</p>
                                        </div>

                                        <!-- formualrio de validación -->
                                        <div class="formulario-ingreso">
                                            <div class="form-group first">
                                                <label for="username">Correo Electrónico</label>
                                                <asp:TextBox ID="correoElectronico" runat="server" type="text" class="form-control" placeholder="ejemplo@gmail.com"></asp:TextBox>
                                            </div>

                                            <br/>

                                            <div class="form-group last mb-3">
                                                <label for="password">Numero de Documento (Sin espacios)</label>
                                                <asp:TextBox ID="numeroDocumento" runat="server" type="number" class="form-control" placeholder="1212458969568"></asp:TextBox>
                                            </div>

                                            <br/>

                                            <div>
                                                <!-- <asp:Button ID="ingresar" runat="server" Text="Ingresar" href="dashboard.aspx" class="btn btn-success" /> -->
                                                <asp:Button ID="ingresarSistema" runat="server" Text="Ingresar" class="btn btn-success" OnClick="ingresarSistema_Click"/>
                                                <a href="../index.aspx" class="btn btn-danger" >Regresar</a>
                                            </div>

                                        </div>
                                        <!-- fin de formulario de validación -->

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- fin contenedor flexible -->


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
            </script>
        </div>
    </form>
</body>
</html>
