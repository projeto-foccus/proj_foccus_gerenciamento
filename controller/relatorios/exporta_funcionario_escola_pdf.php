<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/vendor/autoload.php'); // Dompdf

use Dompdf\Dompdf;
use Dompdf\Options;

$escola_id = isset($_GET['escola_id']) ? (int)$_GET['escola_id'] : 0;

try {
    $params = [];
    $sql = "SELECT e.esc_razao_social, f.func_nome, f.func_cpf, f.email_func, tf.desc_tipo_funcao
            FROM funcionario f
            INNER JOIN tipo_funcao tf ON f.func_cod_funcao = tf.tipo_funcao_id
            INNER JOIN escola e ON f.inep = e.esc_inep
            ";
    if ($escola_id != 0) {
        $sql .= " WHERE e.esc_id = ?";
        $params[] = $escola_id;
    }
    $sql .= " ORDER BY e.esc_razao_social, tf.desc_tipo_funcao, f.func_nome";
    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    $funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Buscar nome da escola para o cabeçalho e nome do arquivo
if ($escola_id !== 0) {
    $stmtNome = $conn->prepare("SELECT esc_razao_social FROM escola WHERE esc_id = :escola_id");
    $stmtNome->bindParam(':escola_id', $escola_id, PDO::PARAM_INT);
    $stmtNome->execute();
    $esc = $stmtNome->fetch(PDO::FETCH_ASSOC);
    $nome_escola = $esc ? $esc['esc_razao_social'] : '';
} else {
    $nome_escola = '';
}

$html = '<style>
    body { font-family: DejaVu Sans, Arial, sans-serif; }
    .header { text-align: center; margin-bottom: 30px; }
    .header h2 { color: #2c3e50; }
    .header .sub { color: #7f8c8d; font-size: 18px; }
    .logo { width: 80px; margin-bottom: 10px; }
    .table-funcionarios { width: 100%; border-collapse: collapse; margin-top: 20px; }
    .table-funcionarios th, .table-funcionarios td { border: 1px solid #ddd; padding: 10px; }
    .table-funcionarios th { background: #1565c0; color: #fff; }
    .table-funcionarios tr:nth-child(even) { background: #f2f2f2; }
</style>';
$html .= '<div class="header">';
$html .= '<img src="/proj_foccus/public/img/logo.png" class="logo" alt="Logo">';
$html .= '<h2>Relatório de Funcionários por Escola</h2>';
if ($escola_id !== 0) {
    $html .= '<div class="sub">Escola: <strong>' . htmlspecialchars($nome_escola) . '</strong></div>';
}
$html .= '</div>';

$html .= '<table class="table-funcionarios">';
$html .= '<tr><th>#</th>';
if ($escola_id === 0) {
    $html .= '<th>Escola</th>';
}
$html .= '<th>Nome</th><th>CPF</th><th>E-mail</th><th>Cargo</th></tr>';
if (count($funcionarios) > 0) {
    $n = 1;
    foreach ($funcionarios as $row) {
        $html .= '<tr><td>' . $n++ . '</td>';
        if ($escola_id === 0) {
            $html .= '<td>' . htmlspecialchars($row['esc_razao_social']) . '</td>';
        }
        $html .= '<td>' . htmlspecialchars($row['func_nome']) . '</td>';
        $html .= '<td>' . htmlspecialchars($row['func_cpf']) . '</td>';
        $html .= '<td>' . htmlspecialchars($row['email_func']) . '</td>';
        $html .= '<td>' . htmlspecialchars($row['desc_tipo_funcao']) . '</td>';
        $html .= '</tr>';
    }
} else {
    $colspan = $escola_id === 0 ? 6 : 5;
    $html .= '<tr><td colspan="' . $colspan . '">Nenhum funcionário encontrado.</td></tr>';
}
$html .= '</table>';

$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isRemoteEnabled', true);
$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
// Gera nome do arquivo
$filename = 'relatorio_funcionarios_';
if ($escola_id !== 0) {
    // Remove acentos e caracteres especiais
    $nome_escola_limpo = preg_replace('/[^a-zA-Z0-9_\-]/', '_', iconv('UTF-8', 'ASCII//TRANSLIT', $nome_escola));
    $filename .= strtolower($nome_escola_limpo ?: 'escola');
} else {
    $filename .= 'todas_escolas';
}
$filename .= '.pdf';
$dompdf->stream($filename, ['Attachment' => false]);
    exit;
} catch(Exception $e) {
    echo '<div class="alert alert-danger">Erro ao gerar PDF: ' . $e->getMessage() . '</div>';
}
