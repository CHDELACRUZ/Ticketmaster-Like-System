<%-- 
    Document   : museo
    Created on : 5 feb. 2024, 22:44:39
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Museo</title>
        <link rel = "stylesheet" href="cssmuseo/museo.css">
    </head>
    <body>
        <div class="container">
            <center><h2>Compra de boletos - Museo</h2></center>
            <form action="museoServlet" method="post">
                <!-- seleccion del lugar -->
                <label for="lugar">Lugar:</label>
                <select name="lugar" id="lugar">
                    <option value="museolouvre">Museo de Louvre París</option>
                    <option value="museometropolitano">Museo Metropolitano de Nueva York</option>
                    <option value="museovaticano">Museo Vaticano</option>
                    <option value="museoantropologia">Museo Nacional de Antropología, Ciudad de México</option>
                    <option value="museocatalunya">Museo Nacional d'Art de Catalunya</option>
                </select>

                <!-- seleccion de fecha -->
                <label for="fecha">Fecha:</label>
                <input type="date" name="fecha" id="fecha" required>

                <!-- seleccion de hora -->
                <div class="campo-formulario" id="campoHora">
                    <label for="hora">Hora:</label>
                    <select name="hora" id="hora" required>
                        <!-- Horarios predeterminados para Teatro Colón Buenos Aires -->
                        <option value="10am">10:00</option>
                        <option value="2pm">14:00</option>
                        <option value="7pm">19:00</option>
                    </select>
                </div>

                <!-- precio de boleto -->
                <label for="precio">Precio por boleto:</label>
                <input type="text" id="precio" name="precioBoleto" value="50" readonly>

                <!-- capacidad del lugar -->
                <label for="capacidad">Capacidad del lugar:</label>
                <input type="text" id="capacidadLugar" name="capacidadLugar" value="500" readonly>

                <!-- cantidad de boletos a comprar por usuario -->
                <label for="catidadBoletos">Cantidad de boletos (máximo 5):</label>
                <input type="number" name="cantidadBoletos" id="cantidadBoletos" min="1" max="5" required>

                <!-- método de pago  -->
                <label for="metodoPago">Método de pago:</label>
                <select name="metodoPago" id="metodoPago" required>
                    <option value="tarjetaDebito">Tarjeta de débito</option>
                    <option value="tarjetaCredito">Tarjeta de crédito</option>
                    <option value="tarjetaCredito">PayPal</option>
                </select>

                <!-- Detalles del método de pago -->
                <div class="campo-formulario" id="detallesPagoNumeroTarjeta" style="display: none;">
                    <label for="numeroTarjeta">Número de tarjeta:</label>
                    <input type="text" name="numeroTarjeta" id="numeroTarjeta" title="Solo numeros" required>
                </div>

                <div class="campo-formulario" id="detallesPagoNombreTitular" style="display: none;">
                    <label for="nombreTitular">Nombre del titular:</label>
                    <input type="text" name="nombreTitular" id="nombreTitular" title="Solo letras" required>
                </div>

                <input type="submit" value="Comprar">
            </form>
        </div>
        <script>
            document.getElementById('lugar').addEventListener('change', function () {
                var lugarSeleccionado = this.value;
                var campoHora = document.getElementById('campoHora');
                var horaSelect = document.getElementById('hora');

                // Borramos opciones antiguas
                horaSelect.innerHTML = '';

                //Agregar nuevas opciones basadas en el lugar seleccionado
                switch (lugarSeleccionado) {
                    case 'museolouvre':
                        agregarHorarios(['10:00', '14:00', '18:00']);
                        break;
                    case 'museometropolitano':
                        agregarHorarios(['13:00', '16:00', '20:00']);
                        break;
                    case 'museovaticano':
                        agregarHorarios(['11:00', '16:00', '19:00']);
                        break;
                    case 'museoantropologia':
                        agregarHorarios(['09:00', '12:00', '17:00']);
                        break;
                    case 'museocatalunya':
                        agregarHorarios(['08:00', '14:00', '23:00']);
                        break;
                    default:
                        break;
                }

                function agregarHorarios(horarios) {
                    horarios.forEach(function (hora) {
                        var option = document.createElement('option');
                        option.value = hora;
                        option.text = hora;
                        horaSelect.appendChild(option);
                    });
                }
            });
            // Mostrar los detalles del método de pago cuando se selecciona una opción
            document.getElementById('metodoPago').addEventListener('change', function () {
                var detallesPagoNumeroTarjeta = document.getElementById('detallesPagoNumeroTarjeta');
                var detallesPagoNombreTitular = document.getElementById('detallesPagoNombreTitular');

                if (this.value !== 'paypal') {
                    detallesPagoNumeroTarjeta.style.display = 'block';
                    detallesPagoNombreTitular.style.display = 'block';
                } else {
                    detallesPagoNumeroTarjeta.style.display = 'none';
                    detallesPagoNombreTitular.style.display = 'none';
                }
            });
        </script>
    </body>
</html>
