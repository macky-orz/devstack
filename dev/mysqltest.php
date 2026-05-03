<?php
$pdo = new PDO(
    'mysql:host=mysql;dbname=test_db;charset=utf8',
    'root',
    'root'
);

$stmt = $pdo->query('SELECT 1 + 1');
$result = $stmt->fetch();

print_r($result);
?>
