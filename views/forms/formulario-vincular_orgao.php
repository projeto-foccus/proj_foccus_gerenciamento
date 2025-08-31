<?php
require_once __DIR__ . '/../../models/conexao.php';

// Verifica se o parâmetro 'vin_org' foi passado na URL
if (isset($_GET['vin_org'])) {
    // Captura o valor do parâmetro 'vin_org'
    $editId = htmlspecialchars($_GET['vin_org']);

    // Busca os dados do banco com base no ID
    $query = "SELECT * FROM orgao WHERE org_id = :editId";  // Usando :editId como marcador de posição
    $stmt = $conn->prepare($query);  // Preparando a consulta com a conexão $conn

    // Passando o valor de $editId de forma segura para o parâmetro
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);

    // Executando a consulta
    $stmt->execute();

    // Recuperando o resultado
    $row_campos = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verificando se o órgão foi encontrado
    if ($row_campos) {
        $id_orgao           = htmlspecialchars($row_campos['org_id']);
        $razao_social       = htmlspecialchars($row_campos['org_razaosocial']);
         //Recupera o valor de inst_id (chave estrangeira fk_org_inst_id)
        $inst_id            = htmlspecialchars($row_campos['fk_org_inst_id']);
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
        <link rel="stylesheet" href="/proj_foccus/public/css/vincular_org.css"> 
    <title>Cadastro de Orgão</title>
   
</head>

<body>
    <div id="formulario-edt-orgao" class="formulario">
        <form action="/proj_foccus/models/update_inst_id.php" method="POST">
            <h2 class="text-center">Vincula Orgão a Instituião</h2>
            <section>
                <div class="elemento">
                    <label for="org_id" class="form-label">Código do Orgão</label>
                    <input class="form-control" type="text" style="width: 120px;" name="org_id" id="org_id" size="10" maxlength="10" value="<?php echo $id_orgao; ?>" readonly />
                </div>

                <div class="mb-3">
                    <label for="desc_org" class="form-label">Razão Social</label>
                    <input class="form-control" type="text" name="desc_org" id="desc_org" value="<?php echo $razao_social; ?>" required />
                </div>

                <div class="mb-3">
                    <?php
                    // Fetch data from the database
                    $stmt = $conn->prepare("SELECT inst_id, inst_razaosocial FROM instituicao");
                    $stmt->execute();
                    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    ?>
                    <label for="inst_id" class="form-label">Instituição do Orgão</label>
                    <select name="inst_id" id="inst_id" class="form-select" required>
                        <?php foreach ($result as $row) { ?>
                            <option value="<?php echo htmlspecialchars($row['inst_id']); ?>" 
                                <?php echo ($inst_id == $row['inst_id']) ? 'selected' : ''; ?> >
                                <?php echo htmlspecialchars($row['inst_razaosocial']); ?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
            </section>

            <div class="text-center">
                <button class="btn btn-primary" type="submit" name="update" id="update">Salvar Vincular Orgão - Institui</button>
                <a href="/proj_foccus/controller/imprime_orgao.php" class="listar-link btn btn-primary btn-sm">Voltar à lista</a>
            </div>
        </form>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF"></script>
</body>

</html>
