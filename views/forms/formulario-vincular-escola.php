<?php
require_once __DIR__ . '/../../models/conexao.php';

// Verifica se o parâmetro 'vin_esc' foi passado na URL
if (isset($_GET['vin_esc'])) {
    // Captura o valor do parâmetro 'vin_esc'
    $editId = htmlspecialchars($_GET['vin_esc']);

    // Busca os dados do banco com base no ID
    $query = "SELECT * FROM escola WHERE esc_id = :editId";  // Usando :editId como marcador de posição
    $stmt = $conn->prepare($query);  // Preparando a consulta com a conexão $conn

    // Passando o valor de $editId de forma segura para o parâmetro
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);

    // Executando a consulta
    $stmt->execute();

    // Recuperando o resultado
    $row_campos = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verificando se a escolafoi encontrada
    if ($row_campos) {
        $esc_id            = htmlspecialchars($row_campos['esc_id']);
        $razao_social       = htmlspecialchars($row_campos['esc_razao_social']);
        // Recupera o valor de inst_id (chave estrangeira fk_org_inst_id)
        $org_id            = htmlspecialchars($row_campos['fk_org_esc_id']);
    } else {
        echo "Órgão não encontrado.";
        exit; // Se não encontrar o órgão, interrompe a execução
    }
} else {
    echo "Nenhum ID de órgão foi fornecido para edição.";
    exit; // Se o parâmetro não foi passado, interrompe a execução
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/meu.css"> <!-- Referência ao arquivo CSS -->
    <title>Cadastro de Orgão</title>
    <style>
        /* Adiciona um estilo para centralizar o formulário */
        #formulario-edt-orgao {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .listar-link {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            padding: .360rem .55rem;
            font-size: .875rem;
            font-weight: 400;
            line-height: 1.5;
            border-radius: .2rem;
            color: #fff;
            text-decoration: none;
        }

        .listar-link.btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .listar-link.btn-sm {
            padding: .25rem .5rem;
            font-size: .75rem;
        }
    </style>
</head>

<body>
    <div id="formulario-edt-orgao" class="formulario">
        <form action="/proj_foccus/models/update_org_id.php" method="POST">
            <h2 class="text-center">Vincula escola - Orgão</h2>
            <section>
                <div class="elemento">
                    <label for="esc_id" class="form-label">Código do Orgão</label>
                    <input class="form-control" type="text" style="width: 50px;" name="esc_id" id="esc_id" size="10" maxlength="10" value="<?php echo $esc_id; ?>" readonly />
                </div>

                <div class="mb-3">
                    <label for="desc_esc" class="form-label">Razão Social</label>
                    <input class="form-control" type="text" name="desc_esc" id="desc_esc" value="<?php echo $razao_social; ?>" required />
                </div>




                

                <div class="mb-3">
                    <?php
                    // Fetch data from the database
                    $stmt = $conn->prepare("SELECT org_id, org_razaosocial FROM orgao");
                    $stmt->execute();
                    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    ?>
                    <label for="org_id" class="form-label">Orgão a ser vinculado</label>
                    <select name="org_id" id="org_id" class="form-select" required>
                        <?php foreach ($result as $row) { ?>
                            <option value="<?php echo htmlspecialchars($row['org_id']); ?>" 
                                <?php echo ($org_id == $row['org_id']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($row['org_razaosocial']); ?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
            </section>

            <div class="text-center">
                <button class="btn btn-primary" type="submit" name="update" id="update">Vincular</button>
                <a href="/proj_foccus/controller/imprime_escola.php" class="listar-link btn btn-primary btn-sm">Voltar à lista</a>
            </div>
        </form>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF"></script>
</body>

</html>
