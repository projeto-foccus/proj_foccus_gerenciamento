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
        $escolasExistentes = array();

        // Altere o delimitador se necessário (para ;)
        while (($dados = fgetcsv($handle, 1000, ",")) !== false) {
            if (count($dados) < 11) continue;

            // Processamento do carimbo de data/hora (coluna 0)
            $datetime_planilha = trim($dados[0]);
            $dateTimeObj = DateTime::createFromFormat('d/m/Y H:i:s', $datetime_planilha);
            if ($dateTimeObj) {
                $esc_dtcad = $dateTimeObj->format('Y-m-d H:i:s');
            } else {
                $esc_dtcad = date('Y-m-d H:i:s');
            }

            // Mapeamento das colunas ajustado para escola
            $esc_inep = trim($dados[1]);
            $esc_cnpj = trim($dados[2]);
            $esc_razao_social = trim($dados[3]);
            $esc_endereco = trim($dados[4]);
            $esc_bairro = trim($dados[5]);
            $esc_municipio = trim($dados[6]);
            $esc_cep = trim($dados[7]);
            $esc_uf = trim($dados[8]);
            $esc_telefone = trim($dados[9]);
            $esc_email = trim($dados[10]);

            // Verifica se INEP já existe
            $checkStmt = $conn->prepare("SELECT esc_razao_social FROM escola WHERE esc_inep = :INEP LIMIT 1");
            $checkStmt->bindParam(":INEP", $esc_inep);
            $checkStmt->execute();
            $escola_existente = $checkStmt->fetchColumn();

            if ($escola_existente) {
                $escolasExistentes[] = array('inep' => $esc_inep, 'nome' => $escola_existente);
                $registrosIgnorados++;
                continue;
            }

            try {
                $stmt = $conn->prepare("
                    INSERT INTO escola (
                        esc_dtcad, esc_inep, esc_cnpj, esc_razao_social,
                        esc_endereco, esc_bairro, esc_municipio, esc_cep,
                        esc_uf, esc_telefone, esc_email
                    ) VALUES (
                        :DATA_CAD, :INEP, :CNPJ, :RAZAO_SOCIAL,
                        :ENDERECO, :BAIRRO, :MUNICIPIO, :CEP,
                        :UF, :TELEFONE, :EMAIL
                    )
                ");

                $stmt->bindParam(":DATA_CAD", $esc_dtcad);
                $stmt->bindParam(":INEP", $esc_inep);
                $stmt->bindParam(":CNPJ", $esc_cnpj);
                $stmt->bindParam(":RAZAO_SOCIAL", $esc_razao_social);
                $stmt->bindParam(":ENDERECO", $esc_endereco);
                $stmt->bindParam(":BAIRRO", $esc_bairro);
                $stmt->bindParam(":MUNICIPIO", $esc_municipio);
                $stmt->bindParam(":CEP", $esc_cep);
                $stmt->bindParam(":UF", $esc_uf);
                $stmt->bindParam(":TELEFONE", $esc_telefone);
                $stmt->bindParam(":EMAIL", $esc_email);

                if ($stmt->execute()) {
                    $registrosInseridos++;
                }
            } catch (PDOException $e) {
                echo "Erro ao inserir no banco: " . $e->getMessage() . "<br>";
            }
        }

        fclose($handle);

        // Mensagem de resultado
        $mensagemExistentes = "";
        if (count($escolasExistentes) > 0) {
            $mensagemExistentes = "\\n\\nEscolas já cadastradas:\\n";
            foreach ($escolasExistentes as $escola) {
                $mensagemExistentes .= "INEP: " . $escola['inep'] . " - Nome: " . $escola['nome'] . "\\n";
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
