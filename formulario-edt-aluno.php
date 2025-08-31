<?php 
require_once __DIR__ . '/../../models/conexao.php';

if (isset($_GET['edit'])) {
    // Captura o valor do parâmetro
    $editId = htmlspecialchars($_GET['edit']);

    // Exibe ou usa o valor
    echo "O codigo do aluno: " . $editId;

    // Aqui você pode buscar os dados do banco de dados usando o ID
    $query = "SELECT * FROM aluno WHERE alu_id = '$editId'";  // Usando :editId como marcador de posição
    $stmt = $conn->prepare($query);  // Preparando a consulta com a conexão $conn

    // Passando o valor de $editId de forma segura para o parâmetro
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);

    // Executando a consulta
    $stmt->execute();

    // Recuperando os resultados
    $resul_edit = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // recebendo os name dos inputs do formulario escola
    foreach ($resul_edit as $row_aluno) {
    
        $id_alu           = htmlspecialchars($editId);
        $esc_inep          = htmlspecialchars($row_aluno['alu_dt_cad']);
        $esc_cnpj          = htmlspecialchars($row_aluno['alu_ra']);
        $esc_razao_social  = htmlspecialchars($row_aluno['alu_nome']);
        $esc_endereco      = htmlspecialchars($row_aluno['alu_dtnasc']);
        $esc_bairro        = htmlspecialchars($row_aluno['alu_inep']);
        $esc_municipio     = htmlspecialchars($row_aluno['alu_nome_resp']);
        $esc_cep           = htmlspecialchars($row_aluno['alu_tipo_parentesco']);
        $uf_esc           = htmlspecialchars($row_aluno['alu_email_resp']);
        $esc_telefone      = htmlspecialchars($row_aluno['alu_tel_resp']);
        $esc_email         = htmlspecialchars($row_aluno['']);
            }
 
} else {
    echo "Nenhum da escola foi fornecido para edição.";
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
        #formulario-edt-aluno {
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
    <div id="formulario-edt-aluno" class="formulario">
        <form action="/proj_foccus/models/save_edit_aluno.php" method="POST">
            <h2 class="text-center">Cadastro de Orgão</h2>
            <section>
            <div class="elemento">
                    <label for="esc_id" class="form-label">Codigo da escola</label>
                    <input class="form-control" type="text" style="width: 50px;" name="esc_id" id="org_id" size= "10" maxlength="10" value="<?php echo $editId?>" readonly />
                </div>
                <div class="elemento">
                    <label for="esc_inep" class="form-label">iNEP</label>
                    <input class="form-control" type="text" style="width: 200px;" name="esc_inep" id="esc_inep" size= "10" maxlength="10" value="<?php echo $esc_inep?>" readonly />
                </div>
                <div class="elemento">
                    <label for="esc_cnpj" class="form-label">CNPJ</label>
                    <input class="form-control" type="text" style="width: 300px;" name="esc_cnpj" id="esc_cnpj" size= "10" maxlength="10" value="<?php echo $esc_cnpj?>"   />
                </div>

                
                <div class="mb-3">
                    <label for="razao_social_esc" class="form-label">RAZÃO SOCIAL</label>
                    <input class="form-control" type="text" name="razao_social_esc" id="razap_social_esc" value = "<?php echo $esc_razao_social?>"placeholder='__.___.___/___-__' required />
                </div>
                <div class="mb-3">
                    <label for="endereco_esc" class="form-label">Endereço</label>
                    <input class="form-control" type="text" name="endereco_esc" id="endereco_esc" value="<?php echo $esc_endereco?>" placeholder='Digite seu endereço' required />
                </div>
                <div class="mb-3">
                    <label for="bairro_esc" class="form-label">Bairro</label>
                    <input class="form-control" type="text" name="bairro_esc" id="bairro_esc" value="<?php echo $esc_bairro?>"  required />
                </div>
                <div class="mb-3">
                    <label for="municipio_esc" class="form-label">Município</label>
                    <input class="form-control" type="text" name="municipio_esc" id="municipio_esc" value="<?php echo $esc_municipio?>"  required />
                </div>
                <div class="mb-3">
                    <label for="cep_esc" class="form-label">CEP</label>
                    <input class="form-control" type="text" name="cep_esc" id="cep_esc" value="<?php echo $esc_cep?>" placeholder='*****-***' required />
                </div>
              
                <div class="mb-3">
                    <?php
                    // Fetch data from the database
                    $stmt = $conn->prepare("SELECT esc_id, esc_razao_social FROM escola");
                    $stmt->execute();
                    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    ?>
                    <label for="esc_id" class="form-label">|Orgão da escola</label>
                    <select name="esc_id" id="esc_id" class="form-select" required>
                        <?php foreach ($result as $row) { ?>
                            <option value="<?php echo htmlspecialchars($row['esc_id']); ?>">
                                <?php echo htmlspecialchars($row['esc_razao_social']); ?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
            </section>
            <div class="text-center">
                <button class="btn btn-primary" type="submit" name="update" id = "update">Salvar alerações</button>
                <a href="/proj_foccus/controller/imprime_orgao.php" class="listar-link btn btn-primary btn-sm">Volta a lista</a>
            </div>
        </form>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF"></script>
</body>
</html>
