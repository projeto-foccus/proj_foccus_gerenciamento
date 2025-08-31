<?php
require_once __DIR__ . '/conexao.php';
header('Content-Type: application/json; charset=utf-8');

$esc_inep = isset($_GET['esc_inep']) ? filter_var($_GET['esc_inep'], FILTER_SANITIZE_STRING) : '';
$modalidade = isset($_GET['modalidade']) ? filter_var($_GET['modalidade'], FILTER_SANITIZE_NUMBER_INT) : '';
$response = [];

if ($esc_inep) {
    try {
        if ($modalidade) {
            $sql = "SELECT a.*, 
                           CASE WHEN m.fk_id_aluno IS NOT NULL THEN 1 ELSE 0 END AS matriculado
                    FROM aluno a
                    LEFT JOIN matricula m ON m.fk_id_aluno = a.alu_id AND m.fk_cod_mod = :modalidade
                    WHERE a.alu_inep = :esc_inep
                      AND a.alu_id NOT IN (SELECT fk_id_aluno FROM matricula)
                    ORDER BY a.alu_nome";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':esc_inep', $esc_inep);
            $stmt->bindValue(':modalidade', $modalidade, PDO::PARAM_INT);
            $stmt->execute();
            $alunos = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $response = array_map(function($aluno) {
                $aluno['matriculado'] = ($aluno['matriculado'] == 1);
                return $aluno;
            }, $alunos);
        } else {
            $sql = "SELECT a.*, 0 as matriculado FROM aluno a WHERE a.alu_inep = :esc_inep ORDER BY a.alu_nome";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':esc_inep', $esc_inep);
            $stmt->execute();
            $response = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    } catch (PDOException $e) {
        http_response_code(500);
        $response = ['error' => 'Erro ao buscar alunos.'];
    }
}
echo json_encode($response);
