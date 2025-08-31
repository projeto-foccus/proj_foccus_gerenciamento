<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Relatório de Escolas por Órgão</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/proj_foccus/public/css/relatorio.css"> 

</head>
<body>
<div class="container mt-4 p-4 p-md-5">
    <h2 class="mb-4">Relatório de Escolas por Órgão</h2>
    <?php
    require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');

    $orgaos = [];
    try {
        $res = $conn->query("SELECT org_id, org_razaosocial FROM orgao ORDER BY org_razaosocial");
        $orgaos = $res->fetchAll(PDO::FETCH_ASSOC);
    } catch(Exception $e) {
        echo '<div class="alert alert-danger">Erro ao buscar órgãos: '.$e->getMessage().'</div>';
    }

    $orgao_id = isset($_GET['orgao_id']) ? (int)$_GET['orgao_id'] : null;
    ?>

    <form method="get" class="mb-4 no-print">
        <div class="row g-2">
            <div class="col-md-8">
                <select name="orgao_id" class="form-select" required>
                    <option value="">Selecione um órgão responsável</option>
                    <option value="0" <?php if($orgao_id === 0) echo "selected"; ?>>Todos</option>
                    <?php foreach ($orgaos as $org): ?>
                        <option value="<?php echo $org['org_id']; ?>"
                            <?php if($orgao_id == $org['org_id']) echo "selected"; ?>>
                            <?php echo htmlspecialchars($org['org_razaosocial']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <button type="button" class="btn btn-secondary" onclick="window.print();">Imprimir</button>
                <a href="/proj_foccus/controller/relatorios/exporta_escola_orgao_pdf.php<?php echo isset($orgao_id) ? '?orgao_id=' . urlencode($orgao_id) : ''; ?>" target="_blank" class="btn btn-success">Exportar PDF</a>
            </div>
        </div>
    </form>

    <?php if ($orgao_id !== null && $orgao_id !== ""): ?>
        <?php
        if ($orgao_id === 0) {
            // Consulta para TODOS os órgãos
            $sql = "SELECT o.org_razaosocial, esc.esc_razao_social AS escola
                    FROM escola esc
                    JOIN orgao o ON o.org_id = esc.fk_org_esc_id
                    ORDER BY o.org_razaosocial, esc.esc_razao_social";
            $stmt = $conn->query($sql);
            $escolas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $nome_orgao = "Todos os órgãos";
        } else {
            // Consulta para órgão específico
            $sql = "SELECT esc.esc_razao_social AS escola
                    FROM escola esc
                    WHERE esc.fk_org_esc_id = :orgao_id
                    ORDER BY esc.esc_razao_social";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':orgao_id', $orgao_id, PDO::PARAM_INT);
            $stmt->execute();
            $escolas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($orgaos as $og) {
                if ($og['org_id'] == $orgao_id) {
                    $nome_orgao = $og['org_razaosocial'];
                    break;
                }
            }
        }
        ?>

        <h5>Órgão selecionado: <strong><?php echo htmlspecialchars($nome_orgao ?? ''); ?></strong></h5>
        <?php if (count($escolas) > 0): ?>
            <div class="table-responsive">
                <table class="table table-striped table-bordered mt-3">
                    <thead>
                        <tr>
                            <?php if ($orgao_id === 0): ?>
                                <th style="width:45%">Órgão</th>
                                <th style="width:55%">Nome da Escola</th>
                            <?php else: ?>
                                <th style="width:70%">Nome da Escola</th>
                            <?php endif; ?>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($escolas as $esc): ?>
                        <tr>
                            <?php if ($orgao_id === 0): ?>
                                <td><?php echo htmlspecialchars($esc['org_razaosocial']); ?></td>
                                <td><?php echo htmlspecialchars($esc['escola']); ?></td>
                            <?php else: ?>
                                <td><?php echo htmlspecialchars($esc['escola']); ?></td>
                            <?php endif; ?>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <div class="alert alert-warning mt-3">Nenhuma escola cadastrada para este órgão.</div>
        <?php endif; ?>
    <?php else: ?>
        <div class="alert alert-info">Selecione um órgão para visualizar as escolas vinculadas.</div>
    <?php endif; ?>

    <a href="/proj_foccus/index.php" class="btn btn-primary mt-3">Voltar -> Menu</a>
</div>
</body>
</html>
