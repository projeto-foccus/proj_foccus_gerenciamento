<?php
require_once('../models/conexao.php');

// Parâmetros de paginação
$registros_por_pagina = 10;
$pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
if ($pagina < 1) $pagina = 1;
$offset = ($pagina - 1) * $registros_por_pagina;

// Parâmetro de busca
$nome = isset($_GET['nome']) ? $_GET['nome'] : '';

// Consulta para contar o total de registros (com filtro)
$sql_count = "SELECT COUNT(*) FROM funcionario as fun 
INNER JOIN tipo_funcao as tpf ON fun.func_cod_funcao = tpf.tipo_funcao_id";
if (!empty($nome)) {
    $sql_count .= " WHERE fun.func_nome LIKE :nome";
}
$stmt_count = $conn->prepare($sql_count);
if (!empty($nome)) {
    $stmt_count->bindValue(':nome', '%' . $nome . '%');
}
$stmt_count->execute();
$total_registros = $stmt_count->fetchColumn();
$total_paginas = ceil($total_registros / $registros_por_pagina);

// Consulta principal com LIMIT e OFFSET
$sql = "SELECT fun.func_id, fun.func_nome, fun.func_cpf, fun.email_func, fun.func_cod_funcao, tpf.tipo_funcao_id, tpf.desc_tipo_funcao
FROM funcionario as fun
INNER JOIN tipo_funcao as tpf ON fun.func_cod_funcao = tpf.tipo_funcao_id";
if (!empty($nome)) {
    $sql .= " WHERE fun.func_nome LIKE :nome";
}
$sql .= " ORDER BY fun.func_nome LIMIT :limit OFFSET :offset";
$lista = $conn->prepare($sql);
if (!empty($nome)) {
    $lista->bindValue(':nome', '%' . $nome . '%');
}
$lista->bindValue(':limit', $registros_por_pagina, PDO::PARAM_INT);
$lista->bindValue(':offset', $offset, PDO::PARAM_INT);
$lista->execute();
$resultados = $lista->fetchAll(PDO::FETCH_ASSOC);

// Pega todos os parâmetros atuais para preservar filtros na paginação
$params = $_GET;
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/proj_foccus/public/css/imprime.css"> 
<title>Lista de Funcionários</title>
</head>
<body>
<div class="container mt-4">
    <h2>Lista de Funcionários</h2>

    <!-- Formulário de Pesquisa -->
    <form method="GET" action="">
        <div class="input-group mb-3">
            <input type="text" name="nome" class="form-control" placeholder="Pesquisar nome de funcionário"
                   value="<?php echo htmlspecialchars($nome); ?>">
            <button class="btn btn-primary" type="submit">Pesquisar</button>
        </div>
    </form>

    <!-- Tabela de Resultados -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Id Funcionário</th>
                <th scope="col">Nome Funcionário</th>
                <th scope="col">Cpf do Funcionário</th>
                <th scope="col">Email do Funcionário</th>
                <th scope="col">Função do servidor</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php if (count($resultados) > 0): ?>
                <?php $contador = $offset + 1; ?>
                <?php foreach ($resultados as $funcionario): ?>
                    <tr>
                        <td><?php echo $contador++; ?></td>
                        <td><?php echo htmlspecialchars($funcionario['func_id']); ?></td>
                        <td><?php echo htmlspecialchars($funcionario['func_nome']); ?></td>
                        <td><?php echo htmlspecialchars($funcionario['func_cpf']); ?></td>
                        <td><?php echo htmlspecialchars($funcionario['email_func']); ?></td>
                        <td><?php echo htmlspecialchars($funcionario['desc_tipo_funcao']); ?></td>
                        <td>
                            <form action="/proj_foccus/views/forms/formulario-edt-funcionario.php" method="GET" style="display:inline;">
                                <input type="hidden" name="edit" value="<?php echo $funcionario['func_id']; ?>">
                                <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="10" class="text-center">Nenhum funcionário encontrado.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <!-- Paginação -->
    <?php if ($total_paginas > 1): ?>
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <?php
            // Botão Primeira e Anterior
            if ($pagina > 1):
                $params['pagina'] = 1;
                $link_primeira = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
                $params['pagina'] = $pagina - 1;
                $link_anterior = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
            ?>
            <li class="page-item">
                <a class="page-link" href="<?php echo htmlspecialchars($link_primeira); ?>">Primeira</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<?php echo htmlspecialchars($link_anterior); ?>">Anterior</a>
            </li>
            <?php endif; ?>

            <?php
            // Números das páginas - exibir até 5 páginas centradas
            $max_links = 5;
            $start = max(1, $pagina - floor($max_links / 2));
            $end = min($total_paginas, $start + $max_links -1);
            if ($end - $start + 1 < $max_links) {
                $start = max(1, $end - $max_links + 1);
            }

            for ($i = $start; $i <= $end; $i++):
                $params['pagina'] = $i;
                $link_pagina = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
            ?>
            <li class="page-item <?php echo ($pagina == $i) ? 'active' : ''; ?>">
                <a class="page-link" href="<?php echo htmlspecialchars($link_pagina); ?>"><?php echo $i; ?></a>
            </li>
            <?php endfor; ?>

            <?php
            // Próxima e Última
            if ($pagina < $total_paginas):
                $params['pagina'] = $pagina + 1;
                $link_proxima = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
                $params['pagina'] = $total_paginas;
                $link_ultima = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
            ?>
            <li class="page-item">
                <a class="page-link" href="<?php echo htmlspecialchars($link_proxima); ?>">Próxima</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<?php echo htmlspecialchars($link_ultima); ?>">Última</a>
            </li>
            <?php endif; ?>
        </ul>
    </nav>
    <?php endif; ?>

    <a href="/proj_foccus/index.php" class="btn btn-primary mt-3">Voltar -> Menu</a>
</div>
</body>
</html>
