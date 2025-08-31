<?php
require_once('../../models/conexao.php');

// Verificar o método da requisição
if ($_SERVER["REQUEST_METHOD"] == "POST") {  
    try {
        // Capturar os dados do formulário com sanitização
        $razao_social = filter_input(INPUT_POST, 'desc_inst', FILTER_SANITIZE_STRING);
        $cnpj = filter_input(INPUT_POST, 'cnpj_inst', FILTER_SANITIZE_STRING);
        $endereco = filter_input(INPUT_POST, 'endereco_inst', FILTER_SANITIZE_STRING);
        $bairro = filter_input(INPUT_POST, 'bairro_inst', FILTER_SANITIZE_STRING);
        $municipio = filter_input(INPUT_POST, 'municipio_inst', FILTER_SANITIZE_STRING);
        $cep = filter_input(INPUT_POST, 'cep_inst', FILTER_SANITIZE_STRING);
        $uf = filter_input(INPUT_POST, 'inst_uf', FILTER_SANITIZE_STRING);



        $email = filter_input(INPUT_POST, 'email_inst', FILTER_SANITIZE_EMAIL);
        
        

        $telefone = filter_input(INPUT_POST, 'telefone_inst', FILTER_SANITIZE_STRING);
        $telefone2 = filter_input(INPUT_POST, 'telefone2_inst', FILTER_SANITIZE_STRING);

        // Preparar a consulta SQL
        $stmt = $conn->prepare("INSERT INTO instituicao (
            inst_razaosocial, inst_cnpj, inst_endereco, inst_bairro, inst_municipio, inst_cep,
            inst_uf, inst_email, inst_tel1, inst_tel2
        ) VALUES (
            :RAZAO_SOCIAL, :INST_CNPJ, :INST_END, :INST_BAIRRO, :INST_MUN, :INST_CEP, 
            :INST_UF, :INST_EMAIL, :INST_TEL, :INST_TEL2
        )");

        // Associar os parâmetros
        $stmt->bindParam(":RAZAO_SOCIAL", $razao_social);
        $stmt->bindParam(":INST_CNPJ", $cnpj);
        $stmt->bindParam(":INST_END", $endereco);
        $stmt->bindParam(":INST_BAIRRO", $bairro);
        $stmt->bindParam(":INST_MUN", $municipio);
        $stmt->bindParam(":INST_CEP", $cep);
        $stmt->bindParam(":INST_UF", $uf);
        $stmt->bindParam(":INST_EMAIL", $email);
        $stmt->bindParam(":INST_TEL", $telefone);
        $stmt->bindParam(":INST_TEL2", $telefone2);

        // Executar a consulta
        if ($stmt->execute()) {
            // Modal de sucesso com JavaScript
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
                        <h2>Dados enviados com sucesso!</h2>
                        <p>A instituição foi cadastrada com sucesso no sistema.</p>
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
                        window.location.href = "/proj_foccus/controller/imprime_instituicao.php"; // Redirecionar para outra página, se necessário
                    });
                });
            </script>';
        } else {
            echo "<h1>Não houve inserção de dados</h1>";
        }
    } catch (PDOException $e) {
        echo "Erro ao inserir dados: " . $e->getMessage();
    }
}
?>


?>