<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Datos del Usuario</title>
</head>
<body>
    <h1>Datos del Usuario</h1>
    <form action="SvUsuarios" method="post">
        CI: <input type="text" name="ci"><br>
        Nombre: <input type="text" name="nombre"><br>
        Apellido: <input type="text" name="apellido"><br>
        Teléfono: <input type="text" name="telefono"><br>
        <input type="submit" value="Enviar">
    </form>

    <h2>Ver Usuario</h2>
    <p>Para ver los datos de los usuarios cargados haga click en el siguiente botón</p>
    <form action="SvUsuarios" method="get">
        <input type="submit" value="Mostrar usuarios">
    </form>
</body>
</html>
