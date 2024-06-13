<%-- 
    Document   : cine
    Created on : 5 feb. 2024, 22:37:36
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cine</title>
        <link rel = "stylesheet" href="csscine/cine.css">
    </head>
    <body>
        <div class="container">
            <center><h2>Compra de boletos - Cine</h2></center>
            <form action="cineServlet" method="post">
                <!-- seleccion del lugar -->
                <label for="lugar">Lugar:</label>
                <select name="lugar" id="lugar">
                    <option value="cinemark">Cinemark</option>
                    <option value="cinepolis">Cinépolis</option>
                    <option value="cinemex">Cinemex</option>
                    <option value="amc">AMC</option>
                </select>

                <!-- seleccion de fecha -->
                <label for="fecha">Fecha:</label>
                <input type="date" name="fecha" id="fecha" required>

                <label for="pelicula">Pelicula:</label>
                <select name="pelicula" id="campoPelicula">
                    <option value="cinemark">Avengers</option>
                    <option value="cinemark">Heroico</option>
                    <option value="cinemark">Misión Rescate</option>
                    <option value="cinepolis">MoonFall</option>
                    <option value="cinepolis">Fractura</option>
                    <option value="cinepolis">El Practicante</option>
                    <option value="cinemex">Moana</option>
                    <option value="cinemex">Duna</option>
                    <option value="cinemex">Anabelle</option>
                    <option value="amc">La Viuda</option>
                    <option value="amc">Finch</option>
                    <option value="amc">Prometeo</option>
                </select>


                <!-- seleccion de hora -->
                <div class="campo-formulario" id="campoHora">
                    <label for="hora">Hora:</label>
                    <select name="hora" id="hora" required>
                        <!-- Horarios predeterminados para Cinemark -->
                        <option value="10am">10:00</option>
                        <option value="2pm">14:00</option>
                        <option value="7pm">19:00</option>
                    </select>
                </div>

                <!-- seleccion de tipo de sala -->
                <label for="sala">Sala:</label>
                <select name="sala" id="sala">
                    <option value="tradicional">Tradicional</option>
                    <option value="pluus">PLUUS</option>
                    <option value="vip">VIP</option>
                    <option value="macroxe">Macro XE</option>
                    <option value="cinepolisj">Cinépolis Junior</option>
                    <option value="4dx">4DX</option>
                    <option value="imax">IMAX</option>
                    <option value="vr">VR</option>
                    <option value="screenx">Screen X</option>
                </select>

                <!-- precio de boleto -->
                <label for="precio">Precio por boleto:</label>
                <input type="text" id="precio" name="precioBoleto" value="100" readonly>

                <!-- capacidad del lugar -->
                <label for="capacidad">Capacidad del lugar:</label>
                <input type="text" id="capacidadLugar" name="capacidadLugar" value="200" readonly>

                <!-- cantidad de boletos a comprar por usuario -->
                <label for="catidadBoletos">Cantidad de boletos (máximo 10):</label>
                <input type="number" name="cantidadBoletos" id="cantidadBoletos" min="1" max="10" required>

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
            document.getElementById('campoPelicula').addEventListener('change', function () {
                var peliculaSeleccionada = this.value;
                var campoPelicula = document.getElementById('campoPelicula');

                // Limpiamos opciones antiguas
                campoPelicula.innerHTML = '';

                // Agregamos nuevas opciones basadas en el lugar seleccionado
                switch (peliculaSeleccionada) {
                    case 'cinemark':
                        agregarPeliculas(['Avengers', 'Heroico', 'Misión Rescate']);
                        break;
                    case 'cinepolis':
                        agregarPeliculas(['MoonFall', 'Fractura', 'El Practicante']);
                        break;
                    case 'cinemex':
                        agregarPeliculas(['Moana', 'Duna', 'Anabell']);
                        break;
                    case 'amc':
                        agregarPeliculas(['La Viuda', 'Finch', 'Prometeo']);
                        break;
                    default:
                        break;
                }

                function agregarPeliculas(peliculas) {
                    peliculas.forEach(function (peli) {
                        var option = document.createElement('option');
                        option.value = peli;
                        option.text = peli;
                        campoPelicula.appendChild(option);
                    });
                }
            });
            document.getElementById('lugar').addEventListener('change', function () {
                var lugarSeleccionado = this.value;
                var campoHora = document.getElementById('campoHora');
                var horaSelect = document.getElementById('hora');

                // Borramos opciones antiguas
                horaSelect.innerHTML = '';

                //Agregar nuevas opciones basadas en el lugar seleccionado
                switch (lugarSeleccionado) {
                    case 'cinemark':
                        agregarHorarios(['10:00', '14:00', '18:00', '20:00']);
                        break;
                    case 'cinepolis':
                        agregarHorarios(['13:00', '16:00', '20:00', '22:00']);
                        break;
                    case 'cinemex':
                        agregarHorarios(['15:00', '17:00', '21:00', '23:00']);
                        break;
                    case 'amc':
                        agregarHorarios(['15:00', '17:00', '21:00', '23:00']);
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
