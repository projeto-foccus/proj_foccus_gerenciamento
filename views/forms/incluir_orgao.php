<?php
require_once('../../models/conexao.php'); // Conexão com o banco de dados

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // Captura e sanitiza os dados enviados pelo formulário
        $razao_social = filter_input(INPUT_POST, 'desc_org', FILTER_SANITIZE_STRING);
        $cnpj = filter_input(INPUT_POST, 'cnpj_org', FILTER_SANITIZE_STRING);
        $endereco = filter_input(INPUT_POST, 'endereco_org', FILTER_SANITIZE_STRING);
        $bairro = filter_input(INPUT_POST, 'bairro_org', FILTER_SANITIZE_STRING);
        $municipio = filter_input(INPUT_POST, 'municipio_org', FILTER_SANITIZE_STRING);
        $cep = filter_input(INPUT_POST, 'cep_org', FILTER_SANITIZE_STRING);
        $uf = filter_input(INPUT_POST, 'uf_org', FILTER_SANITIZE_STRING);
        $email = filter_input(INPUT_POST, 'email_org', FILTER_SANITIZE_EMAIL);
        $telefone = filter_input(INPUT_POST, 'telefone_org', FILTER_SANITIZE_STRING);
        $telefone2 = filter_input(INPUT_POST, 'tel02_org', FILTER_SANITIZE_STRING);
        $fk_org_inst = filter_input(INPUT_POST, 'inst_id', FILTER_SANITIZE_STRING);

        // Verifica se todos os campos obrigatórios foram preenchidos
        if (!$razao_social || !$cnpj || !$email || !$telefone || !$telefone2 || !$endereco) {
            echo "<h1>Erro: Todos os campos obrigatórios devem ser preenchidos!</h1>";
            exit;
        }

        // Prepara a consulta para inserção no banco de dados
        $stmt = $conn->prepare("
            INSERT INTO orgao (org_razaosocial, org_cnpj, org_endereco, org_bairro, org_municipio, org_cep,
             org_uf, org_email, org_tel1, org_tel2, fk_org_inst_id)
            VALUES (:razao_social, :cnpj, :endereco, :bairro, :municipio, :cep, :uf, :email, :telefone, :telefone2, :fk_org_inst)
        ");

        // Bind dos parâmetros
        $stmt->bindParam(':razao_social', $razao_social);
        $stmt->bindParam(':cnpj', $cnpj);
        $stmt->bindParam(':endereco', $endereco);
        $stmt->bindParam(':bairro', $bairro);
        $stmt->bindParam(':municipio', $municipio);
        $stmt->bindParam(':cep', $cep);
        $stmt->bindParam(':uf', $uf);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':telefone', $telefone);
        $stmt->bindParam(':telefone2', $telefone2);
        $stmt->bindParam(':fk_org_inst', $fk_org_inst);

        // Executa a consulta
        if ($stmt->execute()) {
            echo '<script>
                document.addEventListener("DOMContentLoaded", function() {
                    const modal = document.createElement("div");
                    modal.style.position = "fixed";
                    modal.style.top = "0";
                    modal.style.left = "0";
                    modal.style.width = "100%";
                    modal.style.height = "100%";
                    modal.style.backgroundColor = "rgba(0, 0, 0, 0.5)";
                    modal.style.display = "flex";
                    modal.style.justifyContent = "center";
                    modal.style.alignItems = "center";
                    modal.style.zIndex = "1000";

                    const content = document.createElement("div");
                    content.style.background = "white";
                    content.style.padding = "20px";
                    content.style.borderRadius = "10px";
                    content.style.textAlign = "center";
                    content.style.boxShadow = "0px 4px 10px rgba(0, 0, 0, 0.1)";

                    content.innerHTML = `
                        <h2 style="color: #4CAF50;">Sucesso!</h2>
                        <p>Os dados foram cadastrados com sucesso no sistema.</p>
                        <button id="closeModal" style="
                            background-color: #4CAF50;
                            color: white;
                            padding: 10px 20px;
                            border: none;
                            border-radius: 5px;
                            cursor: pointer;
                        ">Fechar</button>
                    `;

                    modal.appendChild(content);
                    document.body.appendChild(modal);

                    document.getElementById("closeModal").addEventListener("click", function() {
                        modal.remove();
                     window.location.href = "/proj_foccus/controller/imprime_orgao.php"; // Redirecionar para outra página, se necessário
                    });
                });
            </script>';
        } else {
            echo "<h1>Erro: Não foi possível inserir os dados.</h1>";
        }
    } catch (PDOException $e) {
        echo "<h1>Erro ao inserir dados: " . htmlspecialchars($e->getMessage()) . "</h1>";
    } catch (Exception $e) {
        echo "<h1>Erro inesperado: " . htmlspecialchars($e->getMessage()) . "</h1>";
    }
} else {
    echo "<h1>Requisição inválida.</h1>";
}
?>
