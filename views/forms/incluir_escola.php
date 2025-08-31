<?php
require_once('../../models/conexao.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // Captura e sanitiza os dados enviados pelo formulário
        $data_cadastro = date('Y-m-d');

        $esc_inep = filter_input(INPUT_POST, 'esc_inep', FILTER_SANITIZE_STRING);
        $esc_cnpj = filter_input(INPUT_POST, 'esc_cnpj', FILTER_SANITIZE_STRING);
        $esc_razao_social = filter_input(INPUT_POST, 'esc_razao_social', FILTER_SANITIZE_STRING);
        $esc_endereco = filter_input(INPUT_POST, 'esc_endereco', FILTER_SANITIZE_STRING);
        $esc_bairro = filter_input(INPUT_POST, 'esc_bairro', FILTER_SANITIZE_STRING);
        $esc_municipio = filter_input(INPUT_POST, 'esc_municipio', FILTER_SANITIZE_STRING);
        $esc_cep = filter_input(INPUT_POST, 'esc_cep', FILTER_SANITIZE_STRING);
        $esc_uf = filter_input(INPUT_POST, 'esc_uf', FILTER_SANITIZE_STRING);
        $esc_telefone = filter_input(INPUT_POST, 'esc_telefone', FILTER_SANITIZE_STRING);
        $esc_email = filter_input(INPUT_POST, 'esc_email', FILTER_SANITIZE_EMAIL);

        // Verifica se todos os campos obrigatórios foram preenchidos
        if (!$esc_inep || !$esc_cnpj || !$esc_razao_social || !$esc_endereco ||
            !$esc_bairro || !$esc_municipio || !$esc_cep || !$esc_uf || !$esc_telefone || !$esc_email) {
            echo "<h1>Erro: Todos os campos obrigatórios devem ser preenchidos!</h1>";
            exit;
        }

        // Prepara a consulta para inserção no banco de dados
        $sql = "INSERT INTO escola (esc_dtcad, esc_inep, esc_cnpj, esc_razao_social,
            esc_endereco, esc_bairro, esc_municipio, esc_cep, esc_uf, esc_telefone, 
            esc_email)
            VALUES (:dtcad, 
                    :inep, :cnpj, :rsocial, :endereco,
                    :bairro, :municipio, :cep, :uf, :telefone, :email)";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':dtcad', $data_cadastro);
        $stmt->bindParam(':inep', $esc_inep);
        $stmt->bindParam(':cnpj', $esc_cnpj);
        $stmt->bindParam(':rsocial', $esc_razao_social);
        $stmt->bindParam(':endereco', $esc_endereco);
        $stmt->bindParam(':bairro', $esc_bairro);
        $stmt->bindParam(':municipio', $esc_municipio);
        $stmt->bindParam(':cep', $esc_cep);
        $stmt->bindParam(':uf', $esc_uf);
        $stmt->bindParam(':telefone', $esc_telefone);
        $stmt->bindParam(':email', $esc_email);

        // Executa a consulta
        if ($stmt->execute()) {
            echo "<div class='mensagem-sucesso text-center'>";
            echo "<h2>Escola cadastrada com sucesso!</h2>";
            echo "</div>";
            echo "<script>setTimeout(function(){ window.location.href = '/proj_foccus/controller/imprime_escola.php'; }, 2000);</script>";
        } else {
            echo "Erro ao cadastrar a escola: " . $stmt->errorInfo()[2];
        }
    } catch (PDOException $e) {
        echo "Erro ao cadastrar a escola: " . $e->getMessage();
    }
}
?>

<!-- Adicione o estilo CSS para a mensagem de sucesso -->
<style>
    .mensagem-sucesso {
        background-color: #dff0d8; /* Cor de fundo verde claro */
        color: #3e8e41; /* Cor do texto verde escuro */
        padding: 10px; /* Espaçamento interno */
        border-radius: 5px; /* Cantos arredondados */
        margin: 20px auto; /* Margem para centralizar */
        width: 80%; /* Largura para melhor visualização */
        text-align: center; /* Centraliza o texto */
    }
</style>


