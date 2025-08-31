<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Modalidades por Escola</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/proj_foccus/public/css/relatorio.css"> 
</head>
<body>
<div class="container mt-4 p-4 p-md-5">
    <h2 class="mb-4">Modalidades por Escola</h2>

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
                            <?php echo htmlspecialchars($esc['esc_razao_social']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <button type="button" class="btn btn-secondary" onclick="window.print();">Imprimir</button>
                <?php if ($inep_escola && $inep_escola !== "0") : ?>
                    <a href="/proj_foccus/controller/relatorios/modalidade_por_escola_pdf.php?inep_escola=<?php echo urlencode($inep_escola); ?>" target="_blank" class="btn btn-success">Exportar PDF</a>
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
            $stmt = $conn->prepare($sql);
            if ($inep_escola !== "0") {
                $stmt->bindParam(":inep_escola", $inep_escola);
            }
            $stmt->execute();
            $modalidades = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch(Exception $e) {
            echo '<div class="alert alert-danger">Erro ao buscar modalidades: '.$e->getMessage().'</div>';
            $modalidades = [];
        }

        if (count($modalidades) > 0) {
            echo '<div class="table-responsive"><table class="table table-bordered table-striped"><thead><tr><th>INEP</th><th>Modalidade</th></tr></thead><tbody>';
            foreach ($modalidades as $mod) {
                echo '<tr>';
                echo '<td>' . htmlspecialchars($mod['inep_escola']) . '</td>';
                echo '<td>' . htmlspecialchars($mod['desc_modalidade']) . '</td>';
                echo '</tr>';
            }
            echo '</tbody></table></div>';
        } else {
            echo '<div class="alert alert-warning">Nenhuma modalidade encontrada para esta escola.</div>';
        }
        echo '<div class="mt-4"><a href="/proj_foccus/index.php" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Voltar ao Menu</a></div>';

    }
    ?>
</div>
</body>
</html>
