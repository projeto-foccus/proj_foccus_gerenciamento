<?php
require_once __DIR__ . '/../../vendor/autoload.php'; // dompdf
require_once __DIR__ . '/../../models/conexao.php';

use Dompdf\Dompdf;

$esc_inep = isset($_GET['escola']) ? filter_var($_GET['escola'], FILTER_SANITIZE_STRING) : '';
$modalidade = isset($_GET['modalidade']) ? filter_var($_GET['modalidade'], FILTER_SANITIZE_NUMBER_INT) : '';

if (empty($esc_inep) || empty($modalidade)) {
    die('Parâmetros insuficientes.');
}

// Buscar nome da escola
$stmt = $conn->prepare('SELECT esc_razao_social FROM escola WHERE esc_inep = :esc_inep');
$stmt->bindValue(':esc_inep', $esc_inep);
$stmt->execute();
$escola = $stmt->fetch(PDO::FETCH_ASSOC);

// Buscar nome da modalidade
$stmt = $conn->prepare('SELECT tm.desc_modalidade FROM modalidade m INNER JOIN tipo_modalidade tm ON m.fk_id_modalidade = tm.id_tipo_modalidade WHERE m.id_modalidade = :modalidade');
$stmt->bindValue(':modalidade', $modalidade);
$stmt->execute();
$modalidade_info = $stmt->fetch(PDO::FETCH_ASSOC);

// Buscar alunos
$stmt = $conn->prepare('SELECT a.alu_ra, a.alu_nome, m.numero_matricula, CASE WHEN m.id_matricula IS NOT NULL THEN "Sim" ELSE "Não" END as matriculado
    FROM aluno a
    LEFT JOIN matricula m ON m.fk_id_aluno = a.alu_id AND m.fk_cod_mod = :modalidade AND m.ano_matricula = YEAR(CURDATE())
    WHERE a.alu_inep = :esc_inep
    ORDER BY a.alu_nome');
$stmt->bindValue(':esc_inep', $esc_inep);
$stmt->bindValue(':modalidade', $modalidade);
$stmt->execute();
$alunos = $stmt->fetchAll(PDO::FETCH_ASSOC);

$html = '<h2>Relatório de Matrícula de Alunos</h2>';
$html .= '<strong>Escola:</strong> ' . htmlspecialchars($escola['esc_razao_social'] ?? '-') . '<br>';
$html .= '<strong>Modalidade:</strong> ' . htmlspecialchars($modalidade_info['desc_modalidade'] ?? '-') . '<br><br>';
$html .= '<table border="1" cellpadding="6" cellspacing="0" width="100%">';
$html .= '<thead><tr><th>#</th><th>RA</th><th>Nome do Aluno</th><th>Nº Matrícula</th><th>Matriculado?</th></tr></thead><tbody>';
foreach ($alunos as $i => $aluno) {
    $html .= '<tr>';
    $html .= '<td>' . ($i + 1) . '</td>';
    $html .= '<td>' . htmlspecialchars($aluno['alu_ra']) . '</td>';
    $html .= '<td>' . htmlspecialchars($aluno['alu_nome']) . '</td>';
    $html .= '<td>' . ($aluno['numero_matricula'] ? htmlspecialchars($aluno['numero_matricula']) : '-') . '</td>';
    $html .= '<td>' . $aluno['matriculado'] . '</td>';
    $html .= '</tr>';
}
$html .= '</tbody></table>';

$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream('relatorio_matricula.pdf', ['Attachment' => false]);
