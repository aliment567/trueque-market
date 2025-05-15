create database trueque market;

use trueque market;

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50) UNIQUE NOT NULL,
    Correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Productos (
    id INT PRIMARY KEY,
    id_Usuario INT,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(50),
    valor_estimado DECIMAL(10,2),
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_Usuario) REFERENCES Usuarios(id)
);

CREATE TABLE Intercambios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_Usuario_ofrece INT,
    id_Usuario_resibe INT,
    i

)

