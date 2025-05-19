<?php
session_start();
include "connection.php";

if (isset($_POST['register'])) {
    $name = $_POST['username'];
    $email = $_POST['email'];
    $pass = $_POST['password'];
    $cpass = $_POST['cpass'];

    $check = "SELECT * FROM Usuarios WHERE correo_electronico='{$email}'";
    $res = mysqli_query($conn, $check);

    $passwd = password_hash($pass, PASSWORD_DEFAULT); 

    if (mysqli_num_rows($res) > 0) {
        echo "<div class='message'>
                <p>Este correo ya está registrado. ¡Intenta con otro!</p>
              </div><br>";
        echo "<a href='javascript:self.history.back()'><button class='btn'>Volver</button></a>";
    } else {
        if ($pass === $cpass) {
            $sql = "INSERT INTO Usuarios (usuario, correo_electronico, contraseña) 
                    VALUES ('$name', '$email', '$passwd')";
            $result = mysqli_query($conn, $sql);
            if ($result) {
                echo "<div class='message'>
                        <p>¡Registro exitoso!</p>
                      </div><br>";
                echo "<a href='login.php'><button class='btn'>Iniciar sesión</button></a>";
            } else {
                echo "<div class='message'>
                        <p>Error en el registro. Intenta de nuevo.</p>
                      </div><br>";
                echo "<a href='javascript:self.history.back()'><button class='btn'>Volver</button></a>";
            }
        } else {
            echo "<div class='message'>
                    <p>Las contraseñas no coinciden.</p>
                  </div><br>";
            echo "<a href='signup.php'><button class='btn'>Volver</button></a>";
        }
    }
} else {
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrarse</title>
  <link rel="stylesheet" href="css/style1.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">
  <div class="form-box box">
    <header>Crear Cuenta</header>
    <hr>
    <form action="#" method="POST">
      <div class="input-container">
        <i class="fa fa-user icon"></i>
        <input class="input-field" type="text" placeholder="Usuario" name="username" required>
      </div>
      <div class="input-container">
        <i class="fa fa-envelope icon"></i>
        <input class="input-field" type="email" placeholder="Correo Electrónico" name="email" required>
      </div>
      <div class="input-container">
        <i class="fa fa-lock icon"></i>
        <input class="input-field password" type="password" placeholder="Contraseña" name="password" required>
        <i class="fa fa-eye icon toggle"></i>
      </div>
      <div class="input-container">
        <i class="fa fa-lock icon"></i>
        <input class="input-field" type="password" placeholder="Confirmar Contraseña" name="cpass" required>
        <i class="fa fa-eye icon"></i>
      </div>
      <center><input type="submit" name="register" value="Registrarse" class="btn"></center>
      <div class="links">
        ¿Ya tienes cuenta? <a href="login.php">Iniciar sesión</a>
      </div>
    </form>
  </div>
</div>

<script>
  const toggle = document.querySelector(".toggle"),
        input = document.querySelector(".password");

  toggle.addEventListener("click", () => {
    if (input.type === "password") {
      input.type = "text";
      toggle.classList.replace("fa-eye-slash", "fa-eye");
    } else {
      input.type = "password";
      toggle.classList.replace("fa-eye", "fa-eye-slash");
    }
  });
</script>
</body>
</html>
<?php
}
?>
