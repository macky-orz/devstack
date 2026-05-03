<?php
$pdo = new PDO(
    'mysql:host=devstack-mysql-1;dbname=test_db;charset=utf8',
    'root',
    'root'
);

$stmt = $pdo->query('SELECT 1 + 1');
$result = $stmt->fetch();

print_r($result);
?>
