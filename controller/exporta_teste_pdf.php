<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/vendor/autoload.php');

use Dompdf\Dompdf;
use Dompdf\Options;

// Aqui você deve obter os dados de $registro e $contagens como no teste.php
// Exemplo fictício (ajuste conforme sua lógica real):
$registro = isset($_SESSION['registro']) ? $_SESSION['registro'] : [];
$contagens = isset($_SESSION['contagens']) ? $_SESSION['contagens'] : [];

$html = '<style>
    body { font-family: DejaVu Sans, Arial, sans-serif; }
    .header { text-align: center; margin-bottom: 30px; }
    .header h2 { color: #2c3e50; }
    .logo { width: 80px; margin-bottom: 10px; }
    table { width: 100%; border-collapse: collapse; margin: 20px 0; }
    th { background-color: #3498db; color: white; padding: 12px; text-align: left; }
    td { padding: 10px 12px; border: 1px solid #ddd; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    tr:hover { background-color: #f1f1f1; }
    .total { font-weight: bold; color: #e74c3c; }
</style>';
$html .= '<div class="header">';
$html .= '<img src="/proj_foccus/public/img/logo.png" class="logo" alt="Logo">';
$html .= '<h2>Contagem de Habilidades por Eixo</h2>';
$html .= '</div>';

$html .= '<table>';
$html .= '<thead><tr><th>Eixo</th><th>Total de Habilidades</th></tr></thead><tbody>';
for ($i = 1; $i <= 32; $i++) {
    $campo = 'ecm' . sprintf('%02d', $i);
    if (isset($registro[$campo]) && $registro[$campo] == 1) {
        $total = $contagens[$registro['id_eixo_com_lin']] ?? 0;
        $html .= '<tr>';
        $html .= '<td>' . strtoupper($campo) . '</td>';
        $html .= '<td class="total">' . $total . '</td>';
        $html .= '</tr>';
    }
}
$html .= '</tbody></table>';

$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isRemoteEnabled', true);
$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream('contagem_habilidades_eixo.pdf', ['Attachment' => false]);
exit;
