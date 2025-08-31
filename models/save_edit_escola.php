<?php
require_once('../models/conexao.php');

if (isset($_POST['update'])) {
    // Sanitize inputs
    $cod_id = filter_input(INPUT_POST, 'org_id', FILTER_SANITIZE_NUMBER_INT);
    $inep_esc = filter_input(INPUT_POST, 'esc_inep', FILTER_SANITIZE_STRING);
    $cnpj_esc = filter_input(INPUT_POST, 'esc_cnpj'); // Para CNPJ, use número.
    $razao_social_esc = filter_input(INPUT_POST, 'razao_social_esc', FILTER_SANITIZE_STRING);
    $endereco_esc = filter_input(INPUT_POST, 'endereco_esc', FILTER_SANITIZE_STRING);
    $bairro_esc = filter_input(INPUT_POST, 'bairro_esc', FILTER_SANITIZE_STRING);
    $municipio_esc = filter_input(INPUT_POST, 'municipio_esc', FILTER_SANITIZE_STRING);
    $cep_esc = filter_input(INPUT_POST, 'cep_esc', FILTER_SANITIZE_NUMBER_INT); // Para CEP, use número.
    $uf_esc = filter_input(INPUT_POST, 'uf_esc', FILTER_SANITIZE_STRING);
    $telefone_esc = filter_input(INPUT_POST, 'telefone_esc', FILTER_SANITIZE_STRING);
    $email_esc = filter_input(INPUT_POST, 'email_esc', FILTER_SANITIZE_EMAIL);

    // Prepare the update statement
    $sql_save_edt = $conn->prepare(
        "UPDATE escola SET 
            esc_inep = :inep_esc,
            esc_cnpj = :cnpj_esc,
            esc_razao_social = :razao_social_esc,
            esc_endereco = :endereco_esc,
            esc_bairro = :bairro_esc,
            esc_municipio = :municipio_esc,
            esc_cep = :cep_esc,
            esc_uf = :uf_esc,
            esc_telefone = :telefone_esc,
            esc_email = :email_esc
        WHERE esc_id = :cod_id"
    );



    // Bind parameters
    $sql_save_edt->bindParam(':inep_esc', $inep_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':cnpj_esc', $cnpj_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':razao_social_esc', $razao_social_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':endereco_esc', $endereco_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':bairro_esc', $bairro_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':municipio_esc', $municipio_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':cep_esc', $cep_esc, PDO::PARAM_INT);
    $sql_save_edt->bindParam(':uf_esc', $uf_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':telefone_esc', $telefone_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':email_esc', $email_esc, PDO::PARAM_STR);
    $sql_save_edt->bindParam(':cod_id', $cod_id, PDO::PARAM_INT);



    // Execute the query and check if it was successful
   if ($sql_save_edt->execute()) {
    echo "<script>alert('Dados enviados com sucesso');
      
        </script>";
} else {
    $errorInfo = $sql_save_edt->errorInfo();
    echo "Erro ao atualizar: " . $errorInfo[2];
}
}
?>
