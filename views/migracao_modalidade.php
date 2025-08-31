<?php
// Script para processar o upload do CSV e inserir na tabela modalidade
require_once(__DIR__ . '/../models/conexao.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['file'])) {
    $arquivo = $_FILES['file']['tmp_name'];
    $nome = $_FILES['file']['name'];
    $ext = explode('.', $nome);
    $extensao = end($ext);

    if ($extensao !== 'csv') {
        echo "<script>alert('Arquivo não pode ser carregado. Apenas arquivos CSV são permitidos.'); window.location.href = '/proj_foccus/index.php';</script>";
        exit;
    }

    if (($handle = fopen($arquivo, 'r')) !== false) {
        $cabecalho = fgetcsv($handle, 0, ',');
        $idx_carimbo = array_search('Carimbo de data/hora', $cabecalho);
        $idx_inep = array_search('INEP', $cabecalho);
        $idx_modalidades = array_search('MODALIDADES', $cabecalho);
        if ($idx_inep === false || $idx_modalidades === false || $idx_carimbo === false) {
            echo "<script>alert('Colunas obrigatórias não encontradas no CSV.\nSeu cabeçalho deve ser: Carimbo de data/hora,INEP,MODALIDADES'); window.location.href = '/proj_foccus/index.php';</script>";
            exit;
        }
        $sucesso = 0;
        $erros = 0;
        $erros_msgs = [];
        $linha_atual = 0;
        while (($data = fgetcsv($handle, 0, ',')) !== false) {
            $linha_atual++;
            $modalidades_raw = trim($data[$idx_modalidades]);
            $carimbo_csv = $data[$idx_carimbo];
            $inep_escola = $data[$idx_inep];
            $dt = DateTime::createFromFormat('d/m/Y H:i:s', $carimbo_csv);
            $data_migracao = $dt ? $dt->format('Y-m-d H:i:s') : null;
            // Split robusto: remove espaços extras e ignora vazios
            $modalidades = array_filter(array_map('trim', preg_split('/\s*,\s*/', $modalidades_raw)));
            $modalidades_nao_mapeadas = [];
            foreach ($modalidades as $desc_modalidade) {
    if ($desc_modalidade !== '') {
        // Mapeamento dos nomes das modalidades para seus respectivos IDs
        $map_modalidades = [
            'Ensino Infantil' => 1,
            'Anos Iniciais 1° Ano' => 2,
            'Anos Iniciais 2° Ano' => 3,
            'Anos Iniciais 3° Ano' => 4,
            'Anos Iniciais 4° Ano' => 5,
            'Anos Iniciais 5° Ano' => 6,
            'Anos Finais 6° Ano' => 7,
            'Anos Finais 7° Ano' => 8,
            'Anos Finais 8° Ano' => 9,
            'Anos Finais 9° Ano' => 10,
            'Educação Jovens e Adultos EJA' => 11
            // Adicione outros mapeamentos conforme necessário
        ];
        $desc_modalidade_trim = trim($desc_modalidade);
        $fk_id_modalidade = isset($map_modalidades[$desc_modalidade_trim]) ? $map_modalidades[$desc_modalidade_trim] : null;
        if ($fk_id_modalidade === null) {
            $erros++;
            $erros_msgs[] = "Modalidade não mapeada: '$desc_modalidade_trim' (linha $linha_atual)";
            $modalidades_nao_mapeadas[] = $desc_modalidade_trim;
        } else {
            // Verifica duplicidade (mesmo INEP e fk_id_modalidade, independente da data)
            $check = $conn->prepare('SELECT COUNT(*) FROM modalidade WHERE inep_escola = ? AND fk_id_modalidade = ?');
            $check->execute([$inep_escola, $fk_id_modalidade]);
            $exists = $check->fetchColumn();
            if ($exists) {
                $erros++;
                $erros_msgs[] = "Duplicado: modalidade '$desc_modalidade_trim' (ID $fk_id_modalidade) para INEP '$inep_escola' (linha $linha_atual)";
                echo "<script>alert('Inep e modalidade já cadastrada. Clique em OK e você será redirecionado.'); window.location.href = '/proj_foccus/index.php';</script>";
                exit;
            }
            $stmt = $conn->prepare('INSERT INTO modalidade (fk_id_modalidade, data_migracao, inep_escola) VALUES (?, ?, ?)');
            if ($stmt->execute([$fk_id_modalidade, $data_migracao, $inep_escola])) {
                $sucesso++;
            } else {
                $erros++;
                $erros_msgs[] = "Erro ao inserir modalidade '$desc_modalidade_trim' (linha $linha_atual)";
            }
        }
    }
}
        }
        fclose($handle);
        $msg = "Importação concluída! Registros inseridos: $sucesso | Registros ignorados/duplicados: $erros";
        if (!empty($erros_msgs)) {
            $msg .= "\n\nDetalhes das duplicidades/erros:\n- " . implode("\n- ", $erros_msgs);
        }
        echo "<script>alert('" . addslashes($msg) . "'); window.location.href = '/proj_foccus/index.php';</script>";
        exit;
    } else {
        echo "<script>alert('Erro ao abrir o arquivo CSV.'); window.location.href = '/proj_foccus/index.php';</script>";
        exit;
    }
} else {
    echo "<script>alert('Acesso inválido.'); window.location.href = '/proj_foccus/index.php';</script>";
    exit;
}
