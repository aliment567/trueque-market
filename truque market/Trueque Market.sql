
CREATE DATABASE IF NOT EXISTS trueque_market;
USE trueque_market;


CREATE TABLE Usuarios (
    id INT (11) NOT NULL,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
);


CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_categoria INT,
    valor_estimado DECIMAL(10,2),
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Intercambios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_ofrece INT NOT NULL,
    id_usuario_recibe INT NOT NULL,
    id_producto_ofrecido INT NOT NULL,
    id_producto_recibido INT NOT NULL,
    estado ENUM ('pendiente','aceptado','rechazado') DEFAULT 'pendiente',
    fecha_intercambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Mensajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_receptor INT NOT NULL,
    id_emisor INT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Valoracion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_intercambio INT NOT NULL,
    id_usuario_valorado INT NOT NULL,
    puntuacion TINYINT CHECK (puntuacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha_valoracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Usuarios (id, usuario, correo_electronico, contraseña)
VALUES
(1, 'Felipe345', 'felipe123@gmail.com','1234567'),
(2, 'Armando', 'armando890@gmail.com', 'armando123'),
(3, 'Tatiana', 'tato456@gmail.com', 'Awfg234'),
(4, 'pablo', 'pablo567@gmail.com', 'PaBlO90'),
(5, 'Hernan', 'hernan0@gmail.com', '567890');

ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;




INSERT INTO Categoria (nombre_categoria)
VALUES
('Electronica'),
('Ropa'),
('Juguetes'),
('Libros'),
('Hogar'),
('Herramientas'),
('Deportes'),
('videojuegos');
