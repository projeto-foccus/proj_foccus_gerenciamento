<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Relatório: Escola, Professores e Alunos por Turma</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/proj_foccus/public/css/relatorio.css"> 
</head>
<body>
<div class="container mt-4 p-4 p-md-5">
    <h2 class="mb-4">Relatório: Escola, Professores e Alunos por Turma</h2>
    <?php
    require_once($_SERVER['DOCUMENT_ROOT'] . '/proj_foccus/models/conexao.php');

    // Buscar escolas para o filtro
    $escolas = [];
    $modalidades = [];
    $professores = [];
    $alunos = [];
    try {
        $res = $conn->query("SELECT esc_inep, esc_razao_social FROM escola ORDER BY esc_razao_social");
        $escolas = $res->fetchAll(PDO::FETCH_ASSOC);
        $inep = isset($_GET['inep']) ? $_GET['inep'] : null;
        if ($inep && $inep !== "0" && $inep !== "") {
            // Buscar modalidades da escola
            $modRes = $conn->prepare("SELECT DISTINCT m.id_modalidade, tm.desc_modalidade FROM modalidade m INNER JOIN tipo_modalidade tm ON m.fk_id_modalidade = tm.id_tipo_modalidade WHERE m.inep_escola = :inep ORDER BY tm.desc_modalidade");
            $modRes->bindParam(':inep', $inep);
            $modRes->execute();
            $modalidades = $modRes->fetchAll(PDO::FETCH_ASSOC);

            $modalidade = isset($_GET['modalidade']) ? $_GET['modalidade'] : '';
            if ($modalidade) {
                // Buscar professores vinculados à modalidade na escola
                $profRes = $conn->prepare("SELECT DISTINCT fun.func_id, fun.func_nome FROM funcionario fun INNER JOIN turma tur ON fun.func_id = tur.fk_cod_func WHERE tur.fk_inep = :inep AND tur.fk_cod_mod = :modalidade ORDER BY fun.func_nome");
                $profRes->bindParam(':inep', $inep);
                $profRes->bindParam(':modalidade', $modalidade);
                $profRes->execute();
                $professores = $profRes->fetchAll(PDO::FETCH_ASSOC);

                $professor = isset($_GET['professor']) ? $_GET['professor'] : '';
                // Buscar alunos vinculados à modalidade na escola
                $aluRes = $conn->prepare("SELECT DISTINCT alu.alu_id, alu.alu_nome FROM aluno alu INNER JOIN matricula mat ON alu.alu_id = mat.fk_id_aluno INNER JOIN turma tur ON tur.cod_valor = mat.fk_cod_valor_turma WHERE tur.fk_inep = :inep AND tur.fk_cod_mod = :modalidade" . ($professor ? " AND tur.fk_cod_func = :professor" : "") . " ORDER BY alu.alu_nome");
                $aluRes->bindParam(':inep', $inep);
                $aluRes->bindParam(':modalidade', $modalidade);
                if ($professor) $aluRes->bindParam(':professor', $professor);
                $aluRes->execute();
                $alunos = $aluRes->fetchAll(PDO::FETCH_ASSOC);
            }
        }
    } catch(Exception $e) {
        echo '<div class="alert alert-danger">Erro ao buscar filtros: '.$e->getMessage().'</div>';
    }

    $inep = isset($_GET['inep']) ? $_GET['inep'] : null;
    $modalidade = isset($_GET['modalidade']) ? $_GET['modalidade'] : '';
    $professor = isset($_GET['professor']) ? $_GET['professor'] : '';
    $aluno = isset($_GET['aluno']) ? $_GET['aluno'] : '';
    ?>

    <form method="get" class="mb-4 no-print">
        <div class="row g-2">
            <div class="col-md-3">
                <select name="inep" class="form-select" required onchange="this.form.submit()">
                    <option value="">Selecione uma escola</option>
                    <option value="0" <?php if($inep === "0") echo "selected"; ?>>Todas</option>
                    <?php foreach ($escolas as $esc): ?>
                        <option value="<?php echo $esc['esc_inep']; ?>" <?php if($inep == $esc['esc_inep']) echo "selected"; ?>><?php echo htmlspecialchars($esc['esc_razao_social']); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-3">
                <select name="modalidade" class="form-select" <?php echo ($inep && $inep !== "0") ? '' : 'disabled'; ?> onchange="this.form.submit()">
                    <option value="">Todas as modalidades</option>
                    <?php foreach ($modalidades as $mod): ?>
                        <option value="<?php echo $mod['id_modalidade']; ?>" <?php if($modalidade == $mod['id_modalidade']) echo "selected"; ?>><?php echo htmlspecialchars($mod['desc_modalidade']); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-3">
                <select name="professor" class="form-select" <?php echo ($inep && $inep !== "0") ? '' : 'disabled'; ?>>
                    <option value="">Todos os professores</option>
                    <?php foreach ($professores as $prof): ?>
                        <option value="<?php echo $prof['func_id']; ?>" <?php if($professor == $prof['func_id']) echo "selected"; ?>><?php echo htmlspecialchars($prof['func_nome']); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-3">
                <select name="aluno" class="form-select" <?php echo ($inep && $inep !== "0") ? '' : 'disabled'; ?>>
                    <option value="">Todos os alunos</option>
                    <?php foreach ($alunos as $alu): ?>
                        <option value="<?php echo $alu['alu_id']; ?>" <?php if($aluno == $alu['alu_id']) echo "selected"; ?>><?php echo htmlspecialchars($alu['alu_nome']); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
        <div class="row g-2 mt-2">
            <div class="col-md-12">
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <button type="button" class="btn btn-secondary" onclick="window.print();">Imprimir</button>
                <?php if ($inep !== null && $inep !== "") : ?>
                    <a href="/proj_foccus/controller/relatorios/relatorio_escola_professor_aluno_turma_pdf.php?inep=<?php echo urlencode($inep); ?>&turma=<?php echo urlencode($turma); ?>&professor=<?php echo urlencode($professor); ?>&aluno=<?php echo urlencode($aluno); ?>" target="_blank" class="btn btn-success">Exportar PDF</a>
                <?php endif; ?>
            </div>
        </div>
    </form>

    <?php
    if ($inep !== null && $inep !== "") {
        // Consulta por modalidade
        $sql = "SELECT esc.esc_razao_social, tm.desc_modalidade AS modalidade, fun.func_nome AS professor, alu.alu_nome AS aluno
                FROM modalidade m
                JOIN tipo_modalidade tm ON m.fk_id_modalidade = tm.id_tipo_modalidade
                JOIN escola esc ON esc.esc_inep = m.inep_escola
                LEFT JOIN turma tur ON tur.fk_cod_mod = m.id_modalidade AND tur.fk_inep = esc.esc_inep
                LEFT JOIN funcionario fun ON fun.func_id = tur.fk_cod_func
                LEFT JOIN matricula mat ON mat.fk_cod_valor_turma = tur.cod_valor
                LEFT JOIN aluno alu ON alu.alu_id = mat.fk_id_aluno
                WHERE esc.esc_inep = :inep";
        $params = [':inep' => $inep];
        if ($modalidade) {
            $sql .= " AND m.id_modalidade = :modalidade";
            $params[':modalidade'] = $modalidade;
        }
        if ($professor) {
            $sql .= " AND fun.func_id = :professor";
            $params[':professor'] = $professor;
        }
        if ($aluno) {
            $sql .= " AND alu.alu_id = :aluno";
            $params[':aluno'] = $aluno;
        }
        $sql .= " ORDER BY modalidade, professor, aluno";
        $stmt = $conn->prepare($sql);
        $stmt->execute($params);
        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // Exibição dos resultados
        if (count($resultados) > 0) {
            echo "<table class='table table-bordered'><thead><tr>";
            if ($inep === "0") echo "<th>Escola</th>";
            echo "<th>Modalidade</th><th>Professor</th><th>Aluno</th></tr></thead><tbody>";
            foreach ($resultados as $row) {
                echo "<tr>";
                if ($inep === "0") echo "<td>" . htmlspecialchars($row['esc_razao_social']) . "</td>";
                echo "<td>" . htmlspecialchars($row['modalidade']) . "</td>";
                echo "<td>" . htmlspecialchars($row['professor']) . "</td>";
                echo "<td>" . htmlspecialchars($row['aluno']) . "</td>";
                echo "</tr>";
            }
            echo "</tbody></table>";
            // Botão Voltar ao Início
            echo '<div class="mt-4"><a href="/proj_foccus/index.php" class="btn btn-primary">Voltar ao Início</a></div>';
        } else {
            echo "<div class='alert alert-info'>Nenhum dado encontrado para o filtro selecionado.</div>";
            // Botão Voltar ao Início
            echo '<div class="mt-4"><a href="/proj_foccus/index.php" class="btn btn-primary">Voltar ao Início</a></div>';
        }
    }
    ?>
</div>
</body>
</html>
