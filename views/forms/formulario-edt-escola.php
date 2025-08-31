<?php 
require_once __DIR__ . '/../../models/conexao.php';

if (isset($_GET['edit'])) {
    // Captura o valor do parâmetro
    $editId = htmlspecialchars($_GET['edit']);

    // Exibe ou usa o valor
    echo "O ID da escola para edição é: " . $editId;

    // Aqui você pode buscar os dados do banco de dados usando o ID
    $query = "SELECT * FROM escola WHERE esc_id = :editId";  // Usando marcador de posição para evitar SQL Injection
    $stmt = $conn->prepare($query);  // Preparando a consulta com a conexão $conn

    // Passando o valor de $editId de forma segura para o parâmetro
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);

    // Executando a consulta
    $stmt->execute();

    // Recuperando os resultados
    $resul_edit = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // recebendo os name dos inputs do formulario escola
    foreach ($resul_edit as $row_campos) {
        $id_esc            = htmlspecialchars($editId);
        $esc_inep          = htmlspecialchars($row_campos['esc_inep']);
        $esc_cnpj          = htmlspecialchars($row_campos['esc_cnpj']);
        $esc_razao_social  = htmlspecialchars($row_campos['esc_razao_social']);
        $esc_endereco      = htmlspecialchars($row_campos['esc_endereco']);
        $esc_bairro        = htmlspecialchars($row_campos['esc_bairro']);
        $esc_municipio     = htmlspecialchars($row_campos['esc_municipio']);
        $esc_cep           = htmlspecialchars($row_campos['esc_cep']);
        $uf_esc            = htmlspecialchars($row_campos['esc_uf']);
        $esc_telefone      = htmlspecialchars($row_campos['esc_telefone']);
        $esc_email         = htmlspecialchars($row_campos['esc_email']);
    }
} else {
    echo "Nenhum dado da escola foi fornecido para edição.";
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/proj_foccus/public/css/edt_esc.css"> 
    <title>Edição da Escola</title>
 
</head>
<body>
    <div id="formulario-edt-escola" class="formulario">
        <form action="/proj_foccus/models/save_edit_escola.php" method="POST">
            <h2 class="text-center">Dados da Escola selecionada</h2>
            <section>
                <div class="elemento">
                    <label for="esc_id" class="form-label">Código da Escola</label>
                    <input class="form-control" type="text" style="width: 50px;" name="esc_id" id="esc_id" size="10" maxlength="18" value="<?php echo $editId ?>" readonly />
                </div>
                <div class="elemento">
                    <label for="esc_inep" class="form-label">iNEP</label>
                    <input class="form-control" type="text" style="width: 200px;" name="esc_inep" id="esc_inep" size="10" maxlength="10" value="<?php echo $esc_inep ?>" readonly />
                </div>
                <div class="elemento">
                    <label for="esc_cnpj" class="form-label">CNPJ</label>
                    <input class="form-control" type="text" style="width: 300px;" name="esc_cnpj" id="esc_cnpj" size="10" maxlength="20" value="<?php echo $esc_cnpj ?>" />
                </div>

                <div class="mb-3">
                    <label for="razao_social_esc" class="form-label">Razão Social</label>
                    <input class="form-control" type="text" name="razao_social_esc" id="razao_social_esc" value="<?php echo $esc_razao_social ?>" placeholder="Digite a Razão Social" required />
                </div>
                <div class="mb-3">
                    <label for="endereco_esc" class="form-label">Endereço</label>
                    <input class="form-control" type="text" name="endereco_esc" id="endereco_esc" value="<?php echo $esc_endereco ?>" placeholder="Digite o Endereço" required />
                </div>
                <div class="mb-3">
                    <label for="bairro_esc" class="form-label">Bairro</label>
                    <input class="form-control" type="text" name="bairro_esc" id="bairro_esc" value="<?php echo $esc_bairro ?>" required />
                </div>
                <div class="mb-3">
                    <label for="municipio_esc" class="form-label">Município</label>
                    <input class="form-control" type="text" name="municipio_esc" id="municipio_esc" value="<?php echo $esc_municipio ?>" required />
                </div>
                <div class="mb-3">
                    <label for="cep_esc" class="form-label">CEP</label>
                    <input class="form-control" type="text" name="cep_esc" id="cep_esc" value="<?php echo $esc_cep ?>" placeholder="*****-***" required />
                </div>
                <div class="mb-3">
                    <label for="uf_esc" class="form-label">Estado</label>
                    <select name="uf_esc" id="uf_esc" class="form-select" required>
                        <!-- Lista de opções de estados -->
                        <option value="PE" <?php echo ($uf_esc == 'PE') ? 'selected' : ''; ?>>PE</option>
                        <option value="SP" <?php echo ($uf_esc == 'SP') ? 'selected' : ''; ?>>SP</option>




                        
                        <!-- Adicione outros estados conforme necessário -->
                    </select>
                </div>
                <div class="mb-3">
                    <label for="email_esc" class="form-label">E-mail</label>
                    <input class="form-control" type="email" name="email_esc" id="email_esc" value="<?php echo $esc_email ?>" placeholder="Exemplo@email.com" required />
                </div>
                <div class="mb-3">
                    <label for="telefone_esc" class="form-label">Telefone</label>
                    <input class="form-control" type="text" name="telefone_esc" id="telefone_esc" value="<?php echo $esc_telefone ?>" placeholder="(XX) XXXXX-XXXX" required />
                </div>

                <div class="text-center">
                    <button class="btn btn-primary" type="submit" name="update" id="update">Salvar Alterações</button>
                    <a href="/proj_foccus/controller/imprime_escola.php" class="listar-link btn btn-primary btn-sm">Voltar à Lista</a>
                </div>
            </section>
        </form>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF"></script>
</body>
</html>
