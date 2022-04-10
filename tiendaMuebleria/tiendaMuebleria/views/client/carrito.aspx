<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="tiendaMuebleria.carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="../../css/carrito.css">

    <title>Carrito - Tienda en Linea</title>

    <script src="https://kit.fontawesome.com/27018fa2cd.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>

</head>
<body>
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

                    <div class="col-md-6 mt-4">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="mb-4">Detalle Compra</h2>
                                <p>Tienes <span class="fw-bold text-decoration-underline">1 articulo(s)</span> en el carrito de compras</p>
                                <p class="fw-bold">Referencia de compra: 26-05-2001</p>
                                <div class="productos-agregados mt-5 table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Nombre Artículo</th>
                                                <th scope="col">Precio</th>
                                                <th scope="col">Cantidad</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Escritorio</td>
                                                <td>Q50</td>
                                                <td>1</td>
                                                <td>
                                                    <asp:Button ID="eliminarArticulo" runat="server"
                                                        Text="Borrar" class="btn btn-outline-danger" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-6 mt-4">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="mb-4">Tipo de Pago</h2>

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
                                <!-- fin tipo de tarjetas -->

                                <label for="exampleFormControlInput1" class="form-label">
                                    Nombre del Titular
                             <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span></label>
                                <input type="text" class="form-control" id="nombreTitular" name="nombretitular"
                                    placeholder="Ej: DAVID ORTEGA" onkeyup="this.value = this.value.toUpperCase();">

                                <label for="exampleFormControlInput1" class="form-label">
                                    Número de Tarjeta 
                            <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span>
                                </label>
                                <input type="number" class="form-control" id="numeroTarjeta" name="numerotarjeta"
                                    placeholder="Ej: 4444555566668888" minlength="1" maxlength="16"
                                    oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                    required>

                                <div class="row">
                                    <label for="exampleFormControlInput1" class="form-label">
                                        Fecha de Vencimiento 
                                <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="number" class="form-control" id="fechaVencimiento" placeholder="Mes" 
                                            minlength="1" maxlength="2"
                                            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                            required>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="number" class="form-control" id="fechaVencimiento" placeholder="Año" minlength="4" maxlength="4"
                                            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                            required>
                                    </div>
                                </div>

                                <label for="exampleFormControlInput1" class="form-label">
                                    CVV (Dígitos de la parte
                            trasera) <span style="color: rgb(255, 0, 0); font-size: 20px;">*</span></label>
                                <input type="number" class="form-control" id="cvv" placeholder="EJ: 085" minlength="1"
                                    maxlength="3"
                                    oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                    required>

                                <hr>

                                <!-- total a pagar por los productos adquiridos -->
                                <div class="row">
                                    <div class="col">
                                        <p>Total a pagar</p>
                                    </div>
                                    <div class="col">
                                        <p>Q8888</p>
                                    </div>
                                </div>
                                <!-- fin total a pagar -->

                                <div id="alerta">
                                    <!-- alerta que indica que no está y si está lleno -->
                                </div>
                                <a class="btn btn-success" onclick="finalizarVenta()">Continua con Envio</a>

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
                                        <label for="recipient-name" class="col-form-label">Tipo de Documento</label>
                                        <select id="tipoDocumento" class="form-select" aria-label="Default select example" required>
                                            <option selected="selected">Seleccione...</option>
                                            <option value="1">DPI</option>
                                            <option value="2">NIT</option>
                                            <option value="3">Pasaporte</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Número de Documento</label>                                     
                                        <asp:TextBox ID="numeroDocumento" runat="server" type="number" class="form-control" placeholder="1515489699999" maxlength="13"
                                            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                            required ></asp:TextBox>
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
                                            <asp:TextBox ID="telefonoResidencia" runat="server" type="number" class="form-control" placeholder="66314589" maxlength="8"
                                                oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                required ></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="message-text" class="col-form-label">
                                                Teléfono
                                        Celular</label>
                                            <asp:TextBox ID="telefonoCelular" runat="server" type="number" class="form-control" placeholder="45858787" maxlength="8"
                                                oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                required    ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">País</label>
                                        <select id="pais" class="form-select" aria-label="Default select example" required>
                                            <option selected="selected">Seleccione...</option>
                                            <option value="1">Guatemala</option>
                                            <option value="2">El Salvador</option>
                                            <option value="3">México</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Departamento / Estado</label>
                                        <select id="departamentoEstado" class="form-select" aria-label="Default select example" required>
                                            <option selected="selected">Seleccione...</option>
                                            <option value="1">Guatemala</option>
                                            <option value="2">Escuintla</option>
                                            <option value="3">Retalhuleo</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">
                                            Ciudad de
                                    Residencia</label>
                                        <select id="ciudadResidencia" class="form-select" aria-label="Default select example" required>
                                            <option selected="selected">Seleccione...</option>
                                            <option value="1">Ciudad de Guatemala</option>
                                            <option value="2">San José Pinula</option>
                                            <option value="3">San Miguel Petapa</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="message-text" class="col-form-label">Dirección</label>
                                        <asp:TextBox ID="direccion" runat="server" type="text" 
                                            class="form-control" placeholder="7ma Calle, Colonia Pinares"
                                            required="required"></asp:TextBox>
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
                                        <asp:Button ID="cancelarEnvio" runat="server" Text="Cancelar" class="btn btn-danger" data-bs-dismiss="modal"/>
                                        <asp:Button ID="procesarPago" runat="server" Text="Pagar" class="btn btn-success"/>
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
