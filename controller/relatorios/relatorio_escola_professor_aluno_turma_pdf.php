<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/vendor/autoload.php'); // Dompdf

use Dompdf\Dompdf;
use Dompdf\Options;

$inep = isset($_GET['inep']) ? $_GET['inep'] : null;
$modalidade = isset($_GET['modalidade']) ? $_GET['modalidade'] : '';
$professor = isset($_GET['professor']) ? $_GET['professor'] : '';
$aluno = isset($_GET['aluno']) ? $_GET['aluno'] : '';

if ($inep !== null && $inep !== "") {
    // Consulta por modalidade
    $sql = "SELECT esc.esc_razao_social, tm.desc_modalidade AS modalidade, fun.func_nome AS professor, alu.alu_nome AS aluno
            FROM modalidade m
            JOIN tipo_modalidade tm ON m.fk_id_modalidade = tm.id_tipo_modalidade
            JOIN escola esc ON esc.esc_inep = m.inep_escola
            LEFT JOIN turma tur ON tur.fk_cod_mod = m.id_modalidade AND tur.fk_inep = esc.esc_inep
            LEFT JOIN funcionario fun ON fun.func_id = tur.fk_cod_func
            LEFT JOIN matricula mat ON mat.fk_cod_valor_turma = tur.cod_valor
            LEFT JOIN aluno alu ON alu.alu_id = mat.fk_id_aluno
            WHERE esc.esc_inep = :inep";
    $params = [':inep' => $inep];
    if ($modalidade) {
        $sql .= " AND m.id_modalidade = :modalidade";
        $params[':modalidade'] = $modalidade;
    }
    if ($professor) {
        $sql .= " AND fun.func_id = :professor";
        $params[':professor'] = $professor;
    }
    if ($aluno) {
        $sql .= " AND alu.alu_id = :aluno";
        $params[':aluno'] = $aluno;
    }
    $sql .= " ORDER BY modalidade, professor, aluno";
    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $resultados = [];
}

$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isRemoteEnabled', true);
$dompdf = new Dompdf($options);

$html = '<style>body { font-family: DejaVu Sans, Arial, sans-serif; } .header { text-align: center; margin-bottom: 30px; } .header h2 { color: #2c3e50; } .header .sub { color: #7f8c8d; font-size: 18px; } .logo { width: 80px; margin-bottom: 10px; } .table-relatorio { width: 100%; border-collapse: collapse; margin-top: 20px; } .table-relatorio th, .table-relatorio td { border: 1px solid #ddd; padding: 10px; } .table-relatorio th { background: #2980b9; color: #fff; } .table-relatorio tr:nth-child(even) { background: #f2f2f2; }</style>';
$html .= '<div class="header">';
$html .= '<h2>Relatório: Escola, Professores e Alunos por Turma</h2>';
if ($inep !== null && $inep !== "" && $inep !== "0") {
    // Buscar nome da escola
    $stmtNome = $conn->prepare("SELECT esc_razao_social FROM escola WHERE esc_inep = :inep");
    $stmtNome->bindParam(':inep', $inep);
    $stmtNome->execute();
    $escola = $stmtNome->fetch(PDO::FETCH_ASSOC);
    $nome_escola = $escola ? $escola['esc_razao_social'] : '';
    $html .= '<div class="sub">Escola: <strong>' . htmlspecialchars($nome_escola) . '</strong></div>';
}
// Mostrar filtros selecionados
$filtros = [];
if ($modalidade) {
    // Buscar nome da modalidade
    $stmtMod = $conn->prepare("SELECT desc_modalidade FROM tipo_modalidade WHERE id_tipo_modalidade = :mod");
    $stmtMod->bindParam(':mod', $modalidade);
    $stmtMod->execute();
    $modRow = $stmtMod->fetch(PDO::FETCH_ASSOC);
    $modNome = $modRow ? $modRow['desc_modalidade'] : $modalidade;
    $filtros[] = 'Modalidade: <strong>' . htmlspecialchars($modNome) . '</strong>';
}
if ($professor) {
    // Buscar nome do professor
    $stmtProf = $conn->prepare("SELECT func_nome FROM funcionario WHERE func_id = :prof");
    $stmtProf->bindParam(':prof', $professor);
    $stmtProf->execute();
    $profRow = $stmtProf->fetch(PDO::FETCH_ASSOC);
    $profNome = $profRow ? $profRow['func_nome'] : $professor;
    $filtros[] = 'Professor: <strong>' . htmlspecialchars($profNome) . '</strong>';
}
if ($aluno) {
    // Buscar nome do aluno
    $stmtAlu = $conn->prepare("SELECT alu_nome FROM aluno WHERE alu_id = :alu");
    $stmtAlu->bindParam(':alu', $aluno);
    $stmtAlu->execute();
    $aluRow = $stmtAlu->fetch(PDO::FETCH_ASSOC);
    $aluNome = $aluRow ? $aluRow['alu_nome'] : $aluno;
    $filtros[] = 'Aluno: <strong>' . htmlspecialchars($aluNome) . '</strong>';
}
if (!empty($filtros)) {
    $html .= '<div class="sub">' . implode(' | ', $filtros) . '</div>';
}
$html .= '</div>';

$html .= '<table class="table-relatorio"><tr>';
$html .= '<th>Escola</th><th>Modalidade</th><th>Professor</th><th>Aluno</th></tr>';
if (count($resultados) > 0) {
    foreach ($resultados as $row) {
        $html .= '<tr>';
        $html .= '<td>' . htmlspecialchars($row['esc_razao_social']) . '</td>';
        $html .= '<td>' . htmlspecialchars($row['modalidade']) . '</td>';
        $html .= '<td>' . htmlspecialchars($row['professor']) . '</td>';
        $html .= '<td>' . htmlspecialchars($row['aluno']) . '</td>';
        $html .= '</tr>';
    }
} else {
    $html .= '<tr><td colspan="4">Nenhum dado encontrado para o filtro selecionado.</td></tr>';
}
$html .= '</table>';

$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$filename = 'relatorio_escola_professor_aluno_turma';
if ($inep !== null && $inep !== "" && $inep !== "0") {
    $nome_escola_limpo = preg_replace('/[^a-zA-Z0-9_\-]/', '_', iconv('UTF-8', 'ASCII//TRANSLIT', $nome_escola));
    $filename .= '_' . strtolower($nome_escola_limpo ?: 'escola');
} else {
    $filename .= '_todas_escolas';
}
$filename .= '.pdf';
$dompdf->stream($filename, ['Attachment' => false]);
exit;
