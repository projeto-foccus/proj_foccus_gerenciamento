<?php
    try {
        $conn = new PDO("mysql:host=localhost;port=3306;dbname=foccus", "root", "diag6425");

        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Conexão realizada com sucesso!";
    } catch(PDOException $e) {
        echo "Erro na conexão: " . $e->getMessage();
    }
?>
