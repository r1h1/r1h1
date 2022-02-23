function finalizarVenta() {

    //TIPO DE TARJETAS DE PAGO
    var visa = document.getElementById("visa").checked;
    var mastercard = document.getElementById("mastercard").checked;
    var paypal = document.getElementById("paypal").checked;

    //VALORES DEL FORMULARIO DE TARJETAS
    var nombreTitular = document.getElementById("nombreTitular").value;
    var numeroTarjeta = document.getElementById("numeroTarjeta").value;
    var fechaVencimiento = document.getElementById("fechaVencimiento").value;
    var cvv = document.getElementById("cvv").value;

    //VALIDAR QUE ESTÉ SELECCIONADO EL METODO DE PAGO
    if(visa || mastercard || paypal){
        if (nombreTitular == "") {
            var element = document.getElementById("alerta");
            element.innerHTML = "<div role='alert' class='alert alert-warning' style='background-color: #F8D7DA;'><p>Llena el nombre del titular de la tarjeta.</p></div>";
        } else if (numeroTarjeta == "") {
            var element = document.getElementById("alerta");
            element.innerHTML = "<div role='alert' class='alert alert-warning' style='background-color: #F8D7DA;'><p>Llena el número de tarjeta.</p></div>";
        } else if (fechaVencimiento == "") {
            var element = document.getElementById("alerta");
            element.innerHTML = "<div role='alert' class='alert alert-warning' style='background-color: #F8D7DA;'><p>Llena la fecha de vencimiento.</p></div>";
        } else if (cvv == "") {
            var element = document.getElementById("alerta");
            element.innerHTML = "<div role='alert' class='alert alert-warning' style='background-color: #F8D7DA;'><p>Llena el CVV.</p></div>";
        } else {
            var element = document.getElementById("alerta");
            element.innerHTML = "<div role='alert' class='alert alert-warning' style='background-color: #198754; color: #fff;'><p>Datos validados y llenados correctamente.</p></div>";
            $("#datosCliente").modal("show");
        }
    }
    else{
        var element = document.getElementById("alerta");
        element.innerHTML = "<div role='alert' class='alert alert-warning' style='background-color: #F8D7DA;'><p>Selecciona una tarjeta o PayPal.</p></div>";
    }
}