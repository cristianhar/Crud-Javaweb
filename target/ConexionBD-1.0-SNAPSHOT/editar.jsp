<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar usuario</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <h2>Modificar empleado</h2>
                <form action="editar.jsp" method="POST">
                    <div class="mb-3">
                        <label for="idUsuario" class="form-label">Seleccionar usuario</label>
                        <select class="form-select" id="idUsuario" name="idUsuario" required disabled>
                            <% 
                                String selectedDireccion = ""; // Declarar aqu�
                                String selectedTelefono = "";  // Declarar aqu�
                                try {
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/javabd?user=root&password=");
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("SELECT id, nombre ,direccion ,telefono FROM tblempleados");
                                    while(rs.next()) {
                                        // Obtener el ID seleccionado (si est� presente en la solicitud)
                                        String selectedId = request.getParameter("id");
                                        // Obtener la direcci�n y el tel�fono correspondientes al ID seleccionado
                                        if (selectedId != null && selectedId.equals(rs.getString("id"))) {
                                            selectedDireccion = rs.getString("direccion");
                                            selectedTelefono = rs.getString("telefono");
                                        }
                            %>
                                        <option  value="<%= rs.getInt("id") %>" <% if (selectedId != null && selectedId.equals(rs.getString("id"))) out.print("selected"); %>><%= rs.getString("nombre") %></option>
                            <%
                                    }
                                } catch (SQLException e) {
                                    out.println("Error al obtener la lista de usuarios: " + e.getMessage());
                                }
                            %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Direcci�n</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Nueva direccion" value="<%= selectedDireccion %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Tel�fono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Nuevo Telefono" value="<%= selectedTelefono %>" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Modificar</button>
                    <button type="reset" class="btn btn-danger">Resetear</button>
                </form>
                <%
                    if ("POST".equals(request.getMethod())) {
                        try {                  
                            String idUsuario = request.getParameter("idUsuario");
                            String direccion = request.getParameter("direccion");
                            String telefono = request.getParameter("telefono");
                            
                            // Preparar la declaraci�n SQL para la actualizaci�n
                            String updateQuery = "UPDATE tblempleados SET direccion = ?, telefono = ? WHERE id = ?";
                            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/javabd?user=root&password=");
                                PreparedStatement statement = con.prepareStatement(updateQuery)) {
                                statement.setString(1, direccion);
                                statement.setString(2, telefono);
                                statement.setString(3, idUsuario);

                                // Ejecutar la actualizaci�n
                                statement.executeUpdate();
                            }

                            // Redirigir de nuevo a la p�gina principal despu�s de la actualizaci�n exitosa
                            response.sendRedirect("index.jsp");
                        } catch (SQLException e) {
                            // Manejar los errores de manera elegante (por ejemplo, mostrar un mensaje de error)
                            out.println("Error al actualizar empleado: " + e.getMessage());
                        } 
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
