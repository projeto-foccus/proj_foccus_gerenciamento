<?php
require_once('../models/conexao.php');

if (isset($_POST['update'])) {
    // Sanitizar inputs
    $cod_id = filter_input(INPUT_POST, 'alu_id', FILTER_SANITIZE_NUMBER_INT);
    $alu_nome = filter_input(INPUT_POST, 'nome_aluno', FILTER_SANITIZE_STRING);
    $alu_dt_nasc = filter_input(INPUT_POST, 'dtnasc', FILTER_SANITIZE_STRING);
    $nome_resp = filter_input(INPUT_POST, 'nome_resp', FILTER_SANITIZE_STRING);
    $tipo_parentesco = filter_input(INPUT_POST, 'tipo_parentesco', FILTER_SANITIZE_STRING);
    $email_resp = filter_input(INPUT_POST, 'email_resp', FILTER_SANITIZE_STRING);
    $tel_resp = filter_input(INPUT_POST, 'tel_resp', FILTER_SANITIZE_STRING);
   
    // Preparar a consulta de atualização
    $sql_save_edt = $conn->prepare(
        "UPDATE aluno SET 
            alu_nome = :P_alu_nome,
            alu_dtnasc = :P_alu_dt_nasc,
            alu_nome_resp = :P_alu_nome_resp,
            alu_tipo_parentesco = :P_alu_tipo_parentesco,
            alu_email_resp =:P_alu_email_resp,
            alu_tel_resp =:P_alu_tel_resp
        WHERE alu_id = :cod_id"
    );

    // Vincular os parâmetros
    $sql_save_edt->bindParam(':P_alu_nome', $alu_nome);
    $sql_save_edt->bindParam(':P_alu_dt_nasc', $alu_dt_nasc);
    $sql_save_edt->bindParam(':P_alu_nome_resp', $nome_resp);
    $sql_save_edt->bindParam(':P_alu_tipo_parentesco', $tipo_parentesco);
    $sql_save_edt->bindParam(':P_alu_email_resp', $email_resp);
    $sql_save_edt->bindParam(':P_alu_tel_resp', $tel_resp);
    $sql_save_edt->bindParam(':cod_id', $cod_id, PDO::PARAM_INT);

    // Executar a consulta e verificar sucesso
    if ($sql_save_edt->execute()) {
        echo "<script>alert('Dados enviados com sucesso');
            window.location.href = '/proj_foccus/controller/imprime_aluno.php';
            </script>";
    } else {
        echo "<script>alert('Erro ao enviar os dados.');</script>";
    }
}
?>
