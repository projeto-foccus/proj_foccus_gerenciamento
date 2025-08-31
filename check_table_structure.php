<?php
require_once(__DIR__ . '/models/conexao.php');

header('Content-Type: text/plain; charset=utf-8');

try {
    // Obter a estrutura da tabela
    $stmt = $conn->query("SHOW COLUMNS FROM funcionario");
    $columns = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo "=== ESTRUTURA DA TABELA funcionario ===\n\n";
    
    foreach ($columns as $column) {
        echo "Campo: " . $column['Field'] . "\n";
        echo "Tipo: " . $column['Type'] . "\n";
        echo "Nulo: " . $column['Null'] . "\n";
        echo "Chave: " . ($column['Key'] ?: 'Nenhuma') . "\n";
        echo "Valor Padrão: " . ($column['Default'] ?? 'NULL') . "\n";
        echo "Extra: " . ($column['Extra'] ?? 'Nenhum') . "\n\n";
    }
    
    // Verificar chaves estrangeiras
    $stmt = $conn->query("
        SELECT 
            TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, 
            REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
        FROM 
            INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
        WHERE 
            TABLE_SCHEMA = 'proj_foccus' 
            AND TABLE_NAME = 'funcionario'
            AND REFERENCED_TABLE_NAME IS NOT NULL
    ");
    
    $foreignKeys = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if (!empty($foreignKeys)) {
        echo "\n=== CHAVES ESTRANGEIRAS ===\n\n";
        foreach ($foreignKeys as $fk) {
            echo "Coluna: " . $fk['COLUMN_NAME'] . "\n";
            echo "Referência: " . $fk['REFERENCED_TABLE_NAME'] . "." . $fk['REFERENCED_COLUMN_NAME'] . "\n\n";
        }
    }
    
} catch (PDOException $e) {
    echo "Erro ao verificar a estrutura da tabela: " . $e->getMessage();
}

// Fechar conexão
$conn = null;
?>
