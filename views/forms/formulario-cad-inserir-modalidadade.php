<?php
require_once __DIR__ . '/../../models/conexao.php';

// Verificação dos parâmetros cod_escola e cod_funcionario OU lista de professores
$lista_professores = [];
if (isset($_GET['cod_escola'])) {
    $cod_escola = $_GET['cod_escola'];
    // Se vier a lista de professores, busca todos
    if (isset($_GET['professores']) && is_array($_GET['professores'])) {
        $placeholders = implode(',', array_fill(0, count($_GET['professores']), '?'));
        $query = "SELECT func_id, func_nome FROM funcionario WHERE func_id IN ($placeholders)";
        $stmt = $conn->prepare($query);
        foreach ($_GET['professores'] as $k => $id) {
            $stmt->bindValue($k + 1, $id, PDO::PARAM_INT);
        }
        $stmt->execute();
        $lista_professores = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // Para manter compatibilidade, pega o primeiro como cod_funcionario
        $cod_funcionario = $lista_professores[0]['func_id'] ?? null;
    } elseif (isset($_GET['cod_funcionario'])) {
        $cod_funcionario = $_GET['cod_funcionario'];
    } else {
        echo "Parâmetros não encontrados.";
        exit;
    }
} else {
    echo "Parâmetros não encontrados.";
    exit;
}

// Consultando os dados da escola
$query = "SELECT esc_inep, esc_razao_social FROM escola WHERE esc_inep = :editId";
$stmt = $conn->prepare($query);
$stmt->bindParam(':editId', $cod_escola, PDO::PARAM_INT);
$stmt->execute();
$escola = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$escola) {
    echo "Escola não encontrada.";
    exit;
}
$esc_razao_social = htmlspecialchars($escola['esc_razao_social']);

// Consultando os dados do professor
$queryFuncionario = "SELECT func_nome, func_id FROM funcionario WHERE func_id = :funcId";
$stmtFuncionario = $conn->prepare($queryFuncionario);
$stmtFuncionario->bindParam(':funcId', $cod_funcionario, PDO::PARAM_INT);
$stmtFuncionario->execute();
$funcionario = $stmtFuncionario->fetch(PDO::FETCH_ASSOC);

if (!$funcionario) {
    echo "Erro: Nenhum registro encontrado para func_id = $cod_funcionario";
    exit;
}
$func_nome = htmlspecialchars($funcionario['func_nome']);
$func_id = htmlspecialchars($funcionario['func_id']);

// Consultar modalidades associadas à escola - usando GROUP BY para evitar duplicações
$queryModalidade = "SELECT m.id_modalidade, t.desc_modalidade
                    FROM modalidade m
                    INNER JOIN tipo_modalidade t ON m.fk_id_modalidade = t.id_tipo_modalidade
                    WHERE m.inep_escola = :cod_escola
                    ORDER BY t.desc_modalidade";
                    
$stmtModalidade = $conn->prepare($queryModalidade);
$stmtModalidade->bindParam(':cod_escola', $cod_escola, PDO::PARAM_INT);
$stmtModalidade->execute();
$modalidades = $stmtModalidade->fetchAll(PDO::FETCH_ASSOC);

// Consultar modalidades já associadas ao professor
$queryModalidadesProfessor = "SELECT fk_cod_mod FROM turma WHERE fk_cod_func = :func_id AND fk_inep = :cod_inep";
$stmtModalidadesProfessor = $conn->prepare($queryModalidadesProfessor);
$stmtModalidadesProfessor->bindParam(':func_id', $func_id, PDO::PARAM_INT);
$stmtModalidadesProfessor->bindParam(':cod_inep', $cod_escola, PDO::PARAM_INT);
$stmtModalidadesProfessor->execute();
$modalidadesProfessor = $stmtModalidadesProfessor->fetchAll(PDO::FETCH_COLUMN);

// Verificar se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $modalidadesSelecionadas = isset($_POST['modalidade']) ? $_POST['modalidade'] : [];

    try {
        $conn->beginTransaction();
        
        // Remover registros existentes antes de inserir novos
        $queryLimpar = "DELETE FROM turma WHERE fk_cod_func = :func_id AND fk_inep = :cod_inep";
        $stmtLimpar = $conn->prepare($queryLimpar);
        $stmtLimpar->bindParam(':func_id', $func_id, PDO::PARAM_INT);
        $stmtLimpar->bindParam(':cod_inep', $cod_escola, PDO::PARAM_INT);
        $stmtLimpar->execute();

        // Após limpar turma, remover enturmação órfã (sem nenhum professor associado na escola)
        $queryLimpaEnturmacao = "
            DELETE FROM enturmacao 
            WHERE fk_inep = :cod_inep 
              AND id_enturmacao NOT IN (
                SELECT fk_cod_enturmacao FROM turma WHERE fk_inep = :cod_inep2
              )
        ";
        $stmtLimpaEnturmacao = $conn->prepare($queryLimpaEnturmacao);
        $stmtLimpaEnturmacao->bindParam(':cod_inep', $cod_escola, PDO::PARAM_INT);
        $stmtLimpaEnturmacao->bindParam(':cod_inep2', $cod_escola, PDO::PARAM_INT);
        $stmtLimpaEnturmacao->execute();
        
        // Só processa inserção se houver modalidades selecionadas
        if (!empty($modalidadesSelecionadas)) {
            foreach ($modalidadesSelecionadas as $modalidadeId) {
                // Garantir que existe enturmacao para a modalidade e escola escolhidas
                $queryEnturmacao = "SELECT id_enturmacao FROM enturmacao WHERE fk_id_modalidade = :cod_modalidade AND fk_inep = :cod_inep LIMIT 1";
                $stmtEnturmacao = $conn->prepare($queryEnturmacao);
                $stmtEnturmacao->bindParam(':cod_modalidade', $modalidadeId, PDO::PARAM_INT);
                $stmtEnturmacao->bindParam(':cod_inep', $cod_escola, PDO::PARAM_INT);
                $stmtEnturmacao->execute();
                $enturmacao = $stmtEnturmacao->fetch(PDO::FETCH_ASSOC);

                if (!$enturmacao) {
                    // Buscar o esc_id correspondente ao INEP
                    $queryEscId = "SELECT esc_id FROM escola WHERE esc_inep = :cod_inep LIMIT 1";
                    $stmtEscId = $conn->prepare($queryEscId);
                    $stmtEscId->bindParam(':cod_inep', $cod_escola, PDO::PARAM_INT);
                    $stmtEscId->execute();
                    $escolaRow = $stmtEscId->fetch(PDO::FETCH_ASSOC);
                    if ($escolaRow) {
                        $esc_id = $escolaRow['esc_id'];
                        $queryInsertEnturmacao = "INSERT INTO enturmacao (fk_id_escola, fk_id_modalidade, fk_inep) VALUES (:esc_id, :cod_modalidade, :cod_inep)";
                        $stmtInsertEnturmacao = $conn->prepare($queryInsertEnturmacao);
                        $stmtInsertEnturmacao->bindParam(':esc_id', $esc_id, PDO::PARAM_INT);
                        $stmtInsertEnturmacao->bindParam(':cod_modalidade', $modalidadeId, PDO::PARAM_INT);
                        $stmtInsertEnturmacao->bindParam(':cod_inep', $cod_escola, PDO::PARAM_INT);
                        $stmtInsertEnturmacao->execute();
                        $fk_cod_enturmacao = $conn->lastInsertId();
                    } else {
                        throw new Exception("Escola não encontrada para INEP: $cod_escola");
                    }
                } else {
                    $fk_cod_enturmacao = $enturmacao['id_enturmacao'];
                }

                // Gerar o valor para `cod_valor` (concatenação de fk_cod_mod e fk_inep)
                $cod_valor = $modalidadeId . '-' . $cod_escola;

                // Inserir dados na tabela turma
                $queryInserir = "
                    INSERT INTO turma (fk_cod_mod, fk_inep, fk_cod_func, fk_cod_enturmacao, cod_valor) 
                    VALUES (:cod_modalidade, :cod_inep, :cod_func, :fk_cod_enturmacao, :cod_valor)";

                $stmtInserir = $conn->prepare($queryInserir);
                $stmtInserir->bindParam(':cod_modalidade', $modalidadeId, PDO::PARAM_INT);
                $stmtInserir->bindParam(':cod_inep', $cod_escola, PDO::PARAM_INT);
                $stmtInserir->bindParam(':cod_func', $func_id, PDO::PARAM_INT);
                $stmtInserir->bindParam(':fk_cod_enturmacao', $fk_cod_enturmacao, PDO::PARAM_INT);
                $stmtInserir->bindParam(':cod_valor', $cod_valor, PDO::PARAM_STR);
                $stmtInserir->execute();
            }
        }
        $conn->commit();
        // Redirecionar após sucesso
        header("Location: formulario-cad-inserir-modalidadade.php?cod_escola=$cod_escola&cod_funcionario=$func_id&sucesso=1");
        exit;
    } catch (Exception $e) {
        $conn->rollBack();
        echo "<div class='alert alert-danger'>Erro ao salvar os dados: " . $e->getMessage() . "</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Dados da Escola e do Funcionário</title>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Dados da Escola e do Funcionário</h2>
        
        <?php if (isset($_GET['sucesso'])): ?>
        <div class="alert alert-success">
            Modalidades do professor atualizadas com sucesso!<br>
            Modalidades desmarcadas foram removidas e apenas as selecionadas permanecem associadas.
        </div>
        <?php endif; ?>
        
        <form method="POST">
            <div class="mb-3">
                <label for="razao_social_esc" class="form-label">Razão Social da Escola</label>
                <input type="text" class="form-control" name="razao_social_esc" id="razao_social_esc" value="<?php echo $esc_razao_social; ?>" readonly>
            </div>
            
            <div class="mb-3">
                <label for="func_nome" class="form-label">Nome do Professor</label>
                <input type="text" class="form-control" name="func_nome" id="func_nome" value="<?php echo $func_nome; ?>" readonly>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Modalidades:</label>
                <?php if ($modalidades): ?>
                    <div class="list-group">
                    <?php foreach ($modalidades as $modalidade): ?>
                        <div class="form-check">
                            <input 
                                class="form-check-input" 
                                type="checkbox" 
                                name="modalidade[]" 
                                id="modalidade_<?php echo $modalidade['id_modalidade']; ?>"
                                value="<?php echo htmlspecialchars($modalidade['id_modalidade']); ?>"
                                <?php if (in_array($modalidade['id_modalidade'], $modalidadesProfessor)) echo 'checked'; ?> 
                            />
                            <label class="form-check-label" for="modalidade_<?php echo $modalidade['id_modalidade']; ?>">
                                <?php echo htmlspecialchars($modalidade['desc_modalidade']); ?>
                            </label>
                        </div>
                    <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <p class="alert alert-warning">Nenhuma modalidade encontrada para esta escola.</p>
                <?php endif; ?>
            </div>
            
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Salvar</button>
                <a href="formulario-enturmar-professor.php?enturma_professor=<?php echo urlencode($cod_escola); ?>" class="btn btn-secondary">Voltar</a>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
