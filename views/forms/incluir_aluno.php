<?php
// Habilitar exibição de erros do PHP
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once('../../models/conexao.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {  
    try {
        // Data de cadastro (hoje)
        $alu_dtcad = date("Y-m-d");

        // Sanitização dos dados recebidos
        $alu_ra = filter_input(INPUT_POST, 'ra_alu', FILTER_SANITIZE_NUMBER_INT);
        $alu_nome = filter_input(INPUT_POST, 'nome_alu', FILTER_SANITIZE_STRING);
        $alu_dtnasc = filter_input(INPUT_POST, 'dtnasc_alu'); // Pode validar o formato depois
        $alu_inep = filter_input(INPUT_POST, 'inep_alu', FILTER_SANITIZE_NUMBER_INT);
        $alu_resp = filter_input(INPUT_POST, 'resp_alu', FILTER_SANITIZE_STRING);
        $alu_tipo_resp = filter_input(INPUT_POST, 'tiporesp_alu', FILTER_SANITIZE_STRING);
        $alu_email_resp = filter_input(INPUT_POST, 'email_resp', FILTER_SANITIZE_EMAIL);
        $alu_tel_resp = filter_input(INPUT_POST, 'telefone_resp', FILTER_SANITIZE_STRING);

        // Converte os campos de texto para maiúsculas
        $alu_nome = strtoupper($alu_nome);
        $alu_resp = strtoupper($alu_resp);
        $alu_tipo_resp = strtoupper($alu_tipo_resp);

        // Preparando a consulta SQL
        $stmt = $conn->prepare("INSERT INTO aluno (
                alu_dt_cad, alu_ra, alu_nome, alu_dtnasc, alu_inep,
                alu_nome_resp, alu_tipo_parentesco, alu_email_resp, alu_tel_resp)
            VALUES (
                :ALU_DT_CAD, :ALU_RA, :ALU_NOME, :ALU_DTNASC, :ALU_INEP,
                :ALU_NOME_RESP, :ALU_TIPO_PARENTESCO, :ALU_EMAIL_RESP, :ALU_TEL_RESP)");

        // Vinculando os parâmetros
        $stmt->bindParam(":ALU_DT_CAD", $alu_dtcad);
        $stmt->bindParam(":ALU_RA", $alu_ra);
        $stmt->bindParam(":ALU_NOME", $alu_nome);
        $stmt->bindParam(":ALU_DTNASC", $alu_dtnasc);
        $stmt->bindParam(":ALU_INEP", $alu_inep);
        $stmt->bindParam(":ALU_NOME_RESP", $alu_resp);
        $stmt->bindParam(":ALU_TIPO_PARENTESCO", $alu_tipo_resp);
        $stmt->bindParam(":ALU_EMAIL_RESP", $alu_email_resp);
        $stmt->bindParam(":ALU_TEL_RESP", $alu_tel_resp);

        // Executando e verificando o resultado
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
                        <h2>Sucesso!</h2>
                        <p>Os dados foram enviados com sucesso.</p>
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
                        window.location.href = "/proj_foccus/controller/imprime_aluno.php"; // Redirecionar, se necessário
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
