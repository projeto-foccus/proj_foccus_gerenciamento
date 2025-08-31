<?php
require_once('../models/conexao.php');

// Verifica se o formulário foi submetido
if (isset($_POST['update'])) {
    // Captura os valores enviados pelo formulário com validação
    $esc_id = isset($_POST['esc_id']) ? htmlspecialchars($_POST['esc_id']) : null;
    $desc_esc = isset($_POST['desc_esc']) ? htmlspecialchars($_POST['desc_esc']) : null; // Opcional, se necessário
    $org_id = isset($_POST['org_id']) ? htmlspecialchars($_POST['org_id']) : null;

    // Verifica se os campos obrigatórios estão presentes
    if (!$esc_id || !$org_id) {
        echo "Erro: Campos obrigatórios não foram enviados.";
        exit;
    }

    try {
        // Atualiza o campo fk_org_esc_id com o valor de org_id
        $query = "UPDATE escola SET fk_org_esc_id = :org_id WHERE esc_id = :esc_id";
        $stmt = $conn->prepare($query);

        // Faz a ligação dos parâmetros
        $stmt->bindParam(':org_id', $org_id, PDO::PARAM_INT);
        $stmt->bindParam(':esc_id', $esc_id, PDO::PARAM_INT);

        // Executa a atualização
        $stmt->execute();

        // Redireciona ou exibe mensagem de sucesso
        echo "Registro atualizado com sucesso!";
       header("Location: /proj_foccus/controller/imprime_escola.php");
        exit;

    } catch (PDOException $e) {
        // Caso haja erro na execução
        echo "Erro ao atualizar o registro: " . $e->getMessage();
        exit;
    }
} else {
    echo "Nenhum dado foi enviado para atualização.";
    exit;
}
?>
