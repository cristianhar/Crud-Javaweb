<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
<head>
    <title>Start Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
  

    <div class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <table class="table table-dark">
                    <thead>
                    <th scope="col" colspan="4">Empleados</th>
                    <th scope="col"><a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a></th>
                    
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
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                     <a href="eliminar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>"><i class="fa fa-trash" aria-hidden="true"></i></a>

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
