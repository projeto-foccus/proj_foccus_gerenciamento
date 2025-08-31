<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once(__DIR__ . '../../models/conexao.php');
header('Content-Type: application/json');

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_FILES['file'])) {
        throw new Exception('Requisição inválida');
    }

    $arquivo = $_FILES["file"]["tmp_name"];
    $nome = $_FILES["file"]["name"];
    $extensao = pathinfo($nome, PATHINFO_EXTENSION);

    if (strtolower($extensao) !== "csv") {
        throw new Exception('Apenas arquivos CSV são permitidos!');
    }

    if (($handle = fopen($arquivo, 'r')) === false) {
        throw new Exception('Erro ao ler arquivo');
    }

    fgetcsv($handle, 1000, ";"); // Pula cabeçalho
    $registrosInseridos = 0;
    $registrosIgnorados = 0;
    $alunosExistentes = [];

    while (($dados = fgetcsv($handle, 1000, ";")) !== false) {
        if (count($dados) < 8) continue;

        $ra_aluno = trim(mb_convert_encoding($dados[0], 'UTF-8', 'ISO-8859-1'));
        $nome_aluno = mb_convert_encoding($dados[1], 'UTF-8', 'ISO-8859-1');

        // Verifica duplicidade
        $checkStmt = $conn->prepare("SELECT alu_nome FROM aluno WHERE alu_ra = :ra");
        $checkStmt->bindParam(':ra', $ra_aluno);
        $checkStmt->execute();
        $nome_existente = $checkStmt->fetchColumn();

        if ($nome_existente) {
            $registrosIgnorados++;
            $alunosExistentes[] = ['ra' => $ra_aluno, 'nome' => $nome_existente];
            continue;
        }

        // Ajuste para sua estrutura de banco:
        $data_nasc = DateTime::createFromFormat('d/m/Y', $dados[2]);
        $nova_data_nasc = $data_nasc ? $data_nasc->format('Y-m-d') : null;
        $inep = mb_convert_encoding($dados[3], 'UTF-8', 'ISO-8859-1');
        $nome_resp = mb_convert_encoding($dados[4], 'UTF-8', 'ISO-8859-1');
        $grau_parent = mb_convert_encoding($dados[5], 'UTF-8', 'ISO-8859-1');
        $email_resp = mb_convert_encoding($dados[6], 'UTF-8', 'ISO-8859-1');
        $tel_resp = mb_convert_encoding($dados[7], 'UTF-8', 'ISO-8859-1');
        $data_atual = date('Y-m-d');

        $stmt = $conn->prepare("INSERT INTO aluno 
            (alu_dt_cad, alu_ra, alu_nome, alu_dtnasc, alu_inep, alu_nome_resp, alu_tipo_parentesco, alu_email_resp, alu_tel_resp)
            VALUES
            (:cad, :ra, :nome, :dtnasc, :inep, :resp, :parentesco, :email, :tel)");
        $stmt->execute([
            ':cad' => $data_atual,
            ':ra' => $ra_aluno,
            ':nome' => $nome_aluno,
            ':dtnasc' => $nova_data_nasc,
            ':inep' => $inep,
            ':resp' => $nome_resp,
            ':parentesco' => $grau_parent,
            ':email' => $email_resp,
            ':tel' => $tel_resp
        ]);
        $registrosInseridos++;
    }
    fclose($handle);

    echo json_encode([
        'status' => 'success',
        'inseridos' => $registrosInseridos,
        'ignorados' => $registrosIgnorados,
        'existentes' => $alunosExistentes
    ]);
} catch (Exception $e) {
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}
exit;
?>
