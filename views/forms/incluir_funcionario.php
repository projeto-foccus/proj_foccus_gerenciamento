<?php
require_once('../../models/conexao.php'); // Conexão com o banco de dados

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // Captura e sanitiza os dados enviados pelo formulário
        $inep_func = filter_input(INPUT_POST, 'func_inep', FILTER_SANITIZE_STRING);
        $nome_func = filter_input(INPUT_POST, 'func_nome', FILTER_SANITIZE_STRING);
        $cpf_func = filter_input(INPUT_POST, 'func_cpf', FILTER_SANITIZE_STRING);
        $email_func = filter_input(INPUT_POST, 'func_email', FILTER_SANITIZE_EMAIL);
        $cargo_func = filter_input(INPUT_POST, 'func_desc', FILTER_SANITIZE_STRING);

        // Debug para verificar os dados
        echo "INEP: $inep_func</br>";
        echo "Nome: $nome_func</br>";
        echo "CPF: $cpf_func</br>";
        echo "Email: $email_func</br>";
        echo "Cargo: $cargo_func</br>";

        // Converte o cargo para um valor inteiro
        $cargo_func = intval($cargo_func);
        echo "Código da função (convertido para int): $cargo_func</br>";
        echo "Tipo de dado do cargo: " . gettype($cargo_func) . "</br>";

        // Verifica se todos os campos obrigatórios foram preenchidos
        if (!$inep_func || !$nome_func || !$cpf_func || !$email_func || $cargo_func === null) {
            echo "<h1>Erro: Todos os campos são obrigatórios!</h1>";
            exit;
        }

        // Prepara a consulta para inserção no banco de dados
        $stmt = $conn->prepare("
            INSERT INTO funcionario (inep, func_nome, func_cpf, email_func, func_cod_funcao)
            VALUES (:INEP, :NOME_FUNC, :CPF_FUNC, :EMAIL_FUNC, :FUNC_COD)
        ");

        // Bind dos parâmetros
        $stmt->bindParam(':INEP', $inep_func);
        $stmt->bindParam(':NOME_FUNC', $nome_func);
        $stmt->bindParam(':CPF_FUNC', $cpf_func);
        $stmt->bindParam(':EMAIL_FUNC', $email_func);
        $stmt->bindParam(':FUNC_COD', $cargo_func, PDO::PARAM_INT); // Corrigido aqui

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
                        window.location.href = "/proj_foccus/controller/imprime_funcionario.php"; // Redirecionar, se necessário
                    });
                });
            </script>';
        } else {
            echo "<h1>Não houve inserção de dados</h1>";
        }    

    } catch (PDOException $e) {
        // Exibe o erro detalhado
        echo "<h1>Erro ao buscar os dados: " . htmlspecialchars($e->getMessage()) . "</h1>";
    } catch (Exception $e) {
        // Exibe o erro inesperado
        echo "<h1>Erro inesperado: " . htmlspecialchars($e->getMessage()) . "</h1>";
    }








} else {
    echo "<h1>Requisição inválida.</h1>";
}
?>
