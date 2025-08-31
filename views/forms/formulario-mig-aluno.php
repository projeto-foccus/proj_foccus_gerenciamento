<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload de Arquivo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 700px; /* Container maior */
            margin: 50px auto; /* Centraliza o container */
            text-align: center; /* Centraliza o conteúdo */
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .upload-message {
            font-size: 16px; 
            color: #444; 
            margin-bottom: 20px; 
        }

        .file-upload {
            display: flex;
            flex-direction: column;
            align-items: center; /* Centraliza os elementos */
        }

        label.custom-file-upload {
            background-color: #e9ecef;
            border: 2px dashed #ced4da; /* Borda mais visível */
            padding: 15px 30px; /* Mais espaçamento interno */
            border-radius: 10px; /* Bordas arredondadas maiores */
            cursor: pointer;
            font-size: 18px; /* Texto maior */
            color: #666;
            transition: background-color 0.3s ease, transform 0.2s ease; 
        }

        label.custom-file-upload:hover {
            background-color: #dee2e6; 
            transform: scale(1.02); /* Efeito de zoom no hover */
        }

        input[type="file"] {
            display: none; /* Esconde o input padrão */
        }

        #file-chosen {
            margin-top: 15px; /* Espaçamento maior */
            font-size: 16px; 
            color: #555;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
            padding: 12px 25px; /* Botão maior */
            font-size: 18px; /* Texto maior */
            border-radius: 8px; /* Bordas arredondadas */
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* Efeito de zoom no hover */
        }

        .form-group {
            display: flex;
            flex-direction: column;
            align-items: center; /* Centraliza os elementos horizontalmente */
        }

        .back-link:hover {
            text-decoration: underline;
            color: #0056b3;
        }
        .back-link {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Anexe o arquivo aluno.csv abaixo</h2>
        
        <form action="/proj_foccus/views/migracao_aluno.php" method="POST" enctype="multipart/form-data">
            
                <!-- Mensagem de instrução -->
                <div class="upload-message">
                    Clique no botão abaixo para selecionar o arquivo.
                </div>

                <!-- Botão customizado para upload -->
                <div class="form-group">
                    <label for="file" class="custom-file-upload">
                        <i class="fa fa-upload"></i> Escolher arquivo
                    </label>
                    <!-- Input invisível -->
                    <input type="file" id="file" name="file">
                    <!-- Nome do arquivo escolhido -->
                    <span id="file-chosen">Nenhum arquivo escolhido</span>
                </div>

                <!-- Botão de envio -->
                <button type="submit" class="btn-primary">Enviar</button>
                <a href="index.php" class="back-link">Voltar ao Início</a>
            
        </form>
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
    </div>

    <script>
        const fileInput = document.getElementById('file');
        const fileChosen = document.getElementById('file-chosen');

        // Atualiza o nome do arquivo escolhido
        fileInput.addEventListener('change', () => {
            fileChosen.textContent = fileInput.files.length > 0 ? fileInput.files[0].name : "Nenhum arquivo escolhido";
        });
            document.querySelector('form').addEventListener('submit', function() {
            document.getElementById('loading-message').style.display = 'flex';
        });
    </script>
</body>
</html>
