<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/vendor/autoload.php'); // Dompdf

use Dompdf\Dompdf;
use Dompdf\Options;

$inep_escola = isset($_GET['inep_escola']) ? $_GET['inep_escola'] : null;

$sql = "SELECT tm.id_tipo_modalidade, tm.desc_modalidade, m.inep_escola, e.esc_razao_social
        FROM tipo_modalidade tm
        INNER JOIN modalidade m ON m.fk_id_modalidade = tm.id_tipo_modalidade
        INNER JOIN escola e ON e.esc_inep = m.inep_escola
        ";
if ($inep_escola !== null && $inep_escola !== '' && $inep_escola !== '0') {
    $sql .= " WHERE m.inep_escola = :inep_escola ";
}
$sql .= " GROUP BY tm.id_tipo_modalidade, tm.desc_modalidade, m.inep_escola, e.esc_razao_social
          ORDER BY e.esc_razao_social, tm.desc_modalidade";
$stmt = $conn->prepare($sql);
if ($inep_escola !== null && $inep_escola !== '' && $inep_escola !== '0') {
    $stmt->bindParam(":inep_escola", $inep_escola);
}
$stmt->execute();
$modalidades = $stmt->fetchAll(PDO::FETCH_ASSOC);

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
$html .= '<h2>Modalidades por Escola</h2>';
if ($inep_escola && $inep_escola !== '0') {
    // Buscar nome da escola
    $stmtNome = $conn->prepare("SELECT esc_razao_social FROM escola WHERE esc_inep = :inep_escola");
    $stmtNome->bindParam(':inep_escola', $inep_escola);
    $stmtNome->execute();
    $escola = $stmtNome->fetch(PDO::FETCH_ASSOC);
    $nome_escola = $escola ? $escola['esc_razao_social'] : '';
    $html .= '<div class="sub">Escola: <strong>' . htmlspecialchars($nome_escola) . '</strong></div>';
}
$html .= '</div>';

$html .= '<table class="table-modalidades">';
$html .= '<tr><th>#</th><th>INEP Escola</th><th>Escola</th><th>ID Modalidade</th><th>Descrição Modalidade</th></tr>';
$i = 1;
foreach ($modalidades as $mod) {
    $html .= '<tr>';
    $html .= '<td>' . $i++ . '</td>';
    $html .= '<td>' . htmlspecialchars($mod['inep_escola']) . '</td>';
    $html .= '<td>' . htmlspecialchars($mod['esc_razao_social']) . '</td>';
    $html .= '<td>' . htmlspecialchars($mod['id_tipo_modalidade']) . '</td>';
    $html .= '<td>' . htmlspecialchars($mod['desc_modalidade']) . '</td>';
    $html .= '</tr>';
}
$html .= '</table>';

$options = new Options();
$options->set('isRemoteEnabled', true);
$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream('modalidade_por_escola.pdf', ['Attachment' => false]);
exit;
