<?php
require_once __DIR__ . '/conexao.php';

$inep = isset($_GET['esc_inep']) ? $_GET['esc_inep'] : null;
$modalidade = isset($_GET['modalidade']) ? $_GET['modalidade'] : null;
$serie = isset($_GET['serie']) ? $_GET['serie'] : null;
$periodo = isset($_GET['periodo']) ? $_GET['periodo'] : null;

header('Content-Type: application/json');
if (!$inep || !$modalidade || !$serie || !$periodo) {
    echo json_encode([]);
    exit;
}

try {
    $sql = "SELECT t.id_turma, t.cod_valor, f.func_nome as nome_professor
            FROM turma t
            INNER JOIN funcionario f ON f.func_id = t.fk_cod_func
            WHERE t.fk_inep = :inep
              AND t.fk_cod_mod = :modalidade
              AND t.cod_valor = :serie
              AND t.periodo = :periodo";
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':inep', $inep);
    $stmt->bindValue(':modalidade', $modalidade, PDO::PARAM_INT);
    $stmt->bindValue(':serie', $serie);
    $stmt->bindValue(':periodo', $periodo);
    $stmt->execute();
    $turmas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($turmas);
} catch (PDOException $e) {
    echo json_encode([]);
}
