<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar nuevo Usuario</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <h2>Crear nuevo empleado</h2>
                <form action="" method="POST">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Insertar</button>
                     <button type="reset" class="btn btn-danger">Resetear</button>
                </form>
               
                <%
                   if ("POST".equals(request.getMethod())) {
                       try {
                           String name = request.getParameter("nombre");
                           String direccion = request.getParameter("direccion");
                           String telefono = request.getParameter("telefono");

                           // Establecer la conexión a la base de datos (proporciona las credenciales correctas)
                           Connection con = DriverManager.getConnection("jdbc:mysql://localhost/javabd?user=root&password=");

                           // Preparar la declaración SQL para la inserción
                           String insertQuery = "INSERT INTO tblempleados(nombre, direccion, telefono) VALUES (?, ?, ?)";
                           try (PreparedStatement statement = con.prepareStatement(insertQuery)) 
                           {
                               statement.setString(1, name);
                               statement.setString(2, direccion);
                               statement.setString(3, telefono);

                               // Ejecutar la inserción
                               statement.executeUpdate();
                           }

                           // Redirigir de nuevo a la página principal después de la inserción exitosa
                           response.sendRedirect("index.jsp");
                       } catch (SQLException e) {
                           // Manejar los errores de manera elegante (por ejemplo, mostrar un mensaje de error)
                           out.println("Error al insertar empleado: " + e.getMessage());
                       } 
                   }
                %>
                       
            </div>
        </div>
    </div>
</body>
</html>
