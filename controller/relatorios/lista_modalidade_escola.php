<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Relatório de Modalidades por Escola</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/proj_foccus/public/css/relatorio.css"> 
</head>
<body>
<div class="container mt-4 p-4 p-md-5">
    <h2 class="mb-4">Relatório de Modalidades por Escola</h2>
<a href="/proj_foccus/index.php" class="btn btn-primary mb-4 no-print"><i class="fa fa-arrow-left"></i> Voltar ao Menu</a>
    <?php
    require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');

    $escolas = [];
    try {
        $res = $conn->query("SELECT esc_inep, esc_razao_social FROM escola ORDER BY esc_razao_social");
        $escolas = $res->fetchAll(PDO::FETCH_ASSOC);
    } catch(Exception $e) {
        echo '<div class="alert alert-danger">Erro ao buscar escolas: '.$e->getMessage().'</div>';
    }

    $inep_escola = isset($_GET['inep_escola']) ? $_GET['inep_escola'] : null;
    ?>

    <form method="get" class="mb-4 no-print">
        <div class="row g-2">
            <div class="col-md-8">
                <select name="inep_escola" class="form-select" required>
                    <option value="">Selecione uma escola</option>
                    <option value="0" <?php if($inep_escola === "0") echo "selected"; ?>>Todas</option>
                    <?php foreach ($escolas as $esc): ?>
                        <option value="<?php echo $esc['esc_inep']; ?>"
                            <?php if($inep_escola == $esc['esc_inep']) echo "selected"; ?>>
                            <?php echo htmlspecialchars($esc['esc_razao_social']); ?> (<?php echo $esc['esc_inep']; ?>)
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <button type="button" class="btn btn-secondary" onclick="window.print();">Imprimir</button>
                <?php if ($inep_escola && $inep_escola !== "0") : ?>
                    <a href="/proj_foccus/controller/relatorios/modalidade_escola_pdf.php?inep_escola=<?php echo urlencode($inep_escola); ?>" target="_blank" class="btn btn-success">Exportar PDF</a>
                <?php endif; ?>
            </div>
        </div>
    </form>

    <?php
    if ($inep_escola !== null && $inep_escola !== "") {
        try {
            $sql = "SELECT tm.id_tipo_modalidade, tm.desc_modalidade, m.inep_escola, e.esc_razao_social
                    FROM tipo_modalidade tm
                    INNER JOIN modalidade m ON m.fk_id_modalidade = tm.id_tipo_modalidade
                    INNER JOIN escola e ON e.esc_inep = m.inep_escola
                    ";
            if ($inep_escola !== "0") {
                $sql .= " WHERE m.inep_escola = :inep_escola ";
            }
            $sql .= " GROUP BY tm.id_tipo_modalidade, tm.desc_modalidade, m.inep_escola, e.esc_razao_social
                      ORDER BY e.esc_razao_social, tm.desc_modalidade";
            $stmt = $conn->query($sql);
            $modalidades = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $nome_escola = "Todas as escolas";
        }
        else {
            // Consulta para escola específica
            $sql = "SELECT esc.esc_razao_social AS escola, t.desc_modalidade
                    FROM modalidade m
                    JOIN escola esc ON esc.esc_inep = m.inep_escola
                    JOIN tipo_modalidade t ON m.fk_id_modalidade = t.id_tipo_modalidade
                    WHERE esc.esc_id = :escola_id
                    ORDER BY t.desc_modalidade";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':escola_id', $escola_id, PDO::PARAM_INT);
            $stmt->execute();
            $modalidades = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $nome_escola = '';
            foreach ($escolas as $esc) {
                if ($esc['esc_id'] == $escola_id) {
                    $nome_escola = $esc['esc_razao_social'];
                    break;
                }
            }
        }
        ?>
        <h4>Modalidades de: <?php echo htmlspecialchars($nome_escola); ?></h4>
        <?php if (count($modalidades) > 0): ?>
            <ul class="list-group mb-4">
                <?php foreach ($modalidades as $mod): ?>
                    <li class="list-group-item">
                        <?php echo htmlspecialchars($mod['desc_modalidade']); ?>
                        <?php if ($escola_id === 0): ?>
                            <span class="text-muted">(<?php echo htmlspecialchars($mod['escola']); ?>)</span>
                        <?php endif; ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <div class="alert alert-info">Nenhuma modalidade encontrada para esta escola.</div>
        <?php endif; ?>
    <?php endif; ?>
    <div class="mt-4">
        <a href="/proj_foccus/index.php" class="btn btn-primary">Voltar ao Menu</a>
    </div>
</div>
</body>
</html>
