<?php 
require_once __DIR__ . '/../../models/conexao.php';

// Verifica se o ID de edição foi passado
if (isset($_GET['escola_id'])) {
    $editId = htmlspecialchars($_GET['escola_id']);
     
    // Consulta para buscar os dados da escola
    $query = "SELECT esc_inep, esc_razao_social FROM escola WHERE esc_inep = :editId";

    try {
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);
        
        // Executa a consulta e verifica se houve erro
        if (!$stmt->execute()) {
            echo "Erro ao executar a consulta: " . implode(", ", $stmt->errorInfo());
            exit;
        }

        // Busca o resultado
        $escola = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verifica se a escola foi encontrada
        if ($escola) {
            $esc_inep = htmlspecialchars($escola['esc_inep']);
            $esc_razao_social = htmlspecialchars($escola['esc_razao_social']);
        } else {
            echo "Escola não encontrada.";
            exit;
        }
    } catch (PDOException $e) {
        echo "Erro ao buscar escola: " . $e->getMessage();
        exit;
    }
} else {
    echo "Nenhum ID de escola foi fornecido para edição.";
    exit;
}

// Processa os dados do formulário quando enviados
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update'])) {
    if (isset($_POST['selecionados'])) {
        $selecionados = $_POST['selecionados'];

        try {
            $conn->beginTransaction();

            // Processa a associação
            foreach ($selecionados as $id) {
                $queryInsert = "INSERT INTO enturmacao (fk_id_escola, fk_id_modalidade, fk_inep) 
                                VALUES (:fk_id_escola, :fk_id_modalidade, :fk_inep)";
                $stmtInsert = $conn->prepare($queryInsert);
                $stmtInsert->bindParam(':fk_id_escola', $editId, PDO::PARAM_INT);
                $stmtInsert->bindParam(':fk_id_modalidade', $id, PDO::PARAM_INT);
                $stmtInsert->bindParam(':fk_inep', $esc_inep, PDO::PARAM_INT);  
                $stmtInsert->execute();
            }

            $conn->commit();
            echo "<p class='text-success'>Alterações salvas com sucesso!</p>";

            // Redireciona para o formulário de enturmamento de escola
            header('Location: formulario-enturmar-escola.php');
            exit;  
        } catch (PDOException $e) {
            $conn->rollBack();
            echo "<p class='text-danger'>Erro ao salvar as alterações: " . htmlspecialchars($e->getMessage()) . "</p>";
        }
    } else {
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
    <link rel="stylesheet" href="css/meu.css">
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
    </style>
</head>
<body>
    <div id="formulario-edt-escola" class="formulario">
        <form action="" method="POST">
            <h2 class="text-center">Editar Escola</h2>
           
            <div class="mb-3">
                <label for="esc_inep" class="form-label">INEP</label>
                <input type="text" class="form-control" name="esc_inep" id="esc_inep" value="<?php echo $esc_inep; ?>" readonly>
            </div>
            <div class="mb-3">
                <label for="razao_social_esc" class="form-label">Razão Social</label>
                <input type="text" class="form-control" name="razao_social_esc" id="razao_social_esc" value="<?php echo $esc_razao_social; ?>" readonly>
            </div>

            <!-- Lista de radio buttons -->
            <h3 class="mt-4">Selecione a Modalidade</h3>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="selecionados" id="radio_1" value="1">
                <label class="form-check-label" for="radio_1">
                    Ensino Infantil
                </label>
            </div>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="selecionados" id="radio_10" value="10">
                <label class="form-check-label" for="radio_10">
                    Anos Finais 9º Ano
                </label>
            </div>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="selecionados" id="radio_11" value="11">
                <label class="form-check-label" for="radio_11">
                    Educação Jovens e Adultos EJA
                </label>
            </div>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="selecionados" id="radio_5" value="5">
                <label class="form-check-label" for="radio_5">
                    Anos Iniciais 4º Ano
                </label>
            </div>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="selecionados" id="radio_6" value="6">
                <label class="form-check-label" for="radio_6">
                    Anos Iniciais 5º Ano
                </label>
            </div>

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
