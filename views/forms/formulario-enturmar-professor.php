<?php 
require_once __DIR__ . '/../../models/conexao.php';

// Redireciona após salvar
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // ... (processamento do salvamento aqui)
    header('Location: formulario-enturmar-professor.php');
    exit;
}

// Se func_id vier na URL, priorize ele para buscar o INEP do professor
if (isset($_GET['func_id']) && !empty($_GET['func_id'])) {
    $func_id = $_GET['func_id'];
    $sql_inep = "SELECT inep FROM funcionario WHERE func_id = :func_id LIMIT 1";
    $stmt_inep = $conn->prepare($sql_inep);
    $stmt_inep->bindValue(':func_id', $func_id);
    $stmt_inep->execute();
    $row_inep = $stmt_inep->fetch(PDO::FETCH_ASSOC);
    if ($row_inep && !empty($row_inep['inep'])) {
        $enturma_professor = $row_inep['inep'];
    }
} else {
    // Captura o valor do campo 'enturma_professor' enviado via GET normalmente
    $enturma_professor = isset($_GET['enturma_professor']) ? $_GET['enturma_professor'] : '';
    // Se não veio, tenta pegar pelo funcionario selecionado (funcionario_id)
    if (empty($enturma_professor) && isset($_GET['funcionario_id'])) {
        $funcionario_id = $_GET['funcionario_id'];
        $sql_inep = "SELECT inep FROM funcionario WHERE func_id = :funcionario_id LIMIT 1";
        $stmt_inep = $conn->prepare($sql_inep);
        $stmt_inep->bindValue(':funcionario_id', $funcionario_id);
        $stmt_inep->execute();
        $row_inep = $stmt_inep->fetch(PDO::FETCH_ASSOC);
        if ($row_inep && !empty($row_inep['inep'])) {
            $enturma_professor = $row_inep['inep'];
        }
    }
}
// Inicializa a variável $resultados como um array vazio
$resultados = [];

try {
    // Só executa a consulta se enturma_professor estiver definido
    if (!empty($enturma_professor)) {
        $sql = "
            SELECT 
                fun.func_id, 
                fun.inep,
                esc.esc_inep,
                fun.func_nome, 
                fun.func_cod_funcao,
                tp.desc_tipo_funcao,
                esc.esc_razao_social
            FROM funcionario AS fun
            INNER JOIN escola AS esc ON fun.inep = esc.esc_inep
            INNER JOIN tipo_funcao AS tp ON tp.tipo_funcao_id = fun.func_cod_funcao
            WHERE fun.func_cod_funcao IN (6, 7, 13)
                AND fun.inep = :enturma_professor
            ORDER BY func_nome";
        $lista = $conn->prepare($sql);
        $lista->bindValue(':enturma_professor', $enturma_professor);
        $lista->execute();
        $resultados = $lista->fetchAll(PDO::FETCH_ASSOC);
        error_log("Resultados: " . print_r($resultados, true));
    }
} catch (PDOException $e) {
    // Exibe uma mensagem de erro, se necessário
    echo "Erro ao buscar professores: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Relação de Professores</title>
    <style>
        td {
            color: black;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="mb-3">
            <?php 
            // Monta a URL para voltar para formulario-enturmar-professor.php mantendo o INEP da escola
            $voltarUrl = 'formulario-enturmar-professor.php?enturma_professor=' . urlencode($enturma_professor);
            ?>
            <a href="<?php echo htmlspecialchars($voltarUrl); ?>" class="btn btn-secondary">Voltar</a>
        </div>
        <div class="alert alert-info">
            INEP Escola Selecionada: <strong><?php echo htmlspecialchars($enturma_professor); ?></strong><br>
            <?php if (isset($_GET['funcionario_id'])): ?>
                <span class="text-muted">(funcionario_id recebido: <?php echo htmlspecialchars($_GET['funcionario_id']); ?>)
                <?php if (!empty($row_inep['inep'])): ?>
                    | INEP obtido do funcionário: <strong><?php echo htmlspecialchars($row_inep['inep']); ?></strong>
                <?php endif; ?>
                )</span>
            <?php endif; ?>
        </div>
        <h2>Professores</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Cód: Servidor</th>
                    <th scope="col">Escola</th>
                    <th scope="col">Nome do Professor</th>
                    <th scope="col">Função</th>
                    <th scope="col">Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php if (count($resultados) > 0): ?>
                    <?php 
                    $n = 1;
                    foreach ($resultados as $professor): ?>
                        <tr>
                            <td><?= $n++ ?></td>
                            <td><?php echo htmlspecialchars($professor['func_id']); ?></td>
                            <td><?php echo htmlspecialchars($professor['esc_razao_social']); ?></td>
                            <td><?php echo htmlspecialchars($professor['func_nome']); ?></td>
                            <td><?php echo htmlspecialchars($professor['desc_tipo_funcao']); ?></td>
                            <td>
                                <form action="/proj_foccus/views/forms/formulario-cad-inserir-modalidadade.php" method="GET" class="d-inline">
                                    <input type="hidden" name="cod_escola" value="<?php echo $professor['inep']; ?>">
                                    <input type="hidden" name="cod_funcionario" value="<?php echo $professor['func_id']; ?>">
                                    <button type="submit" class="btn btn-primary btn-sm">Alocar Professor</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="6" class="text-center">Nenhum funcionário encontrado para o INEP selecionado (<strong><?php echo htmlspecialchars($enturma_professor); ?></strong>).</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
        <a href="/proj_foccus/views/forms/formulario-enturmar-escola.php" class="btn btn-primary">Voltar ao Menu</a>
    </div>
</body>
</html>
