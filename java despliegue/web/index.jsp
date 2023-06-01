<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="controlador.Conectar" %>
<%@ page import="controlador.Aprendiz" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Java Web App</title>
</head>
<body>
    <h1>Aprendiz:</h1>
    <table>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Teléfono</th>
            <th>Correo</th>
        </tr>
        <% 
        try {
            Conectar conexionBD = new Conectar();
            Connection conexion = conexionBD.establecerConexion();
            Statement statement = conexion.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Aprendiz");
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String nombre = resultSet.getString("nombre");
                String telefono = resultSet.getString("telefono");
                String correo = resultSet.getString("correo");
                Aprendiz aprendiz = new Aprendiz(id, nombre, telefono, correo);
        %>
        <tr>
            <td><%= aprendiz.getId() %></td>
            <td><%= aprendiz.getNombre() %></td>
            <td><%= aprendiz.getTelefono() %></td>
            <td><%= aprendiz.getCorreo() %></td>
        </tr>
        <% 
            }
            resultSet.close();
            statement.close();
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
