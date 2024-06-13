<%-- 
    Document   : registrarUsuario
    Created on : 5 feb. 2024, 22:45:39
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Registrarse</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="csscrearCuenta/crearCuenta.css" rel="stylesheet">

        <script>
            function validarFormulario() {
                var nombre = document.getElementById("Nombre").value;
                var contraseña = document.getElementById("Contraseña").value;

                //validar caracteres especiales solo al inicio y al final del usuario y contraseña
                var regexCaracteresEspeciales = /^[^!@#$%^&*(),.?":{}|<>]+$/;
                if (!regexCaracteresEspeciales.test(nombre) || !regexCaracteresEspeciales.test(contraseña)) {
                    alert("Nombre y contraseña no pueden contener caracteres especiales al principio.");
                    return false;
                }

                // Validar que no contenga espacios
                if (/\s/.test(nombre) || /\s/.test(contraseña)) {
                    alert("Nombre y contraseña no pueden contener espacios.");
                    return false;
                }

                // Validar longitud de 4 a 10 caracteres alfanuméricos
                var regexLongitud = /^[A-Za-z0-9]{4,10}$/;
                if (!regexLongitud.test(nombre) || !regexLongitud.test(contraseña)) {
                    alert("Nombre y contraseña deben tener entre 4 y 10 caracteres alfanuméricos.");
                    return false;
                }

                // Validar que no empiece con minúsculas
                if (/^[a-z]/.test(nombre)) {
                    alert("El nombre no puede empezar con minúscula.");
                    return false;
                }

                //No se aceptan numeros 
                var regexSoloLetras = /^[A-Za-z]+$/;
                if (!regexSoloLetras.test(nombre)) {
                    alert("Nombre no puede contener números.");
                    return false;
                }

                //Mensaje de alerta sobre registro exitoso o no
                alert("Registro exitoso.");

                return true;
            }
        </script>
    </script>








</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Crear una cuenta</h1>
                            </div>
                            <form action="usuarioRegistrado" method="post" class="user" onsubmit="return validarFormulario()">
                                <div class="form-group">
                                    <input type="text" name="nombre" class="form-control form-control-user" id="Nombre"
                                           placeholder="Nombre">
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input type="password" name="password" class="form-control form-control-user"
                                               id="Contraseña" placeholder="Contraseña">
                                    </div>
                                </div>
                                <input type="submit" value="Registrarse" class="btn btn-primary btn-user btn-block">

                                <hr>
                                <a href="https://accounts.google.com" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Registrarse con Google
                                </a>
                                <a href="https:www.Facebook.com" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Registrarse con Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="Login.jsp">¿Ya tienes una cuenta? Inicia Sesion!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>

