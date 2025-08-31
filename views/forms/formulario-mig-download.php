<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download de Arquivo</title>
    <style>
        /* Garantindo que o conteúdo seja centralizado dentro do container dinâmico */
        .modal-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            width: 100%;
        }

        /* Estilização do formulário */
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 450px;
            text-align: center;
        }

        h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
        }

        label {
            font-size: 16px;
            color: #555;
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.3s;
            background-color: #fff;
            cursor: pointer;
        }

        select:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        /* Estilização das mensagens de erro ou sucesso */
        h3 {
            font-size: 18px;
            color: #d9534f;
        }

        .success {
            color: #28a745;
        }

        /* Link de voltar */
        .back-link {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            font-size: 16px;
            color: #007bff;
            font-weight: bold;
            transition: 0.3s;
        }

        .back-link:hover {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
</head>
<body>

<div class="modal-container">
    <div class="container">
        <h2>Selecione um arquivo para download:</h2>

        <?php
        // Caminho absoluto para o diretório onde estão os arquivos
        $directory = "C:/xampp/htdocs/proj_foccus/documentos/documentacao";  // Certifique-se de que o caminho está correto

        // Verifica se o diretório existe
        if (!is_dir($directory)) {
            echo "<h3>Erro: O diretório '$directory' não foi encontrado.</h3>";
            exit;
        }

        // Lista os arquivos no diretório
        $files = array_diff(scandir($directory), array('.', '..'));

        if (empty($files)) {
            echo "<h3>Nenhum arquivo disponível para download.</h3>";
        } else {
            ?>
            <!-- Formulário para selecionar um arquivo -->
            <form action="/proj_foccus/views/download_arquivo.php" method="get">
                <label for="file">Escolha um arquivo:</label>
                <select name="file" id="file" required>
                    <option value="">Selecione um arquivo</option>
                    <?php foreach ($files as $file): ?>
                        <option value="<?php echo htmlspecialchars($file); ?>">
                            <?php echo htmlspecialchars($file); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
                <br>
                <button type="submit" class="btn">Baixar Arquivo</button>
            </form>
            <script>
                document.querySelector('form').addEventListener('submit', function() {
                    document.getElementById('loading-message').style.display = 'flex';
                });
            </script>
            <div id="loading-message" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background:rgba(255,255,255,0.85); z-index:9999; justify-content:center; align-items:center;">
              <span style="font-size:2em; color:#007bff; display:flex; align-items:center; gap:16px;">
                <span class="spinner" style="display:inline-block; width:32px; height:32px; border:4px solid #007bff; border-top:4px solid #fff; border-radius:50%; animation: spin 1s linear infinite;"></span>
            
              </span>
            </div>
            <style>
            @keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
            }
            </style>

  </span>
</div>
<style>
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
            <?php
        }
        ?>
        <a href="index.php" class="back-link">Voltar ao Início</a>
    </div>
</div>

</body>
</html>
