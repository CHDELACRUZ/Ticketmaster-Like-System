<%-- 
    Document   : menuPrincipal
    Created on : 5 feb. 2024, 22:33:44
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <title>Menu</title>

        <!-- Bootstrap core CSS -->
        <link href="cssmenu/menu.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


    </head>
    <body>

        <header>
            <div class="collapse bg-dark" id="navbarHeader">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-md-7 py-4">
                            <h4 class="text-white">Sobre nosotros</h4>
                            <p class="text-muted">Nuestro sistema es la mejor opción para la compra de boletos y la más segura!. Compra tus boletos con nosotros y disfrutarás de un evento maravillosamente inolvidable!</p>
                        </div>
                        <div class="col-sm-4 offset-md-1 py-4">
                            <h4 class="text-white">Accesos directos a la compra de boletos</h4>
                            <ul class="list-unstyled">
                                <li><a href="teatro.jsp" class="text-white">Compra de boletos de Teatro</a></li>
                                <li><a href="museo.jsp" class="text-white">Compra de boletos de Museo</a></li>
                                <li><a href="cine.jsp" class="text-white">Compra de boletos de Cine</a></li>
                                <li><a href="Login.jsp" class="text-white">Cerrar Sesión</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navbar navbar-dark bg-dark shadow-sm">
                <div class="container">
                    <a href="#" class="navbar-brand d-flex align-items-center">
                        <strong>Sistema TicketMaster</strong>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </div>
        </header>

        <main>

            <section class="py-5 text-center container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h1 class="fw-light">Bienvenido al menú principal</h1><h1>${nombre}</h1>
                        <p class="lead text-muted">Elige el evento que sea de tu agrado</p>
                    </div>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">

                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <div class="col">
                            <div class="card shadow-sm">
                                <img class="bd-placeholder-img card-img-top" src="menuimages/teatro.jpg" width="100%" height="225" alt="Descripción de la imagen">

                                <div class="card-body">
                                    <h5>Teatro</h5>
                                    <p class="card-text">Contamos con diversas funciones en distintas zona de la ciudad, presiona en Ver para visualizar nuestro catalogo, no te arrepentiras!!!</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="teatro.jsp" class="btn btn-sm btn-outline-secondary">Compra de boletos</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card shadow-sm">
                                <img class="bd-placeholder-img card-img-top" src="menuimages/museo.jpg" width="100%" height="225" alt="Descripción de la imagen">

                                <div class="card-body">
                                    <h5>Museo</h5>
                                    <p class="card-text">Contamos con diversas funciones en distintas zona de la ciudad, presiona en Ver para visualizar nuestro catalogo, no te arrepentiras!!!</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="museo.jsp" class="btn btn-sm btn-outline-secondary">Compra de boletos</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card shadow-sm">
                                <img class="bd-placeholder-img card-img-top" src="menuimages/cine.jpg" width="100%" height="225" alt="Descripción de la imagen">

                                <div class="card-body">
                                    <h5>Cine</h5>
                                    <p class="card-text">Contamos con diversas funciones en distintas zona de la ciudad, presiona en Ver para visualizar nuestro catalogo, no te arrepentiras!!!</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <a href="cine.jsp" class="btn btn-sm btn-outline-secondary">Compra de boletos</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <footer class="text-muted py-5">
            <div class="container">
            </div>
        </footer>


        <script src="menujs/menujs"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
