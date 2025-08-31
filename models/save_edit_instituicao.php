<?php
require_once('../models/conexao.php');

if (isset($_POST['update'])) {
    // Sanitizar inputs
    $cod_id = filter_input(INPUT_POST, 'inst_id', FILTER_SANITIZE_NUMBER_INT);
    $razao_social_inst = filter_input(INPUT_POST, 'desc_inst', FILTER_SANITIZE_STRING);
    $cnpj_inst = filter_input(INPUT_POST, 'cnpj_inst', FILTER_SANITIZE_STRING);
    $endereco_inst = filter_input(INPUT_POST, 'endereco_inst', FILTER_SANITIZE_STRING);
    $bairro_inst = filter_input(INPUT_POST, 'bairro_inst', FILTER_SANITIZE_STRING);
    $municipio_inst = filter_input(INPUT_POST, 'municipio_inst', FILTER_SANITIZE_STRING);
    $cep_inst = filter_input(INPUT_POST, 'cep_inst', FILTER_SANITIZE_STRING);
    $uf_inst = filter_input(INPUT_POST, 'uf_inst', FILTER_SANITIZE_STRING);
    $email_inst = filter_input(INPUT_POST, 'email_inst', FILTER_SANITIZE_EMAIL);
    $tel1_inst = filter_input(INPUT_POST, 'telefone_inst', FILTER_SANITIZE_STRING);
    $tel2_inst = filter_input(INPUT_POST, 'telefone2_inst', FILTER_SANITIZE_STRING);

    // Preparar a consulta de atualização
    $sql_save_edt = $conn->prepare(
        "UPDATE instituicao SET 
            inst_razaosocial = :razao_social_inst,
            inst_cnpj = :cnpj_inst,
            inst_endereco = :endereco_inst,
            inst_bairro = :bairro_inst,
            inst_municipio = :municipio_inst,
            inst_cep = :cep_inst,
            inst_uf = :uf_inst,
            inst_email = :email_inst,
            inst_tel1 = :tel1_inst,
            inst_tel2 = :tel2_inst
        WHERE inst_id = :cod_id"
    );

    // Vincular os parâmetros
    $sql_save_edt->bindParam(':razao_social_inst', $razao_social_inst);
    $sql_save_edt->bindParam(':cnpj_inst', $cnpj_inst);
    $sql_save_edt->bindParam(':endereco_inst', $endereco_inst);
    $sql_save_edt->bindParam(':bairro_inst', $bairro_inst);
    $sql_save_edt->bindParam(':municipio_inst', $municipio_inst);
    $sql_save_edt->bindParam(':cep_inst', $cep_inst);
    $sql_save_edt->bindParam(':uf_inst', $uf_inst);
    $sql_save_edt->bindParam(':email_inst', $email_inst);
    $sql_save_edt->bindParam(':tel1_inst', $tel1_inst);
    $sql_save_edt->bindParam(':tel2_inst', $tel2_inst);
    $sql_save_edt->bindParam(':cod_id', $cod_id, PDO::PARAM_INT);

    // Executar a consulta e verificar sucesso
    if ($sql_save_edt->execute()) {
        echo "<script>alert('Dados enviados com sucesso');
            window.location.href = '/proj_foccus/controller/imprime_instituicao.php';
            </script>";
    } else {
        echo "<script>alert('Erro ao enviar os dados.');</script>";
    }
}
?>
