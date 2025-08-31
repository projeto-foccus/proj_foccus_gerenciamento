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
$sql = "SELECT * FROM aluno WHERE 1"; // Adicionando a condição WHERE para permitir a filtragem
if (!empty($nome)) {
    $sql .= " AND alu_nome LIKE :nome"; // Filtro para o nome do aluno
}
$sql .= " ORDER BY alu_nome LIMIT :inicio, :quantidade";

// Preparar a consulta para trazer apenas os registros da página atual
$lista = $conn->prepare($sql);
if (!empty($nome)) {
    $lista->bindValue(':nome', '%' . $nome . '%');
}
$lista->bindValue(':inicio', $inicio, PDO::PARAM_INT);
$lista->bindValue(':quantidade', $registros_por_pagina, PDO::PARAM_INT);
$lista->execute();
$resultados = $lista->fetchAll(PDO::FETCH_ASSOC);

// Consulta para obter o número total de registros
$sql_total = "SELECT COUNT(*) FROM aluno WHERE 1";
if (!empty($nome)) {
    $sql_total .= " AND alu_nome LIKE :nome";
}
$total_resultados = $conn->prepare($sql_total);
if (!empty($nome)) {
    $total_resultados->bindValue(':nome', '%' . $nome . '%');
}
$total_resultados->execute();
$total = $total_resultados->fetchColumn();

// Calcular o número total de páginas
$total_paginas = ceil($total / $registros_por_pagina);

// Pega todos os parâmetros atuais para preservar filtros na paginação
$params = $_GET;
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relação de alunos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/proj_foccus/public/css/imprime.css"> 
</head>
<body>
    <div class="container mt-4">
        <h2>Relação dos alunos</h2>
        
        <!-- Formulário de pesquisa -->
        <form method="GET" action="">
            <div class="input-group mb-3">
                <input type="text" name="nome" class="form-control" placeholder="Pesquisa por aluno"
                       value="<?php echo htmlspecialchars($nome); ?>">
                <button class="btn btn-primary" type="submit">Pesquisar</button>
            </div>
        </form>

        <!-- Tabela de resultados -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">RA do aluno</th>
                    <th scope="col">Nome do aluno</th>
                    <th scope="col">Responsável</th>
                    <th scope="col">Tel. Responsável</th>
                    <th scope="col">Email</th>                
                    <th scope="col">Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php if (count($resultados) > 0): ?>
                    <?php foreach ($resultados as $aluno): ?>
                        <tr>
                            <td>#</td>
                            <td><?php echo htmlspecialchars($aluno['alu_ra']); ?></td>
                            <td><?php echo htmlspecialchars($aluno['alu_nome']); ?></td>
                            <td><?php echo htmlspecialchars($aluno['alu_nome_resp']); ?></td>
                            <td><?php echo htmlspecialchars($aluno['alu_tel_resp']); ?></td>
                            <td><?php echo htmlspecialchars($aluno['alu_email_resp']); ?></td>
                            <td>
                                <form action="/proj_foccus/views/forms/formulario-edt-aluno.php" method="GET" style="display:inline;">
                                    <input type="hidden" name="edit" value="<?php echo $aluno['alu_id']; ?>">
                                    <button type="submit" class="btn btn-warning btn-sm px-5">Editar</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="7" class="text-center">Nenhum aluno encontrado.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>

        <!-- Navegação entre páginas -->
        <div class="d-flex justify-content-center">
            <?php if ($pagina_atual > 1): ?>
                <?php
                $params['pagina'] = 1;
                $link_primeira = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);

                $params['pagina'] = $pagina_atual - 1;
                $link_anterior = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
                ?>
                <a href="<?php echo htmlspecialchars($link_primeira); ?>" class="btn btn-primary me-2">Primeira</a>
                <a href="<?php echo htmlspecialchars($link_anterior); ?>" class="btn btn-primary me-2">Anterior</a>
            <?php endif; ?>

            <?php for ($i = 1; $i <= $total_paginas; $i++): ?>
                <?php
                $params['pagina'] = $i;
                $link_pagina = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
                ?>
                <a href="<?php echo htmlspecialchars($link_pagina); ?>" class="btn <?php echo ($i == $pagina_atual) ? 'btn-secondary' : 'btn-outline-secondary'; ?> me-2">
                    <?php echo $i; ?>
                </a>
            <?php endfor; ?>

            <?php if ($pagina_atual < $total_paginas): ?>
                <?php
                $params['pagina'] = $pagina_atual + 1;
                $link_proxima = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);

                $params['pagina'] = $total_paginas;
                $link_ultima = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
                ?>
                <a href="<?php echo htmlspecialchars($link_proxima); ?>" class="btn btn-primary me-2">Próxima</a>
                <a href="<?php echo htmlspecialchars($link_ultima); ?>" class="btn btn-primary">Última</a>
            <?php endif; ?>
        </div>

        <a href="/proj_foccus/index.php" class="btn btn-primary mt-3">Voltar -> Menu</a>
    </div>
</body>
</html>
