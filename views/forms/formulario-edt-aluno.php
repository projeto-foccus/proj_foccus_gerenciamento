<?php
require_once __DIR__ . '/../../models/conexao.php';

if (isset($_GET['edit'])) {
    // Captura o valor do parâmetro
    $editId = htmlspecialchars($_GET['edit']);

    // Exibe ou usa o valor
   // echo "O ID do aluno para edição é: " . $editId;

    // Aqui você pode buscar os dados do banco de dados usando o ID
    $query = "SELECT * FROM aluno WHERE alu_id = :editId";
    $stmt = $conn->prepare($query);  // Preparando a consulta com a conexão $conn

    // Passando o valor de $editId de forma segura para o parâmetro
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);

    // Executando a consulta
    $stmt->execute();

    // Recuperando os resultados
    $resul_edit = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // recebendo os name dos inputs do formulario escola
    foreach ($resul_edit as $row_campos) {
        $id_aluno           = htmlspecialchars($editId);
        $alu_dt_cad          = htmlspecialchars($row_campos['alu_dt_cad']);
        $alu_ra          = htmlspecialchars($row_campos['alu_ra']);
        $alu_nome          = htmlspecialchars($row_campos['alu_nome']);
        $alu_dtnasc       = htmlspecialchars($row_campos['alu_dtnasc']);
        $alu_inep        = htmlspecialchars($row_campos['alu_inep']);
        $alu_nome_resp   = htmlspecialchars($row_campos['alu_nome_resp']);
        $alu_tipo_parentesco    = htmlspecialchars($row_campos['alu_tipo_parentesco']);
        $alu_email_resp   = htmlspecialchars($row_campos['alu_email_resp']);
        $alu_tel_resp  = htmlspecialchars($row_campos['alu_tel_resp']);
    }
} else {
    echo "Nenhum aluno foi fornecido para edição.";
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/proj_foccus/public/css/edt_alu.css"> 

    <title></title>





    
</head>
<body>
<div id="formulario-edt-aluno">
    <form action="/proj_foccus/models/save_edit_aluno.php" method="POST">
        <h2 class="text-center text-primary fw-bold mb-4">
                         Atualiza Dados - Aluno </h2>


        <!-- Campo oculto para o ID do aluno -->
        <input type="hidden" name="alu_id" value="<?php echo $id_aluno; ?>" required>

        <div class="mb-3">
            <label for="ra" class="form-label">RA</label>
            <input type="text" class="form-control" name="ra" id="ra" value="<?php echo $alu_ra; ?>" readonly>
        </div>

        <div class="mb-3">
            <label for="nome" class="form-label">Nome</label>
            <input type="text" class="form-control" name="nome_aluno" id="nome_aluno" value="<?php echo $alu_nome; ?>" required>
        </div>

        <div class="mb-3">
            <label for="dtnasc" class="form-label">Data de Nascimento</label>
            <input type="text" class="form-control" name="dtnasc" id="dtnasc" value="<?php echo $alu_dtnasc; ?>" required>
        </div>

        <div class="mb-3">
            <label for="inep" class="form-label">INEP</label>
            <input type="text" class="form-control" name="inep" id="inep" value="<?php echo $alu_inep; ?>" readonly>
        </div>

        <div class='mb-3'>
            <label for='nome_resp' class='form-label'>Nome do Responsável</label>
            <input type='text' name='nome_resp' id='nome_resp' value='<?php echo $alu_nome_resp ?>' required class='form-control'/>
        </div>

        <div class='mb-3'>
            <label for='tipo_parentesco' class='form-label'>Tipo de Parentesco</label>
            <input type='text' name='tipo_parentesco' id='tipo_parentesco' value='<?php echo $alu_tipo_parentesco ?>' required class='form-control'/>
        </div>

        <div class='mb-3'>
            <label for='email_resp' class='form-label'>E-mail do Responsável</label>
            <input type='email' name='email_resp' id='email_resp' value='<?php echo $alu_email_resp ?>' required class='form-control'/>
        </div>

        <div class="mb-3">
                    <label for="tel_resp" class="form-label">Telefone 02</label>
                    <input class="form-control" type="text" name="tel_resp" id="tel_resp" value="<?php echo $alu_tel_resp?>" placeholder="(99) 99999-9999" required />


        </div>

        <!-- Botões -->
        <div class='text-center'>
            <button type='submit' name='update' id='update' class='btn btn-primary'>Salvar Alterações</button>
            <a href='/proj_foccus/controller/imprime_aluno.php' class='btn btn-secondary'>Voltar à Lista</a>
        </div>
    </form>
</div>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery Mask Plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script>
$(document).ready(function(){
    $('#tel_resp').mask('(00) 00000-0000');
});
</script>


<!-- Inclua seu script global -->
<script src="/public/js/script.js"></script> 
<script src="/path/to/bootstrap.min.js"></script> <!-- Bootstrap JS -->
</body>
</html>
