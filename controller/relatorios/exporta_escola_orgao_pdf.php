<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/vendor/autoload.php');

use Dompdf\Dompdf;
use Dompdf\Options;

$orgao_id = isset($_GET['orgao_id']) ? (int)$_GET['orgao_id'] : 0;
$nome_orgao = '';

// Buscar nome do órgão
if ($orgao_id) {
    $stmt = $conn->prepare("SELECT org_razaosocial FROM orgao WHERE org_id = :orgao_id");
    $stmt->bindParam(':orgao_id', $orgao_id, PDO::PARAM_INT);
    $stmt->execute();
    $orgao = $stmt->fetch(PDO::FETCH_ASSOC);
    $nome_orgao = $orgao ? $orgao['org_razaosocial'] : '';
}

// Buscar escolas
if ($orgao_id === 0) {
    $sql = "SELECT o.org_razaosocial, esc.esc_razao_social AS escola
            FROM escola esc
            JOIN orgao o ON o.org_id = esc.fk_org_esc_id
            ORDER BY o.org_razaosocial, esc.esc_razao_social";
    $stmt = $conn->query($sql);
    $escolas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $nome_orgao = 'Todos os órgãos';
} else {
    $sql = "SELECT esc.esc_razao_social AS escola
            FROM escola esc
            WHERE esc.fk_org_esc_id = :orgao_id
            ORDER BY esc.esc_razao_social";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':orgao_id', $orgao_id, PDO::PARAM_INT);
    $stmt->execute();
    $escolas = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$html = '<style>
    body { font-family: DejaVu Sans, Arial, sans-serif; }
    .header { text-align: center; margin-bottom: 30px; }
    .header h2 { color: #2c3e50; }
    .header .sub { color: #7f8c8d; font-size: 18px; }
    .logo { width: 80px; margin-bottom: 10px; }
    .table-escolas { width: 100%; border-collapse: collapse; margin-top: 20px; }
    .table-escolas th, .table-escolas td { border: 1px solid #ddd; padding: 10px; }
    .table-escolas th { background: #1565c0; color: #fff; }
    .table-escolas tr:nth-child(even) { background: #f2f2f2; }
</style>';
$html .= '<div class="header">';
$html .= '<img src="/proj_foccus/public/img/logo.png" class="logo" alt="Logo">';
$html .= '<h2>Relatório de Escolas por Órgão</h2>';
$html .= '<div class="sub">Órgão: <strong>' . htmlspecialchars($nome_orgao) . '</strong></div>';
$html .= '</div>';

$html .= '<table class="table-escolas">';
$html .= '<tr>';
if ($orgao_id === 0) {
    $html .= '<th>#</th><th>Órgão</th><th>Nome da Escola</th>';
} else {
    $html .= '<th>#</th><th>Nome da Escola</th>';
}
$html .= '</tr>';
if (count($escolas) > 0) {
    $n = 1;
    foreach ($escolas as $esc) {
        $html .= '<tr>';
        $html .= '<td>' . $n++ . '</td>';
        if ($orgao_id === 0) {
            $html .= '<td>' . htmlspecialchars($esc['org_razaosocial']) . '</td>';
            $html .= '<td>' . htmlspecialchars($esc['escola']) . '</td>';
        } else {
            $html .= '<td>' . htmlspecialchars($esc['escola']) . '</td>';
        }
        $html .= '</tr>';
    }
} else {
    $colspan = $orgao_id === 0 ? 3 : 2;
    $html .= '<tr><td colspan="' . $colspan . '">Nenhuma escola encontrada.</td></tr>';
}
$html .= '</table>';

$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isRemoteEnabled', true);
$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
// Nome do arquivo
$filename = 'relatorio_escolas_orgao_';
if ($orgao_id !== 0) {
    $nome_orgao_limpo = preg_replace('/[^a-zA-Z0-9_\-]/', '_', iconv('UTF-8', 'ASCII//TRANSLIT', $nome_orgao));
    $filename .= strtolower($nome_orgao_limpo ?: 'orgao');
} else {
    $filename .= 'todos_orgaos';
}
$filename .= '.pdf';
$dompdf->stream($filename, ['Attachment' => false]);
exit;
