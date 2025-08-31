<?php
require_once(__DIR__ . '../../models/conexao.php');

$arquivo = $_FILES["file"]["tmp_name"];
$nome = $_FILES["file"]["name"];

$ext = explode(".", $nome);
$extensao = end($ext);

if ($extensao != "csv") {
    echo "Arquivo não pode ser carregado. Apenas arquivos CSV são aceitos.";
} else {
    if (($handle = fopen($arquivo, 'r')) !== false) {
        fgetcsv($handle); // Ignora o cabeçalho

        $registrosInseridos = 0;
        $registrosIgnorados = 0;
        $alunosExistentes = array();

        while (($dados = fgetcsv($handle, 1000, ",")) !== false) { // <-- Aqui está a mudança: vírgula
            if (count($dados) < 9) continue;

            // Data/hora (coluna 0)
            $datetime_planilha = trim($dados[0]);
            $dateTimeObj = DateTime::createFromFormat('d/m/Y H:i:s', $datetime_planilha);
            if ($dateTimeObj) {
                $alu_dt_cad = $dateTimeObj->format('Y-m-d H:i:s');
            } else {
                $alu_dt_cad = date('Y-m-d H:i:s');
            }

            $ra_aluno    = trim($dados[1]);
            $nome_aluno  = trim($dados[2]);
            $data_nasc   = trim($dados[3]);
            $inep        = trim($dados[4]);
            $nome_resp   = trim($dados[5]);
            $grau_parent = trim($dados[6]);
            $email_resp  = trim($dados[7]);
            $tel_resp    = trim($dados[8]);

            // Converte data de nascimento
            if (strlen($data_nasc) >= 10 && strpos($data_nasc, '/') !== false) {
                $dia = substr($data_nasc, 0, 2);
                $mes = substr($data_nasc, 3, 2);
                $ano = substr($data_nasc, 6, 4);
                $nova_data_nasc = "$ano-$mes-$dia";
            } else {
                $nova_data_nasc = null;
            }

            // Verifica RA existente
            $checkStmt = $conn->prepare("SELECT alu_nome FROM aluno WHERE alu_ra = :RA_ALUNO LIMIT 1");
            $checkStmt->bindParam(":RA_ALUNO", $ra_aluno);
            $checkStmt->execute();
            $nome_existente = $checkStmt->fetchColumn();

            if ($nome_existente) {
                $alunosExistentes[] = array('ra' => $ra_aluno, 'nome' => $nome_existente);
                $registrosIgnorados++;
                continue;
            }

            try {
                $stmt = $conn->prepare("
                    INSERT INTO aluno (
                        alu_dt_cad, alu_ra, alu_nome, alu_dtnasc, alu_inep,
                        alu_nome_resp, alu_tipo_parentesco, alu_email_resp, alu_tel_resp
                    ) VALUES (
                        :DATA_ATUAL, :RA_ALUNO, :NOME, :NOVA_DATA, :INEP,
                        :NOME_RESP, :GRAU_PARENT, :EMAIL_RESP, :TEL_RESP
                    )
                ");

                $stmt->bindParam(":DATA_ATUAL", $alu_dt_cad);
                $stmt->bindParam(":RA_ALUNO", $ra_aluno);
                $stmt->bindParam(":NOME", $nome_aluno);
                $stmt->bindParam(":NOVA_DATA", $nova_data_nasc);
                $stmt->bindParam(":INEP", $inep);
                $stmt->bindParam(":NOME_RESP", $nome_resp);
                $stmt->bindParam(":GRAU_PARENT", $grau_parent);
                $stmt->bindParam(":EMAIL_RESP", $email_resp);
                $stmt->bindParam(":TEL_RESP", $tel_resp);

                if ($stmt->execute()) {
                    $registrosInseridos++;
                }
            } catch (PDOException $e) {
                echo "Erro ao inserir no banco: " . $e->getMessage() . "<br>";
            }
        }

        fclose($handle);

        // Monta a mensagem dos alunos já existentes
        $mensagemExistentes = "";
        if (count($alunosExistentes) > 0) {
            $mensagemExistentes = "\\n\\nAlunos já migrados:\\n";
            foreach ($alunosExistentes as $aluno) {
                $mensagemExistentes .= "RA: " . $aluno['ra'] . " - Nome: " . $aluno['nome'] . "\\n";
            }
        }

        echo "<script>
            alert('Importação concluída! \\nRegistros inseridos: $registrosInseridos \\nRegistros ignorados: $registrosIgnorados$mensagemExistentes');
            window.location.href = '/proj_foccus/index.php';
        </script>";
    } else {
        echo "Não foi possível abrir o arquivo.";
    }
}
?>
