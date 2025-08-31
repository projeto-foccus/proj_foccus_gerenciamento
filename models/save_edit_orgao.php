<?php
error_log("org_id: " . $org_id);
error_log("fk_org_inst_id: " . $fk_org_inst_id);
require_once('../models/conexao.php');

if (isset($_POST['update'])) {
    // Sanitize inputs
    $cod_id = filter_input(INPUT_POST, 'org_id', FILTER_SANITIZE_NUMBER_INT);
    $razao_social_org = filter_input(INPUT_POST, 'desc_org', FILTER_SANITIZE_STRING);
    $cnpj_org = filter_input(INPUT_POST, 'cnpj_org', FILTER_SANITIZE_STRING);
    $endereco_org = filter_input(INPUT_POST, 'endereco_org', FILTER_SANITIZE_STRING);
    $bairro_org = filter_input(INPUT_POST, 'bairro_org', FILTER_SANITIZE_STRING);
    $municipio_org = filter_input(INPUT_POST, 'municipio_org', FILTER_SANITIZE_STRING);
    $cep_org = filter_input(INPUT_POST, 'cep_org', FILTER_SANITIZE_STRING);
    $uf_org = filter_input(INPUT_POST, 'uf_org', FILTER_SANITIZE_STRING);
    $email_org = filter_input(INPUT_POST, 'email_org', FILTER_SANITIZE_EMAIL);
    $tel1_org = filter_input(INPUT_POST, 'telefone_org', FILTER_SANITIZE_STRING);
    $tel2_org = filter_input(INPUT_POST, 'telefone2_org', FILTER_SANITIZE_STRING);

    // Prepare the update statement using placeholders for security
    $sql_save_edt = $conn->prepare(
        "UPDATE orgao SET 
            org_razaosocial = :razao_social_org,
            org_cnpj = :cnpj_org,
            org_endereco = :endereco_org,
            org_bairro = :bairro_org,
            org_municipio = :municipio_org,
            org_cep = :cep_org,
            org_uf = :uf_org,
            org_email = :email_org,
            org_tel1 = :tel1_org,
            org_tel2 = :tel2_org
        WHERE org_id = :cod_id"
    );

    // Bind parameters
    $sql_save_edt->bindParam(':razao_social_org', $razao_social_org);
    $sql_save_edt->bindParam(':cnpj_org', $cnpj_org);
    $sql_save_edt->bindParam(':endereco_org', $endereco_org);
    $sql_save_edt->bindParam(':bairro_org', $bairro_org);
    $sql_save_edt->bindParam(':municipio_org', $municipio_org);
    $sql_save_edt->bindParam(':cep_org', $cep_org);
    $sql_save_edt->bindParam(':uf_org', $uf_org);
    $sql_save_edt->bindParam(':email_org', $email_org);
    $sql_save_edt->bindParam(':tel1_org', $tel1_org);
    $sql_save_edt->bindParam(':tel2_org', $tel2_org);
    $sql_save_edt->bindParam(':cod_id', $cod_id, PDO::PARAM_INT);

    // Execute the query and check if it was successful
    if ($sql_save_edt->execute()) {
        echo "<script>alert('Dados enviados com sucesso');
            window.location.href = '/proj_foccus/controller/imprime_orgao.php';
            </script>";
    } else {
        echo "<script>alert('Erro ao enviar os dados.');</script>";
    }
}
?>




