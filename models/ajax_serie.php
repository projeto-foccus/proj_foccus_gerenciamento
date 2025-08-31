<?php
header('Content-Type: application/json');
require_once(__DIR__ . '/conexao.php');

$modalidade = filter_input(INPUT_GET, 'modalidade', FILTER_SANITIZE_NUMBER_INT);
$escola = filter_input(INPUT_GET, 'escola', FILTER_SANITIZE_STRING);
$periodo = filter_input(INPUT_GET, 'periodo', FILTER_SANITIZE_STRING);

$series = [];

// LOG: parâmetros recebidos
file_put_contents(__DIR__ . '/log_ajax_serie.txt', date('Y-m-d H:i:s') . " | modalidade: $modalidade | escola: $escola | periodo: $periodo\n", FILE_APPEND);

if ($modalidade && $escola) {
    try {
        // Busca as séries usando a estrutura de JOIN correta, conforme a estrutura do banco
        $sql = "SELECT DISTINCT s.serie_id, s.serie_desc
                FROM serie s
                INNER JOIN tipo_modalidade tm ON s.fk_mod_id = tm.id_tipo_modalidade
                INNER JOIN modalidade m ON tm.id_tipo_modalidade = m.fk_id_modalidade
                WHERE m.id_modalidade = :modalidade AND m.inep_escola = :escola";

        // Filtro por período removido pois s.periodo não existe
        $sql .= " ORDER BY s.serie_desc";

        // LOG: consulta SQL
        file_put_contents(__DIR__ . '/log_ajax_serie.txt', date('Y-m-d H:i:s') . " | SQL: $sql\n", FILE_APPEND);
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':modalidade', $modalidade, PDO::PARAM_INT);
        $stmt->bindValue(':escola', $escola, PDO::PARAM_STR);
        // Não faz mais bind do período, pois não existe na query

        $stmt->execute();
        $series = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // LOG: resultado
        file_put_contents(__DIR__ . '/log_ajax_serie.txt', date('Y-m-d H:i:s') . " | resultado: " . json_encode($series) . "\n", FILE_APPEND);
    } catch (PDOException $e) {
        // Log do erro
        file_put_contents(__DIR__ . '/log_ajax_serie.txt', date('Y-m-d H:i:s') . " | ERRO: " . $e->getMessage() . "\n", FILE_APPEND);
        echo json_encode(['error' => $e->getMessage()]);
        exit;
    }
}

echo json_encode($series);
