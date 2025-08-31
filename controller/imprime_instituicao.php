<?php
require_once('../models/conexao.php');

// Número de registros por página
$registros_por_pagina = 20;

// Captura o número da página atual, se fornecido
$pagina_atual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
$inicio = ($pagina_atual - 1) * $registros_por_pagina;

// Captura o nome pesquisado (se fornecido)
$nome = isset($_GET['nome']) ? $_GET['nome'] : '';

// Constrói a consulta SQL com filtro, se necessário
$sql = "SELECT * FROM instituicao WHERE 1";
if (!empty($nome)) {
    $sql .= " AND inst_razaosocial LIKE :nome";
}
$sql .= " ORDER BY inst_razaosocial LIMIT :inicio, :quantidade";

$lista = $conn->prepare($sql);
if (!empty($nome)) {
    $lista->bindValue(':nome', '%' . $nome . '%');
}
$lista->bindValue(':inicio', $inicio, PDO::PARAM_INT);
$lista->bindValue(':quantidade', $registros_por_pagina, PDO::PARAM_INT);
$lista->execute();
$resultados = $lista->fetchAll(PDO::FETCH_ASSOC);

$sql_total = "SELECT COUNT(*) FROM instituicao WHERE 1";
if (!empty($nome)) {
    $sql_total .= " AND inst_razaosocial LIKE :nome";
}
$total_resultados = $conn->prepare($sql_total);
if (!empty($nome)) {
    $total_resultados->bindValue(':nome', '%' . $nome . '%');
}
$total_resultados->execute();
$total = $total_resultados->fetchColumn();

$total_paginas = ceil($total / $registros_por_pagina);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
          <link rel="stylesheet" href="/proj_foccus/public/css/imprime.css"> 
    <title>Lista de Órgãos</title>

    <style>
        /* Ajuste a largura das colunas da tabela */
        .table th, .table td {
            white-space: nowrap;  /* Previne a quebra de linha */
            text-overflow: ellipsis;  /* Adiciona reticências se o texto for muito longo */
            overflow: hidden;  /* Esconde o excesso de texto que ultrapassa o limite */
        }

        /* Defina a largura de colunas específicas */
        .table th:nth-child(1), .table td:nth-child(1) {
            width: 5%;
        }

        .table th:nth-child(2), .table td:nth-child(2) {
            width: 10%;
        }

        .table th:nth-child(3), .table td:nth-child(3) {
            width: 20%;
        }

        .table th:nth-child(4), .table td:nth-child(4) {
            width: 15%;
        }

        .table th:nth-child(5), .table td:nth-child(5) {
            width: 10%;
        }

        .table th:nth-child(6), .table td:nth-child(6) {
            width: 20%;
        }

        .table th:nth-child(7), .table td:nth-child(7) {
            width: 15%;
        }

        .table th:nth-child(8), .table td:nth-child(8) {
            width: 15%;
        }

        .table th:nth-child(9), .table td:nth-child(9) {
            width: 10%;
        }
    </style>
</head>
<body class="container mt-4">
    <h2 class="mb-4">Relação das Instituições</h2>

    <!-- Formulário de Pesquisa -->
    <form method="GET" action="" id="pesquisa-form">
        <div class="input-group mb-3">
            <input type="text" name="nome" class="form-control" placeholder="Pesquisar por Razão Social"
                   value="<?php echo htmlspecialchars($nome); ?>">
            <button class="btn btn-primary" type="submit">Pesquisar</button>
        </div>
    </form>

    <!-- Tabela de Resultados -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Razão Social</th>
                <th scope="col">Email</th>
                <th scope="col">Telefone Contato</th>
                <th scope="col">Celular</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php if (count($resultados) > 0): ?>
                <?php foreach ($resultados as $instituicao): ?>
                    <tr>
                        <td>#</td>
                        <td><?php echo htmlspecialchars($instituicao['inst_razaosocial']); ?></td>
                        <td><?php echo htmlspecialchars($instituicao['inst_email']); ?></td>
                        <td><?php echo htmlspecialchars($instituicao['inst_tel1'] ?? 'Não informado'); ?></td>
                        <td><?php echo htmlspecialchars($instituicao['inst_tel2'] ?? 'Não informado'); ?></td>
                        <td>
                            <form action="/proj_foccus/views/forms/formulario-edt-instituicao.php" method="GET" style="display:inline;">
                                <input type="hidden" name="edit" value="<?php echo $instituicao['inst_id']; ?>">
                                <button type="submit" class="btn btn-warning btn-sm px-5">Editar</button>

                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="9" class="text-center">Nenhuma instituição encontrada.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <a href="/proj_foccus/index.php" class="btn btn-primary mt-3">Voltar -> Menu</a>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76A2Y49AUrhNjmbJrPENh3Fh0e2wB0t3S1L7l3oJpYg2EkUkhKtr9F5P6f2e8Y"
            crossorigin="anonymous"></script>
</body>
</html>
