<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/vendor/autoload.php'); // Dompdf

use Dompdf\Dompdf;
use Dompdf\Options;

$escola_id = isset($_GET['escola_id']) ? (int)$_GET['escola_id'] : 0;
$nome_escola = '';

// Buscar nome da escola
if ($escola_id) {
    $stmt = $conn->prepare("SELECT esc_razao_social FROM escola WHERE esc_id = :escola_id");
    $stmt->bindParam(':escola_id', $escola_id, PDO::PARAM_INT);
    $stmt->execute();
    $escola = $stmt->fetch(PDO::FETCH_ASSOC);
    $nome_escola = $escola ? $escola['esc_razao_social'] : '';
}

// Buscar modalidades
$sql = "SELECT t.desc_modalidade FROM modalidade m 
    JOIN escola esc ON esc.esc_inep = m.inep_escola 
    JOIN tipo_modalidade t ON m.fk_id_modalidade = t.id_tipo_modalidade
    WHERE esc.esc_id = :escola_id 
    ORDER BY t.desc_modalidade";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':escola_id', $escola_id, PDO::PARAM_INT);
$stmt->execute();
$modalidades = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Montar HTML estilizado para PDF
$html = '<style>
    body { font-family: DejaVu Sans, Arial, sans-serif; }
    .header { text-align: center; margin-bottom: 30px; }
    .header h2 { color: #2c3e50; }
    .header .sub { color: #7f8c8d; font-size: 18px; }
    .logo { width: 80px; margin-bottom: 10px; }
    .table-modalidades { width: 100%; border-collapse: collapse; margin-top: 20px; }
    .table-modalidades th, .table-modalidades td { border: 1px solid #ddd; padding: 10px; }
    .table-modalidades th { background: #2980b9; color: #fff; }
    .table-modalidades tr:nth-child(even) { background: #f2f2f2; }
</style>';
$html .= '<div class="header">';
$html .= '<img src="/proj_foccus/public/img/logo.png" class="logo" alt="Logo">';
$html .= '<h2>Relatório de Modalidades por Escola</h2>';
$html .= '<div class="sub">Escola: <strong>' . htmlspecialchars($nome_escola) . '</strong></div>';
$html .= '</div>';

$html .= '<table class="table-modalidades">';
$html .= '<tr><th>#</th><th>Modalidade</th></tr>';
if (count($modalidades) > 0) {
    $n = 1;
    foreach ($modalidades as $mod) {
        $html .= '<tr><td>' . $n++ . '</td><td>' . htmlspecialchars($mod['desc_modalidade']) . '</td></tr>';
    }
} else {
    $html .= '<tr><td colspan="2">Nenhuma modalidade encontrada para esta escola.</td></tr>';
}
$html .= '</table>';

$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isRemoteEnabled', true);
$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream('relatorio_modalidades_escola.pdf', ['Attachment' => false]);
exit;
