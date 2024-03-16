# Crud-Javaweb
Creacion de Crud en javaweb con Xampp  uso de dependencias y consultas en codigo algo basico para un crear,editar,eliminar,mostrar.

```
Base de Datos de prueba

/* 

@AUTOR: CRISTIAN ARBOLEDA
@FECHA: 2024/03/10
@DESCRIPCION : BASE DE DATOS DE PRUEBA JAVA CON CONEXION MYSQL


 */
DROP DATABASE IF EXISTS javabd;
CREATE DATABASE IF NOT EXISTS javabd;
USE javabd;
CREATE TABLE tblempleados(
id INT  AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    telefono VARCHAR(50)
    
);
INSERT INTO tblempleados (nombre, direccion, telefono) VALUES
('Juan Pérez', 'Calle A, #123', '555-1234'),
('María Rodríguez', 'Avenida B, #456', '555-5678'),
('Carlos Gómez', 'Calle C, #789', '555-9876'),
('Laura Martínez', 'Avenida D, #321', '555-4321'),
('Sergio López', 'Calle E, #654', '555-8765'),
('Ana Sánchez', 'Avenida F, #987', '555-2345');
```
