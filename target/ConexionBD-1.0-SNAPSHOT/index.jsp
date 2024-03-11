<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
<head>
    <title>Start Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <style>
        .botoncrear{
            text-align: center;
            margin-left: 50%;
            width: 50px;
            height: 50px;
            
        }    
    </style>

    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <table class="table table-dark">
                    <thead>
                        <a href="crear.jsp">
                        <button class="btn btn-success btn-lg">Crear</button>
                        </a>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/javabd?user=root&password=");
                            st = con.createStatement();
                            rs = st.executeQuery("SELECT * FROM tblempleados;");
                            while (rs.next()) {
                        %>
                                <tr>
                                    <th scope="row"><%= rs.getString(1) %></th>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td>
                                        <a href="editar.jsp?id=<%= rs.getString(1) %>">
                                            <button class="btn btn-primary">Editar</button>
                                        </a>
                                        <form method="post" action="eliminar.jsp">
                                            <input type="hidden" name="id" value="<%= rs.getString(1) %>">
                                            <button type="submit" class="btn btn-danger">Eliminar</button>
                                        </form>
                                    </td>
                                </tr>
                        <%
                            }
                        } catch (Exception e) {
                            out.println("Error Mysql : " + e);
                        } 
                        %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</body>
</html>
