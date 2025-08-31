<?php 
require_once('../models/conexao.php');

// 1. Primeiro, buscamos o registro com id_eixo_com_lin = 2
$sql = "SELECT * FROM eixo_com_lin WHERE id_eixo_com_lin = 2";
$stmt = $conn->prepare($sql);
$stmt->execute();
$registro = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$registro) {
    die("Registro não encontrado");
}

// Primeiro, vamos verificar os dados do registro
echo "<pre>";
print_r($registro);
echo "</pre>";

// Buscar as contagens de uma vez só
$sql_contagem = "
    SELECT 
        fk_id_hab_com_lin as eixo_id,
        fk_id_pro_com_lin as pro_id,
        COUNT(*) as total
    FROM 
        hab_pro_com_lin
    WHERE 
        fk_id_hab_com_lin = :id_eixo
    GROUP BY 
        fk_id_hab_com_lin, fk_id_pro_com_lin
";

$stmt_contagem = $conn->prepare($sql_contagem);
$stmt_contagem->execute([
    ':id_eixo' => $registro['id_eixo_com_lin']
]);

$contagens = [];
while ($row = $stmt_contagem->fetch(PDO::FETCH_ASSOC)) {
    $contagens[$row['eixo_id']] = $row['total'];
}

// Debug: mostrar contagens
echo "<pre>Contagens: ";
print_r($contagens);
echo "</pre>";
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contagem de Habilidades por Eixo</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; line-height: 1.6; }
        .container { max-width: 1000px; margin: 0 auto; }
        h1 { color: #2c3e50; text-align: center; margin-bottom: 30px; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th { background-color: #3498db; color: white; padding: 12px; text-align: left; }
        td { padding: 10px 12px; border: 1px solid #ddd; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background-color: #f1f1f1; }
        .total { font-weight: bold; color: #e74c3c; }
    </style>

</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h1 class="mb-0">Contagem de Habilidades por Eixo</h1>
            <a href="/proj_foccus/controller/exporta_teste_pdf.php" target="_blank" class="btn btn-success">Exportar PDF</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Eixo</th>
                    <th>Total de Habilidades</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Para cada campo ecmXX que tem valor 1
                for ($i = 1; $i <= 32; $i++) {
                    $campo = 'ecm' . sprintf('%02d', $i);
                    
                    if (isset($registro[$campo]) && $registro[$campo] == 1) {
                        $total = $contagens[$registro['id_eixo_com_lin']] ?? 0;
                        ?>
                        <tr>
                            <td><?= strtoupper($campo) ?></td>
                            <td class="total"><?= $total ?></td>
                        </tr>
                        <?php
                    }
                }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>