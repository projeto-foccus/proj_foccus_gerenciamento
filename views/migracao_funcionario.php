<?php
// Função para normalizar cargos (deve estar sempre disponível)
if (!function_exists('normaliza_cargo')) {
    function normaliza_cargo($str) {
        $str = trim($str);
        $str = rtrim($str, ":;. \t\n\r\0\x0B");
        $str = mb_strtolower($str, 'UTF-8');
        $str = preg_replace('/[áàãâä]/u', 'a', $str);
        $str = preg_replace('/[éèêë]/u', 'e', $str);
        $str = preg_replace('/[íìîï]/u', 'i', $str);
        $str = preg_replace('/[óòõôö]/u', 'o', $str);
        $str = preg_replace('/[úùûü]/u', 'u', $str);
        $str = preg_replace('/[ç]/u', 'c', $str);
        $str = preg_replace('/\s+/', ' ', $str); // remove espaços duplicados
        return $str;
    }
}
// migracao_funcionario.php: apenas PROCESSA o upload, não exibe formulário!
// Recebe POST do formulario-mig-funcionario.php

// --- INÍCIO DO PROCESSAMENTO ---

// Exemplo de conexão (ajuste conforme seu projeto):
require_once(__DIR__ . '/../models/conexao.php'); // ajuste caminho conforme necessário

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['file'])) {
    $arquivo = $_FILES['file']['tmp_name'];
    $nome = $_FILES['file']['name'];
    $ext = explode('.', $nome);
    $extensao = strtolower(end($ext));

    if ($extensao !== 'csv') {
        echo "<script>alert('Arquivo não pode ser carregado. Apenas arquivos CSV são permitidos.'); window.location.href = '/proj_foccus/views/forms/formulario-mig-funcionario.php';</script>";
        exit;
    }

    if (($handle = fopen($arquivo, 'r')) !== false) {
        // Detecta delimitador automaticamente
        $linha_teste = fgets($handle);
        $delimitador = (substr_count($linha_teste, ';') > substr_count($linha_teste, ',')) ? ';' : ',';
        rewind($handle);
        $cabecalho = fgetcsv($handle, 0, $delimitador);
        // indices fixos: 1-INEP, 2-NOME, 3-CPF, 4-EMAIL, 5-CARGO (0 = Carimbo de data/hora)
        $idx_inep = 1;
        $idx_nome = 2;
        $idx_cpf = 3;
        $idx_email = 4;
        $idx_cargo = 5;
        $sucesso = 0;
        $erros = 0;
        $erros_msgs = [];
        $cpfs_duplicados = []; // array de arrays: [['cpf' => ..., 'nome' => ...], ...]
        $linha_atual = 0;

        while (($data = fgetcsv($handle, 0, $delimitador)) !== false) {
            // Ignora linhas totalmente vazias
            if (empty(array_filter($data, fn($v) => trim($v) !== ''))) {
                continue;
            }
            $linha_atual++;
            $data = array_map('trim', $data);
            if (count($data) < 6) {
                $erros++;
                $erros_msgs[] = "Linha $linha_atual ignorada - Número de colunas insuficiente: " . count($data) . " - Conteúdo: " . implode(' | ', $data);
                continue;
            }
            $inep_func   = $data[$idx_inep];
            $nome_func   = trim($data[$idx_nome]);
            $cpf_func    = preg_replace('/\D/', '', trim($data[$idx_cpf])); // normaliza CPF
            $email_func  = strtolower(trim($data[$idx_email])); // normaliza e-mail
            $cargo_func  = $data[$idx_cargo];
            
            // Usa a função normaliza_cargo definida fora do loop
            $cargo_func_normalizado = normaliza_cargo($cargo_func);
            
            // Define a data atual para o cadastro
            $fun_data_cad = date('Y-m-d H:i:s');
            // Mapeia cargo para código
            
            switch ($cargo_func_normalizado) {
                case 'diretor(a) / gestor(a) escolar':      $valor_func = 2; break;
                case 'diretor(a) / gestor(a) de escola':    $valor_func = 2; break;
                case 'vice diretor(a) de escola':           $valor_func = 3; break;
                case 'coordenador(a)':                      $valor_func = 4; break;
                case 'supervisor(a) escolar':               $valor_func = 5; break;
                case 'professor(a)':                        $valor_func = 6; break;
                case 'professor(a) aee':                    $valor_func = 7; break;
                case 'psicopedagogo(a)':                    $valor_func = 8; break;
                case 'terapeuta ocupacional':               $valor_func = 9; break;
                case 'psicologo(a)':                        $valor_func = 10; break;
                case 'fonoaudiologo(a)':                    $valor_func = 11; break;
                case 'coordenador(a) aee':                  $valor_func = 12; break;
                case 'professor(a) regular / especialista': $valor_func = 13; break;
                default: $valor_func = null; break;
            }
             
            if ($valor_func === null) {
                 
                $erros++;
                // Loga cargos não mapeados em arquivo
                file_put_contents(
                    __DIR__ . '/../logs/cargo_nao_mapeado.log',
                    date('Y-m-d H:i:s') . " | Linha $linha_atual | Original: '$cargo_func' | Normalizado: '$cargo_func_normalizado'\n",
                    FILE_APPEND
                );
                $erros_msgs[] = "Cargo não mapeado: '$cargo_func' (normalizado: '$cargo_func_normalizado') (linha $linha_atual)";
                continue;
            }
            // Verifica duplicidade (mesmo CPF)
             
            $check = $conn->prepare('SELECT COUNT(*) FROM funcionario WHERE func_cpf = ?');
            $check->execute([$cpf_func]);
            $exists = $check->fetchColumn();
            if (intval($exists) > 0) {
                $erros++;
                $cpfs_duplicados[] = ['cpf' => $cpf_func, 'nome' => $nome_func];
                $erros_msgs[] = "Duplicado: CPF '$cpf_func' (linha $linha_atual)";
                continue;
            }
            // email_verified_at sempre em branco
            $email_verified_at = '';
            $sql = "INSERT INTO funcionario (
                func_data_cad, inep, func_nome, func_cpf, email_func, password, func_cod_funcao, remember_token, email_verified_at, created_at, updated_at
            ) VALUES (?, ?, ?, ?, ?, ?, ?, NULL, ?, ?, NULL)";
            $stmt = $conn->prepare($sql);
            $exec_result = $stmt->execute([
                $fun_data_cad,
                $inep_func,
                $nome_func,
                $cpf_func,
                $email_func,
                $cpf_func, // senha igual ao CPF
                $valor_func,
                $email_verified_at,
                $fun_data_cad
            ]);
             
            if ($exec_result) {
                $sucesso++;
            } else {
                $erros++;
                $errorInfo = $stmt->errorInfo();
                $erros_msgs[] = "Erro ao inserir funcionário '$nome_func' (linha $linha_atual): " . $errorInfo[2];
            }
        } // fecha while
        fclose($handle);
        $msg = "Importação concluída! Registros inseridos: $sucesso | Registros ignorados/duplicados/erro: $erros";
        if (!empty($cpfs_duplicados)) {
            $msg .= "\n\nCPFs já existentes na base:";
            foreach($cpfs_duplicados as $dup) {
                $msg .= "\n- " . $dup['cpf'] . " | " . $dup['nome'];
            }
        }
        // Exibe alerta estilizado se houver duplicados
        if (!empty($erros_msgs)) {
            $msg .= "\n\nDetalhes:\n- " . implode("\n- ", $erros_msgs);
        }
        echo "<script>alert(`$msg`); window.location.href = '../index.php';</script>";
        exit;
    } else {
        echo "<script>alert('Erro ao abrir o arquivo CSV.'); window.location.href = '/proj_foccus/index.php';</script>";
        exit;
    }
} else {
    echo "<script>alert('Acesso inválido.'); window.location.href = '/proj_foccus/index.php';</script>";
    exit;
}
