<?php 
    session_start();

    if ($_SESSION['user']['role_id'] != 2) {
        header('Location: /');
    }

    require_once 'database/dboperations.php';
    require_once 'templates/notification.php';

    $orders = $db->getAllAdminOrders();

    if(isset($_POST['active'])) {
        $orders = $db->getAllAdminStatusOrders(1);
    }

    if(isset($_POST['accepted'])) {
        $orders = $db->getAllAdminStatusOrders(2);
    }

    if(isset($_POST['cancelled'])) {
        $orders = $db->getAllAdminStatusOrders(3);
    }

    if(isset($_POST['all'])) {
        $orders = $db->getAllAdminOrders();
    }

    if(isset($_POST['accept'])) {
        $db->acceptOrder($_POST['accept']);
    }

    if(isset($_POST['cancel'])) {
        $db->cancelAdminOrder($_POST['cancel'], $_POST['cancel_message']);
    }

    if(isset($_POST['delete'])) {
        $db->deleteAdminOrder($_POST['delete']);
    }
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once 'templates/head.php' ?>
</head>
<body>
    
    <?php require_once 'templates/header.php' ?>

    <div class="container">

        <form method="post" class="df gap">
            <button name='active'>Показать только новые</button>
            <button name='accepted'>Показать только подтвержденные</button>
            <button name='cancelled'>Показать только отмененные</button>
            <button name='all'>Показать все</button>
        </form>

        <?php if($orders): ?>
            
            <table>
                <tr>
                    <th>Товар</th>
                    <th>Количество</th>
                    <th>Покупатель</th>
                    <th>Дата заказа</th>
                    <th>Статус</th>
                    <th></th>
                </tr>
                <?php foreach($orders as $order): ?>
                    <tr>
                        <td><?= $order['product_name'] ?></td>
                        <td><?= $order['count'] ?></td>
                        <td><?= $order['surname'] ?> <?= $order['name'] ?> <?= $order['patronymic'] ?></td>
                        <td><?= $order['order_datetime'] ?></td>
                        <td><?= $order['status_name'] ?></td>
                        <td>
                            <?php if($order['status_id'] == 1): ?>
                                <form method="post" class='df w-full gap m-zero'>
                                    <button class='decline' name='delete' value='<?= $order['id_order_product'] ?>'>Удалить</button>
                                    <button class='accept' name='accept' value='<?= $order['id_order_product'] ?>'>Подтвердить</button>
                                </form>
                                <form method="post" class='df gap m-zero'>
                                    <input type="text" name="cancel_message" placeholder="Причина отмены" required>
                                    <button name='cancel' value='<?= $order['id_order_product'] ?>'>Отменить</button>
                                </form>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>

        <?php else: ?>

            <h2 class="tac">Пусто</h2>

        <?php endif; ?>

    </div>
</body>
</html>