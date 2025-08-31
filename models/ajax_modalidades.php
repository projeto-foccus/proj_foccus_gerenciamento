<?php
require_once __DIR__ . '/conexao.php';
header('Content-Type: application/json; charset=utf-8');

$esc_inep = isset($_GET['esc_inep']) ? filter_var($_GET['esc_inep'], FILTER_SANITIZE_STRING) : '';
$response = [];

if ($esc_inep) {
    try {
        $sql = "SELECT DISTINCT m.id_modalidade, tm.desc_modalidade, t.cod_valor
                FROM turma t
                INNER JOIN modalidade m ON m.id_modalidade = t.fk_cod_mod
                INNER JOIN tipo_modalidade tm ON m.fk_id_modalidade = tm.id_tipo_modalidade
                WHERE t.fk_inep = :esc_inep";
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':esc_inep', $esc_inep);
        $stmt->execute();
        $response = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        http_response_code(500);
        $response = ['error' => 'Erro ao buscar modalidades.'];
    }
}
echo json_encode($response);
