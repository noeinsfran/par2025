<%--  
    Document: index  
    Created on: 1 may. 2024  
    Author: Cpalacios  
--%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>  

<!DOCTYPE html>  
<html>  
<head>  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <title>JSP Page - Ejemplo Lab05</title>  
</head>  
<body>  
    <h1>Ejemplos de expresiones</h1>  

    <%-- Mostrar la fecha y hora actual --%>  
    <%= new java.util.Date().toString() %><br>  

    <%-- Convertir a mayúsculas un String --%>  
    <%= "Texto a mayúsculas".toUpperCase() %><br>  

    <%-- Resultado de una expresión aritmética --%>  
    <%= (5+2)/(float)3 %><br>  

    <%-- Generar un número aleatorio --%>  
    <%= new java.util.Random().nextInt(100) %>  
</body>  
</html>
