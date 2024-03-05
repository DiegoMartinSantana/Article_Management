<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HowWork.aspx.cs" Inherits="SalesSystem.HowWork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Panel de Administración</a>
    <!-- Botón de colapso para dispositivos pequeños -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Usuarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Configuración</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Cerrar sesión</a>
        </li>
      </ul>
    </div>
  </nav>

  <!-- Contenido de la página -->
  <div class="container mt-4">
    <div class="row">
      <div class="col-md-8">
        <h2>Bienvenido al Panel de Administración</h2>
        <p>En esta página, puedes encontrar información y herramientas para administrar tu sitio web.</p>
        <h3>Funciones Disponibles</h3>
        <ul>
          <li>Gestión de usuarios</li>
          <li>Configuración del sitio</li>
          <li>Estadísticas y análisis</li>
          <!-- Agrega más funciones según sea necesario -->
        </ul>
      </div>
      <div class="col-md-4">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Últimas Noticias</h5>
            <p class="card-text">Aquí puedes mostrar las últimas noticias relevantes para los administradores.</p>
            <a href="#" class="btn btn-primary">Ver todas las noticias</a>
          </div>
        </div>
      </div>
    </div>
  </div>

        </div>
    </form>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
