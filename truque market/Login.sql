CREATE TABLE Usuarios (
    id INT (11) NOT NULL,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
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
