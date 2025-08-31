<?php 
require_once __DIR__ . '/../../models/conexao.php';

// Verifica se o ID de edição foi passado
if (isset($_GET['escola_id'])) {
    $editId = htmlspecialchars($_GET['escola_id']);

    // Consulta para buscar os dados da escola
    $query = "SELECT esc_inep, esc_razao_social, esc_inep FROM escola WHERE esc_id = :editId";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);
    $stmt->execute();
    $escola = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($escola) {
        $esc_inep = htmlspecialchars($escola['esc_inep']);
        $esc_razao_social = htmlspecialchars($escola['esc_razao_social']);
    } else {
        echo "Escola não encontrada.";
        exit;
    }
} else {
    echo "Nenhum ID de escola foi fornecido para edição.";
    exit;
}

// Busca modalidades cadastradas para o INEP da escola selecionada
try {
    $queryCheckboxes = "
        SELECT m.id_modalidade, t.desc_modalidade
        FROM modalidade m
        INNER JOIN tipo_modalidade t ON m.fk_id_modalidade = t.id_tipo_modalidade
        WHERE m.inep_escola = :inep
    ";
    $stmtCheckboxes = $conn->prepare($queryCheckboxes);
    $stmtCheckboxes->bindParam(':inep', $esc_inep, PDO::PARAM_STR);
    $stmtCheckboxes->execute();
    $dadosCheckboxes = $stmtCheckboxes->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Erro ao carregar dados para checkboxes: " . $e->getMessage());
}

// Busca modalidades já associadas à escola
try {
    $querySelecionados = "SELECT fk_id_modalidade FROM enturmacao WHERE fk_id_escola = :editId";
    $stmtSelecionados = $conn->prepare($querySelecionados);
    $stmtSelecionados->bindParam(':editId', $editId, PDO::PARAM_INT);
    $stmtSelecionados->execute();
    $modalidadesAssociadas = $stmtSelecionados->fetchAll(PDO::FETCH_COLUMN);
} catch (PDOException $e) {
    die("Erro ao verificar modalidades associadas: " . $e->getMessage());
}

// Processa os dados do formulário quando enviados
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update'])) {
    if (isset($_POST['selecionados']) && is_array($_POST['selecionados'])) {
        $selecionados = $_POST['selecionados'];

        try {
            $conn->beginTransaction();

            // Remove as associações que foram desmarcadas
            $modalidadesParaRemover = array_diff($modalidadesAssociadas, $selecionados);
            if (!empty($modalidadesParaRemover)) {
                // Ajustar a query DELETE para usar parâmetros nomeados
                $queryDelete = "DELETE FROM enturmacao WHERE fk_id_escola = :editId AND fk_id_modalidade IN (" . implode(',', array_map(function($key) {
                    return ":id$key";
                }, array_keys($modalidadesParaRemover))) . ")";
                $stmtDelete = $conn->prepare($queryDelete);
                $stmtDelete->bindParam(':editId', $editId, PDO::PARAM_INT);

                // Vincula os parâmetros dinamicamente
                foreach ($modalidadesParaRemover as $key => $modalidadeId) {
                    $stmtDelete->bindValue(":id$key", $modalidadeId, PDO::PARAM_INT);
                }

                $stmtDelete->execute();
            }

            // Agora, insere as novas associações (não precisa remover as já existentes, pois foi feito acima)
            foreach ($selecionados as $id) {
                if (!in_array($id, $modalidadesAssociadas)) {
                    // Verificar se a combinação já existe na tabela
                    $queryCheckExistence = "SELECT COUNT(*) FROM enturmacao WHERE fk_id_escola = :editId AND fk_id_modalidade = :modalidadeId";
                    $stmtCheck = $conn->prepare($queryCheckExistence);
                    $stmtCheck->bindParam(':editId', $editId, PDO::PARAM_INT);
                    $stmtCheck->bindParam(':modalidadeId', $id, PDO::PARAM_INT);
                    $stmtCheck->execute();
                    $exists = $stmtCheck->fetchColumn();

                    if ($exists == 0) {
                        // Inserir na tabela apenas se não existir
                        $queryInsert = "INSERT INTO enturmacao (fk_id_escola, fk_id_modalidade, fk_inep) VALUES (:fk_id_escola, :fk_id_modalidade, :fk_inep)";
                        $stmtInsert = $conn->prepare($queryInsert);
                        $stmtInsert->bindParam(':fk_id_escola', $editId, PDO::PARAM_INT);
                        $stmtInsert->bindParam(':fk_id_modalidade', $id, PDO::PARAM_INT);
                        $stmtInsert->bindParam(':fk_inep', $esc_inep, PDO::PARAM_INT);  // Corrigido a chave para 'fk_inep'
                        $stmtInsert->execute();
                    }
                }
            }

            $conn->commit();
            // Mensagem de sucesso
            echo "<p class='text-success'>Alterações salvas com sucesso!</p>";

            // Redireciona para o formulário de enturmamento de escola
            header('Location: formulario-enturmar-escola.php');
            exit;  // Garante que o redirecionamento aconteça imediatamente
        } catch (PDOException $e) {
            // Caso ocorra um erro, faz o rollback e mostra a mensagem de erro
            $conn->rollBack();
            echo "<p class='text-danger'>Erro ao salvar as alterações: " . htmlspecialchars($e->getMessage()) . "</p>";
        }
    } else {
        // Se nenhuma modalidade for selecionada
        echo "<p class='text-warning'>Nenhuma modalidade foi selecionada.</p>";
    }
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/meu.css"> <!-- Referência ao arquivo CSS -->
    <title>Editar Escola</title>
    <style>
        #formulario-edt-escola {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .listar-link {
            display: inline-block;
            padding: .36rem .55rem;
            font-size: .875rem;
            color: #fff;
            text-decoration: none;
            border-radius: .2rem;
        }
        .listar-link.btn-primary {
            background-color: #007bff;
        }
        .listar-link.btn-sm {
            font-size: .75rem;
        }
    </style>
</head>
<body>
    <div id="formulario-edt-escola" class="formulario">
        <form action="" method="POST">
            <h2 class="text-center">Editar Escola</h2>
            <div class="mb-3">
                <label for="esc_id" class="form-label">Código da Escola</label>
                <input type="text" class="form-control" name="esc_id" id="esc_id" value="<?php echo $editId; ?>" readonly>
            </div>
            <div class="mb-3">
                <label for="esc_inep" class="form-label">INEP</label>
                <input type="text" class="form-control" name="esc_inep" id="esc_inep" value="<?php echo $esc_inep; ?>" readonly>
            </div>
            <div class="mb-3">
                <label for="razao_social_esc" class="form-label">Razão Social</label>
                <input type="text" class="form-control" name="razao_social_esc" id="razao_social_esc" value="<?php echo $esc_razao_social; ?>" required>
            </div>

            <!-- Lista de modalidades -->
<h3 class="mt-4">Modalidades disponíveis</h3>
<ul>
    <?php if ($dadosCheckboxes): ?>
        <?php foreach ($dadosCheckboxes as $item): ?>
            <li><?php echo htmlspecialchars($item['desc_modalidade']); ?></li>
        <?php endforeach; ?>
    <?php else: ?>
        <li>Nenhuma modalidade cadastrada para esta escola.</li>
    <?php endif; ?>
</ul>

            <div class="text-center mt-3">
                <button type="submit" class="btn btn-primary" name="update">Salvar Alterações</button>
                <a href="formulario-enturmar-escola.php" class="listar-link btn btn-primary btn-sm">Voltar à Lista</a>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
