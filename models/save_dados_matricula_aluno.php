<?php
require_once('../models/conexao.php');
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['gerar_matricula'])) {
    if (empty($_POST['modalidade_selecionada'])) {
        $_SESSION['mensagem'] = 'Por favor, selecione uma modalidade antes de gerar a matrícula.';
        header('Location: ../views/forms/formulario-matricular-aluno.php');
        exit();
    } elseif (empty($_POST['alunos_selecionados']) || !is_array($_POST['alunos_selecionados'])) {
        $_SESSION['mensagem'] = 'Nenhum aluno selecionado para gerar matrícula.';
        header('Location: ../views/forms/formulario-matricular-aluno.php');
        exit();
    } else {
        $modalidade_selecionada = filter_var($_POST['modalidade_selecionada'], FILTER_SANITIZE_NUMBER_INT);
        $ano_atual = (int) date("Y");
        $cod_valor_turma = isset($_POST['cod_valor_turma']) ? $_POST['cod_valor_turma'] : '';
        if (empty($cod_valor_turma)) {
            $_SESSION['mensagem'] = 'Erro: Não foi possível obter o código da turma.';
            header('Location: ../views/forms/formulario-matricular-aluno.php');
            exit();
        }
        $conn->beginTransaction();
        try {
            foreach ($_POST['alunos_selecionados'] as $aluno_id) {
                $check_query = "SELECT 1 FROM matricula WHERE fk_id_aluno = :fk_id_alun AND ano_matricula = :ano_atual";
                $stmt_check = $conn->prepare($check_query);
                $stmt_check->bindValue(':fk_id_alun', (int)$aluno_id, PDO::PARAM_INT);
                $stmt_check->bindValue(':ano_atual', $ano_atual, PDO::PARAM_INT);
                $stmt_check->execute();
                if (!$stmt_check->fetch()) {
                    // Buscar o RA do aluno
                    $sql_ra = "SELECT alu_ra FROM aluno WHERE alu_id = :aluno_id LIMIT 1";
                    $stmt_ra = $conn->prepare($sql_ra);
                    $stmt_ra->bindValue(':aluno_id', (int)$aluno_id, PDO::PARAM_INT);
                    $stmt_ra->execute();
                    $aluno_ra = $stmt_ra->fetchColumn();
                    $numero_matricula = ($aluno_ra ? $aluno_ra : $aluno_id) . '-' . $ano_atual;
                    if (empty($numero_matricula) || empty($cod_valor_turma) || empty($ano_atual) || empty($aluno_id) || empty($modalidade_selecionada)) {
                        throw new Exception("Dados incompletos para o aluno ID {$aluno_id}.");
                    }
                    $serie_selecionada = isset($_POST['serie_selecionada']) ? filter_var($_POST['serie_selecionada'], FILTER_SANITIZE_NUMBER_INT) : null;
                    $periodo = isset($_POST['periodo']) ? filter_var($_POST['periodo'], FILTER_SANITIZE_STRING) : null;
                    if (empty($serie_selecionada) || empty($periodo)) {
                        throw new Exception('Série e período são obrigatórios.');
                    }
                    $sql_insert_matricula = "INSERT INTO matricula (numero_matricula, fk_cod_valor_turma, ano_matricula, fk_id_aluno, fk_cod_mod, fk_id_serie, periodo)
                                             VALUES (:numero_matricula, :fk_cod_valor_turma, :ano_matricula, :fk_id_alun, :fk_cod_mod, :fk_id_serie, :periodo)";
                    $stmt_insert_matricula = $conn->prepare($sql_insert_matricula);
                    $stmt_insert_matricula->bindValue(':numero_matricula', $numero_matricula, PDO::PARAM_STR);
                    $stmt_insert_matricula->bindValue(':fk_cod_valor_turma', $cod_valor_turma, PDO::PARAM_STR);
                    $stmt_insert_matricula->bindValue(':ano_matricula', $ano_atual, PDO::PARAM_INT);
                    $stmt_insert_matricula->bindValue(':fk_id_alun', (int)$aluno_id, PDO::PARAM_INT);
                    $stmt_insert_matricula->bindValue(':fk_cod_mod', (int)$modalidade_selecionada, PDO::PARAM_INT);
                    $stmt_insert_matricula->bindValue(':fk_id_serie', (int)$serie_selecionada, PDO::PARAM_INT);
                    $stmt_insert_matricula->bindValue(':periodo', $periodo, PDO::PARAM_STR);
                    $stmt_insert_matricula->execute();
                }
            }
            $conn->commit();
            $_SESSION['mensagem'] = 'Matrículas geradas com sucesso!';
        } catch (Exception $e) {
            $conn->rollBack();
            error_log("Erro ao processar matrículas: " . $e->getMessage());
            $_SESSION['mensagem'] = 'Erro ao gerar matrículas: ' . $e->getMessage();
        }
        header('Location: ../views/forms/formulario-matricular-aluno.php');
        exit();
    }
} else {
    header('Location: ../views/forms/formulario-matricular-aluno.php');
    exit();
}