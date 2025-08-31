<?php
// Carregar variáveis de ambiente do arquivo .env
if (file_exists(__DIR__ . '/.env')) {
    $lines = file(__DIR__ . '/.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) continue;
        list($name, $value) = explode('=', $line, 2);
        $_ENV[trim($name)] = trim($value);
    }
}

 
// Parâmetros de conexão
$host    = $_ENV['DB_HOST']    ?? 'sap_tea.mysql.dbaas.com.br';
$dbname  = $_ENV['DB_NAME']    ?? 'sap_tea';
$user    = $_ENV['DB_USER']    ?? 'sap_tea';
$pass    = $_ENV['DB_PASS']    ?? 'Diag@6425';
$charset = $_ENV['DB_CHARSET'] ?? 'utf8mb4';
$port    = $_ENV['DB_PORT']    ?? '3306';
 

// DSN (Data Source Name)
 /*
$host    = $_ENV['DB_HOST']    ?? 'localhost';
$dbname  = $_ENV['DB_NAME']    ?? 'foccus_teste';
$user    = $_ENV['DB_USER']    ?? 'root';
$pass    = $_ENV['DB_PASS']    ?? 'diag6425';
$charset = $_ENV['DB_CHARSET'] ?? 'utf8mb4';
$port    = $_ENV['DB_PORT']    ?? '3306';
 */


$dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=$charset";

// Opções PDO
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false, // Crucial para paginação
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4"
];

// Configurações SSL (se existirem no .env)
if (!empty($_ENV['DB_SSL_CA'])) {
    $options[PDO::MYSQL_ATTR_SSL_CA] = $_ENV['DB_SSL_CA'];
}
if (!empty($_ENV['DB_SSL_CERT'])) {
    $options[PDO::MYSQL_ATTR_SSL_CERT] = $_ENV['DB_SSL_CERT'];
}
if (!empty($_ENV['DB_SSL_KEY'])) {
    $options[PDO::MYSQL_ATTR_SSL_KEY] = $_ENV['DB_SSL_KEY'];
}

try {
    // Cria a conexão PDO
    $conn = new PDO($dsn, $user, $pass, $options);
    
    // Configurações adicionais importantes
    $conn->setAttribute(PDO::ATTR_STRINGIFY_FETCHES, false);
    
} catch (PDOException $e) {
    // Log seguro em produção
    error_log("[" . date('Y-m-d H:i:s') . "] Erro de conexão: " . $e->getMessage());
    
    // Mensagem amigável para o usuário
    die("Erro na conexão com o banco de dados. Por favor, tente novamente mais tarde.");
}


if (!verificarConexao($conn)) {
    echo "<script>alert('Erro de conexão com o banco de dados. Por favor, tente novamente.');</script>";
    // Redirecionar ou finalizar o script
    exit;
}


function verificarConexao($conn) {
    try {
        $conn->query("SELECT 1");
        return true;
    } catch (PDOException $e) {
        // Reconectar
        require_once __DIR__ . '/../../models/conexao.php';
        return isset($conn) && $conn instanceof PDO;
    }
}