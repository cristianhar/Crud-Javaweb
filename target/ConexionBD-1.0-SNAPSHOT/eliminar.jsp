<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Eliminar empleado</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <h2>Eliminar empleado</h2>
                <form action="eliminar.jsp" method="POST">
                    <div class="mb-3">
                        <label for="idUsuario" class="form-label">Seleccionar usuario</label>
                        <select class="form-select" id="idUsuario" name="idUsuario" required>
                            <% 
                                try {
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/javabd?user=root&password=");
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("SELECT id, nombre FROM tblempleados");
                                    while(rs.next()) {
                                        // Obtener el ID seleccionado (si está presente en la solicitud)
                                        String selectedId = request.getParameter("id");
                            %>
                                        <option value="<%= rs.getInt("id") %>" <% if (selectedId != null && selectedId.equals(rs.getString("id"))) out.print("selected"); %>><%= rs.getString("nombre") %></option>
                            <%
                                    }
                                } catch (SQLException e) {
                                    out.println("Error al obtener la lista de usuarios: " + e.getMessage());
                                }
                            %>
           
                        </select>
                    </div>
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </form>
            </div>
        </div>
    </div>
                            
     <%
                        if ("POST".equals(request.getMethod())) 
                        {
                        try {
                            // Obtener el ID seleccionado (si está presente en la solicitud)
                            String selectedId = request.getParameter("id");

                            // Verificar que el ID no sea nulo o vacío antes de ejecutar la eliminación
                            if (selectedId != null && !selectedId.isEmpty()) {
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/javabd?user=root&password=");
                                
                                // Preparar la declaración SQL para la eliminación
                                String deleteQuery = "DELETE FROM tblempleados WHERE id = ?";
                                try (PreparedStatement statement = con.prepareStatement(deleteQuery)) {
                                    statement.setString(1, selectedId);

                                    // Ejecutar la eliminación
                                    statement.executeUpdate();
                                }
                                
                                // Redirigir a la página principal después de la eliminación exitosa
                                response.sendRedirect("index.jsp");
                            } else {
                                out.println("Error: No se proporcionó un ID válido para la eliminación.");
                            }
                        }  
                         catch (SQLException e) {
                            // Manejar los errores de manera elegante (por ejemplo, mostrar un mensaje de error)
                            out.println("Error al eliminar empleado: " + e.getMessage());
                        } 
     }
                            
         
         
        %>
</body>
</html>
