<?php
require_once __DIR__ . '/../../models/conexao.php';

// Defina o valor de $cod_escola (por exemplo, vindo de um formulário ou de outro lugar)
$cod_escola = isset($_POST['cod_escola']) ? $_POST['cod_escola'] : null; // Ajuste conforme necessário

$queryVerificar = "SELECT cod_turma, fk_cod_mod, fk_inep FROM turma ORDER BY fk_cod_mod, fk_inep;";
$stmtVerificar = $conn->prepare($queryVerificar);
$stmtVerificar->execute();
$registros = $stmtVerificar->fetchAll(PDO::FETCH_ASSOC);

// Inicialize o cod_turma como 1
$cod_turma = 1;

// Variáveis para armazenar os valores anteriores de fk_cod_mod e fk_inep
$ultimo_fk_cod_mod = null;
$ultimo_fk_inep = null;

foreach ($registros as $dados) {
    // Obtendo os valores das colunas
    $cod_mod = $dados['fk_cod_mod'];
    $cod_inep = $dados['fk_inep'];

    // Verifica se os valores de fk_cod_mod e fk_inep mudaram
    if ($ultimo_fk_cod_mod !== null && ($ultimo_fk_cod_mod != $cod_mod || $ultimo_fk_inep != $cod_inep)) {
        // Se houve mudança, incrementa o cod_turma
        $cod_turma++;
    }

    // Atualiza o campo cod_turma no banco de dados
    $queryAtualizar = "UPDATE turma SET cod_turma = :cod_turma WHERE cod_turma = :cod_turma_id";
    $stmtAtualizar = $conn->prepare($queryAtualizar);
    $stmtAtualizar->bindParam(':cod_turma', $cod_turma, PDO::PARAM_INT);
    $stmtAtualizar->bindParam(':cod_turma_id', $dados['cod_turma'], PDO::PARAM_INT);
    $stmtAtualizar->execute();

    // Atualiza os valores anteriores de fk_cod_mod e fk_inep para a próxima iteração
    $ultimo_fk_cod_mod = $cod_mod;
    $ultimo_fk_inep = $cod_inep;

    // Depuração para verificar o fluxo
    echo "Atualizando cod_turma para " . $cod_turma . " onde cod_turma_id = " . $dados['cod_turma'] . "<br>";
    echo "Último fk_cod_mod: " . $ultimo_fk_cod_mod . " | Último fk_inep: " . $ultimo_fk_inep . "<br>";
}
?>
