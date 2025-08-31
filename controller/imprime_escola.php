<?php
require_once('../models/conexao.php');

// Parâmetros de paginação
$registros_por_pagina = 10;
$pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
if ($pagina < 1) $pagina = 1;
$offset = ($pagina - 1) * $registros_por_pagina;

// Captura o nome pesquisado (se fornecido)
$nome = isset($_GET['nome']) ? $_GET['nome'] : '';

// Consulta para contar o total de registros (com filtro)
$sql_count = "SELECT COUNT(*) FROM escola WHERE esc_id IS NOT NULL AND esc_id != ''";
if (!empty($nome)) {
    $sql_count .= " AND esc_razao_social LIKE :nome";
}
$stmt_count = $conn->prepare($sql_count);
if (!empty($nome)) {
    $stmt_count->bindValue(':nome', '%' . $nome . '%');
}
$stmt_count->execute();
$total_registros = $stmt_count->fetchColumn();
$total_paginas = ceil($total_registros / $registros_por_pagina);

// Constrói a consulta SQL com filtro, se necessário
$sql = "SELECT *, fk_org_esc_id FROM escola WHERE esc_id IS NOT NULL AND esc_id != ''"; // Filtra registros com esc_id válido
if (!empty($nome)) {
    $sql .= " AND esc_razao_social LIKE :nome"; // Filtro para o nome da escola
}
$sql .= " ORDER BY esc_razao_social LIMIT :limit OFFSET :offset";

try {
    // Preparar a consulta para trazer os registros
    $lista = $conn->prepare($sql);
    if (!empty($nome)) {
        $lista->bindValue(':nome', '%' . $nome . '%');
    }
    $lista->bindValue(':limit', $registros_por_pagina, PDO::PARAM_INT);
    $lista->bindValue(':offset', $offset, PDO::PARAM_INT);
    $lista->execute();
    $resultados = $lista->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Erro ao executar a consulta: " . $e->getMessage();
    exit;
}

// Pega todos os parâmetros atuais para preservar filtros na paginação
$params = $_GET;
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Relação de Escolas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/proj_foccus/public/css/imprime.css" />
</head>
<body>
    <div class="container mt-4">
        <h2>Relação das Escolas</h2>

        <!-- Formulário de Pesquisa -->
        <form method="GET" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <div class="input-group mb-3">
                <input type="text" name="nome" class="form-control" placeholder="Pesquisar por escola"
                       value="<?php echo htmlspecialchars($nome); ?>">
                <button class="btn btn-primary" type="submit">Pesquisar</button>
            </div>
        </form>

        <!-- Tabela de resultados -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Cód: escola</th>
                    <th scope="col">Inep escola</th>
                    <th scope="col">Razão Social</th>
                    <th scope="col">Telefone</th>
                    <th scope="col">Email</th>                
                    <th scope="col">Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php if (count($resultados) > 0): ?>
                    <?php foreach ($resultados as $index => $escola): ?>
                        <tr>
                            <td><?php echo $offset + $index +1; ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_id']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_inep'] ?: 'Não informado'); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_razao_social']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_telefone']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_email'] ?? 'Não informado'); ?></td>
                            <td>
                                <!-- Botão Editar -->
                                <form action="/proj_foccus/views/forms/formulario-edt-escola.php" method="GET" style="display:inline;">
                                    <input type="hidden" name="edit" value="<?php echo $escola['esc_id']; ?>">
                                    <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                                </form>
                                
                                <!-- Botão Vincular -->
                                <form action="/proj_foccus/views/forms/formulario-vincular-escola.php" method="GET" style="display:inline;">
                                    <input type="hidden" name="vin_esc" value="<?php echo $escola['esc_id']; ?>">
                                    <button type="submit" class="btn btn-light-blue btn-sm" 
                                            style="background-color: #87CEFA; color: white;" 
                                            <?php echo !empty($escola['fk_org_esc_id']) ? 'disabled' : ''; ?>>
                                        Vincular
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="8" class="text-center">Nenhuma escola encontrada.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>

        <!-- Paginação -->
        <?php if ($total_paginas > 1): ?>
        <nav aria-label="Navegação de página">
            <ul class="pagination justify-content-center">
                <?php
                // Link para primeira página e anterior
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
                // Número máximo de links exibidos
                $max_links = 7;
                $start = max(1, $pagina - intval($max_links / 2));
                $end = min($total_paginas, $start + $max_links - 1);
                if ($end - $start + 1 < $max_links) {
                    $start = max(1, $end - $max_links + 1);
                }

                for ($i = $start; $i <= $end; $i++):
                    $params['pagina'] = $i;
                    $link_pagina = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
                ?>
                <li class="page-item <?php echo ($pagina === $i) ? 'active' : ''; ?>">
                    <a class="page-link" href="<?php echo htmlspecialchars($link_pagina); ?>"><?php echo $i; ?></a>
                </li>
                <?php endfor; ?>

                <?php
                // Link próxima e última página
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
