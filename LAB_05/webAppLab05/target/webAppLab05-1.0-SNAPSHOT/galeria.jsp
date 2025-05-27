<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Galería de Imágenes</title>
</head>
<body>
    <h1>Galería de Imágenes</h1>
    <%
        // Obtener la ruta real del directorio "imagenes"
        String ruta = application.getRealPath("/") + "imagenes";
        File carpeta = new File(ruta);
        if (carpeta.exists() && carpeta.isDirectory()) {
            String[] lista = carpeta.list();
            for (String archivo : lista) {
                if(archivo.endsWith(".jpg") || archivo.endsWith(".png") || archivo.endsWith(".jpeg")) {
    %>
                    <img src="imagenes/<%= archivo %>" width="200px" style="margin:10px;">
    <%
                }
            }
        } else {
            out.println("Directorio de imágenes no encontrado.");
        }
    %>
</body>
</html>
