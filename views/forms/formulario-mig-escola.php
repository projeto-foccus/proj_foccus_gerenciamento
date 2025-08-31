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

        .drop-zone {
            width: 100%;
            height: 150px;
            padding: 25px;
            border: 2px dashed #ced4da;
            border-radius: 10px;
            text-align: center;
            font-size: 16px;
            color: #666;
            cursor: pointer;
            margin-bottom: 20px;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .drop-zone.highlight {
            border-color: #007bff;
            background-color: #e9ecef;
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
        .back-link {
            text-decoration: underline;
            color: #0056b3;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Anexe o arquivo escola.csv abaixo</h2>
        
        <form action="/proj_foccus/views/migracao_escola.php" method="POST" enctype="multipart/form-data">
            <div class="upload-message">Clique no botão abaixo para selecionar o arquivo.</div>
            
            <div class="file-upload">
                <div class="drop-zone">
                    Arraste e solte o arquivo aqui ou clique para selecionar
                </div>
                <label for="file" class="custom-file-upload">
                    <i class="fa fa-upload"></i> Escolher arquivo
                </label>
                <input type="file" id="file" name="file">
                <span id="file-chosen">Nenhum arquivo escolhido</span>
            </div>

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
        const dropZone = document.querySelector('.drop-zone');

        fileInput.addEventListener('change', () => {
            fileChosen.textContent = fileInput.files.length > 0 ? fileInput.files[0].name : "Nenhum arquivo escolhido";
        });

        dropZone.addEventListener('click', () => fileInput.click());
        dropZone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropZone.classList.add('highlight');
        });

        dropZone.addEventListener('dragleave', () => {
            dropZone.classList.remove('highlight');
        });

        dropZone.addEventListener('drop', (e) => {
            e.preventDefault();
            dropZone.classList.remove('highlight');
            const files = e.dataTransfer.files;
            fileInput.files = files;
            fileChosen.textContent = files.length > 0 ? files[0].name : "Nenhum arquivo escolhido";
        });
            document.querySelector('form').addEventListener('submit', function() {
            document.getElementById('loading-message').style.display = 'flex';
        });
    </script>
</body>
</html>
