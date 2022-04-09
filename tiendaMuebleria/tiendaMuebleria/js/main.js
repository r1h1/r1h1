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
    if (visa || mastercard || paypal) {
        if (nombreTitular == "") {
            var element = document.getElementById("alerta");
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Llena el nombre del titular de la tarjeta.',
                showConfirmButton: false,
                timer: 1600
            })
            document.getElementById("nombreTitular").focus();
        } else if (numeroTarjeta == "") {
            var element = document.getElementById("alerta");
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Llena el número de la tarjeta.',
                showConfirmButton: false,
                timer: 1600
            })
            document.getElementById("numeroTarjeta").focus();
        } else if (fechaVencimiento == "") {
            var element = document.getElementById("alerta");
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Llena la fecha de vencimiento de la tarjeta.',
                showConfirmButton: false,
                timer: 1600
            })
            document.getElementById("fechaVencimiento").focus();
        } else if (cvv == "") {
            var element = document.getElementById("alerta");
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Llena el CVV de la tarjeta.',
                showConfirmButton: false,
                timer: 1600
            })
            document.getElementById("cvv").focus();
        } else {
            var element = document.getElementById("alerta");
            let timerInterval
            Swal.fire({
                title: 'Procesando pago',
                html: 'Ten paciencia, estamos validando tus datos.',
                timer: 5000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading()
                    const b = Swal.getHtmlContainer().querySelector('b')
                    timerInterval = setInterval(() => {
                        b.textContent = Swal.getTimerLeft()
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval);
                    Swal.fire({
                        icon: 'success',
                        title: 'Datos validados correctamente',
                        text: '¡Gracias por tu compra!',
                        showConfirmButton: false,
                        timer: 3000
                    })

                    function mostrarRegistroCliente() {
                        element.innerHTML = "<div role='alert' class='alert alert-warning' style='background-color: #198754; color: #fff;'><p>Datos validados y llenados correctamente.</p></div>";
                        $("#datosCliente").modal("show");
                    }

                    setTimeout(mostrarRegistroCliente, 3200);
                }
            }).then((result) => {
                /* Read more about handling dismissals below */
                if (result.dismiss === Swal.DismissReason.timer) {
                    console.log('I was closed by the timer')
                }
            })
        }
    } else {
        var element = document.getElementById("alerta");
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Método de pago no seleccionado.',
            showConfirmButton: false,
            timer: 1800
        })
    }
}