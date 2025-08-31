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
            width: 700px;
            margin: 50px auto;
            text-align: center;
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
            align-items: center;
        }

        label.custom-file-upload {
            background-color: #e9ecef;
            border: 2px dashed #ced4da;
            padding: 15px 30px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 18px;
            color: #666;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        label.custom-file-upload:hover {
            background-color: #dee2e6;
            transform: scale(1.02);
        }

        input[type="file"] {
            display: none;
        }

        #file-chosen {
            margin-top: 15px;
            font-size: 16px;
            color: #555;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
            padding: 12px 25px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .form-group {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .back-link {
            text-decoration: underline;
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Anexe o arquivo funcionario.csv abaixo</h2>
        
        <form action="/proj_foccus/views/migracao_funcionario.php" method="POST" enctype="multipart/form-data">
            
            <div class="upload-message">
                Clique no botão abaixo para selecionar o arquivo.
            </div>

            <div class="form-group">
                <label for="file" class="custom-file-upload">
                    <i class="fa fa-upload"></i> Escolher arquivo
                </label>
                <input type="file" id="file" name="file">
                <span id="file-chosen">Nenhum arquivo escolhido</span>
            </div>

            <button type="submit" class="btn-primary">Enviar</button>
            <a href="index.php" class="back-link">Voltar ao Início</a>
        </form>
    </div>

    <script>
        const fileInput = document.getElementById('file');
        const fileChosen = document.getElementById('file-chosen');

        fileInput.addEventListener('change', () => {
            fileChosen.textContent = fileInput.files.length > 0 ? fileInput.files[0].name : "Nenhum arquivo escolhido";
        });
    </script>
</body>
</html>