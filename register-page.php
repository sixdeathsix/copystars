<?php 
    session_start();

    if ($_SESSION['user']) {
        header('Location: /');
    }

    require_once 'database/dboperations.php';
    require_once 'templates/notification.php';

    $title = 'Авторизация';

    if (isset($_POST['login'], $_POST['password'])) {
        $db->register(
            $_POST['surname'], 
            $_POST['name'],
            $_POST['patronymic'],
            $_POST['email'],
            $_POST['login'],
            $_POST['password'],
            $_POST['password_repeat']
        );
    }
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <?php require_once 'templates/head.php' ?>
</head>
<body>
    
    <?php require_once 'templates/header.php' ?>

    <div class="container auth">
        <form class="auth-form" method="post">
            <input class="validate-ru" type="text" name="surname" placeholder="Фамилия" required>
            <input class="validate-ru" type="text" name="name" placeholder="Имя" required>
            <input class="validate-ru" type="text" name="patronymic" placeholder="Отчество" required>
            <input class="validate-en" type="text" name="login" placeholder="Логин" required>
            <input type="email" name="email" placeholder="Электронный адрес" required>
            <input type="password" name="password" placeholder="Пароль" minLength="6" required>
            <input type="password" name="password_repeat" placeholder="Повторите пароль" minLength="6" required>
            <input id="rules" type="checkbox" checked required>
            <label for="rules">Согласен с правилами регистрации.</label>
            <button>Зарегистрироваться</button>
            <p>Уже зарегистрированы? <a href="auth-page.php">Авторизация</a></p>
        </form>
    </div>

<script src="assets/js/validate.js"></script>
</body>
</html>