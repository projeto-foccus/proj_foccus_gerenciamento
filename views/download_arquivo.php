<?php
if (isset($_GET['file'])) {
    // Caminho onde os arquivos estão armazenados
    $directory = "C:/xampp/htdocs/proj_foccus/documentos/documentacao/";  // Certifique-se de que o caminho está correto

    // Nome do arquivo solicitado
    $file = $_GET['file'];
    $filePath = $directory . $file;

    // Verifica se o arquivo existe
    if (file_exists($filePath)) {
        // Define os cabeçalhos para o download
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . basename($filePath) . '"');
        header('Content-Length: ' . filesize($filePath));
        header('Pragma: public');
        header('Cache-Control: must-revalidate');

        // Lê o arquivo e envia para o navegador
        readfile($filePath);
        exit;
    } else {
        echo "<h3>Erro: O arquivo não foi encontrado.</h3>";
    }
}
?>

