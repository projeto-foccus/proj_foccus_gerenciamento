<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Relatório de Funcionários por Escola</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/proj_foccus/public/css/relatorio.css"> 
</head>
<body>
<div class="container mt-4 p-4 p-md-5">
    <h2 class="mb-4">Relatório de Funcionários por Escola</h2>
    <?php
    require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');

    $escolas = [];
    try {
        $res = $conn->query("SELECT esc_id, esc_razao_social FROM escola ORDER BY esc_razao_social");
        $escolas = $res->fetchAll(PDO::FETCH_ASSOC);
    } catch(Exception $e) {
        echo '<div class="alert alert-danger">Erro ao buscar escolas: '.$e->getMessage().'</div>';
    }

    $escola_id = isset($_GET['escola_id']) ? (int)$_GET['escola_id'] : null;
    ?>

    <form method="get" class="mb-4 no-print">
        <div class="row g-2">
            <div class="col-md-8">
                <select name="escola_id" class="form-select" required>
                    <option value="">Selecione uma escola</option>
                    <option value="0" <?php if($escola_id === 0) echo "selected"; ?>>Todas</option>
                    <?php foreach ($escolas as $esc): ?>
                        <option value="<?php echo $esc['esc_id']; ?>"
                            <?php if($escola_id == $esc['esc_id']) echo "selected"; ?>>
                            <?php echo htmlspecialchars($esc['esc_razao_social']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <button type="button" class="btn btn-secondary" onclick="window.print();">Imprimir</button>
                <a href="/proj_foccus/controller/relatorios/exporta_funcionario_escola_pdf.php<?php echo isset($escola_id) ? '?escola_id=' . urlencode($escola_id) : ''; ?>" target="_blank" class="btn btn-success">Exportar PDF</a>
            </div>
        </div>
    </form>

    <?php
    if ($escola_id !== null && $escola_id !== "") {
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

            if (count($funcionarios) > 0) {
                $escolaAtual = '';
                echo '<div class="table-responsive"><table class="table table-bordered table-striped"><thead><tr><th>Escola</th><th>Nome</th><th>CPF</th><th>E-mail</th><th>Cargo</th></tr></thead><tbody>';
                foreach ($funcionarios as $row) {
                    echo '<tr>';
                    echo '<td>' . htmlspecialchars($row['esc_razao_social']) . '</td>';
                    echo '<td>' . htmlspecialchars($row['func_nome']) . '</td>';
                    echo '<td>' . htmlspecialchars($row['func_cpf']) . '</td>';
                    echo '<td>' . htmlspecialchars($row['email_func']) . '</td>';
                    echo '<td>' . htmlspecialchars($row['desc_tipo_funcao']) . '</td>';
                    echo '</tr>';
                }
                echo '</tbody></table></div>';
            } else {
                // Debug: mostrar SQL e parâmetros usados
                echo '<div class="alert alert-warning">Nenhum funcionário encontrado para o filtro selecionado.<br>SQL: <code>' . htmlspecialchars($sql) . '</code><br>Parâmetros: <code>' . htmlspecialchars(json_encode($params)) . '</code></div>';
            }
        } catch(Exception $e) {
            echo '<div class="alert alert-danger">Erro ao buscar funcionários: ' . $e->getMessage() . '</div>';
        }
    }
    ?>
    <div class="mt-4">
        <a href="/proj_foccus/index.php" class="btn btn-primary">Voltar ao Menu</a>
    </div>
</div>
</body>
</html>
