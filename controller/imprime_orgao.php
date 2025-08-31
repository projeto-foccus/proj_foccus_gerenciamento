<?php
require_once('../models/conexao.php');

// Configurações
$registros_por_pagina = 10;

// Recebe os parâmetros 'pagina' e 'nome' do GET
$pagina_atual = isset($_GET['pagina']) && is_numeric($_GET['pagina']) && $_GET['pagina'] > 0 ? (int)$_GET['pagina'] : 1;
$nome = isset($_GET['nome']) ? trim($_GET['nome']) : '';

// Calcula OFFSET para a query
$offset = ($pagina_atual - 1) * $registros_por_pagina;

try {
    // Consulta principal
    if ($nome !== '') {
        $sql = "SELECT * FROM orgao WHERE org_razaosocial LIKE :nome ORDER BY org_razaosocial LIMIT :offset, :limit";
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':nome', "%$nome%", PDO::PARAM_STR);
    } else {
        $sql = "SELECT * FROM orgao ORDER BY org_razaosocial LIMIT :offset, :limit";
        $stmt = $conn->prepare($sql);
    }

    // Bind dos valores OFFSET e LIMIT são sempre inteiros
    $stmt->bindValue(':offset', (int)$offset, PDO::PARAM_INT);
    $stmt->bindValue(':limit', (int)$registros_por_pagina, PDO::PARAM_INT);

    $stmt->execute();
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Consulta contagem total para paginação
    if ($nome !== '') {
        $count_sql = "SELECT COUNT(*) FROM orgao WHERE org_razaosocial LIKE :nome";
        $stmt_count = $conn->prepare($count_sql);
        $stmt_count->bindValue(':nome', "%$nome%", PDO::PARAM_STR);
    } else {
        $count_sql = "SELECT COUNT(*) FROM orgao";
        $stmt_count = $conn->prepare($count_sql);
    }
    $stmt_count->execute();
    $total_registros = (int)$stmt_count->fetchColumn();

    $total_paginas = max(1, ceil($total_registros / $registros_por_pagina));

} catch (PDOException $e) {
    die("Erro na consulta: " . $e->getMessage());
}

// Pega todos os parâmetros atuais para preservar filtros na paginação
$params = $_GET;
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<title>Paginação com Filtro</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-4">
    <h2>Lista de Orgãos</h2>

    <form method="GET" action="">
        <input type="hidden" name="pagina" value="1" />
        <div class="input-group mb-3">
            <input type="text" name="nome" class="form-control" placeholder="Pesquisar por Razão Social"
                value="<?php echo htmlspecialchars($nome); ?>" />
            <button class="btn btn-primary" type="submit">Pesquisar</button>
        </div>
    </form>

    <?php if (count($resultados) === 0): ?>
        <p class="alert alert-warning">Nenhum órgão encontrado.</p>
    <?php else: ?>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Id Orgão</th>
                    <th>Razão Social</th>
                    <th>Email</th>
                    <th>Telefone(01)</th>
                    <th>Telefone(02)</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php $contador = $offset + 1; ?>
                <?php foreach ($resultados as $orgao): ?>
                <tr>
                    <td><?php echo $contador++; ?></td>
                    <td><?php echo htmlspecialchars($orgao['org_id']); ?></td>
                    <td><?php echo htmlspecialchars($orgao['org_razaosocial']); ?></td>
                    <td><?php echo htmlspecialchars($orgao['org_email']); ?></td>
                    <td><?php echo htmlspecialchars($orgao['org_tel1'] ?? 'Não informado'); ?></td>
                    <td><?php echo htmlspecialchars($orgao['org_tel2'] ?? 'Não informado'); ?></td>
                    <td>
                        <div class="d-flex gap-2">
                            <form action="/proj_foccus/views/forms/formulario-edt-orgao.php" method="GET" style="display:inline;">
                                <input type="hidden" name="edit" value="<?php echo $orgao['org_id']; ?>">
                                <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                            </form>
                            <form action="/proj_foccus/views/forms/formulario-vincular_orgao.php" method="GET" style="display:inline;">
                                <input type="hidden" name="vin_org" value="<?php echo $orgao['org_id']; ?>">
                                <button type="submit" class="btn btn-info btn-sm" 
                                    <?php echo !empty($orgao['fk_org_inst_id']) ? 'disabled' : ''; ?>>
                                    Vincular Órgão
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <!-- Navegação entre páginas usando bootstrap e preservando todos os parâmetros -->
        <nav aria-label="Navegação das páginas">
            <ul class="pagination justify-content-center">
                <?php
                // Link para primeira página
                if ($pagina_atual > 1):
                    $params['pagina'] = 1;
                    $link_primeira = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);

                    $params['pagina'] = $pagina_atual - 1;
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
                // Mostrar links de página - limite para não ficar muito extenso
                $max_links = 7;
                $start = max(1, $pagina_atual - intval($max_links / 2));
                $end = min($total_paginas, $start + $max_links - 1);
                if ($end - $start + 1 < $max_links) {
                    $start = max(1, $end - $max_links + 1);
                }
                for ($i = $start; $i <= $end; $i++):
                    $params['pagina'] = $i;
                    $link_pagina = $_SERVER['PHP_SELF'] . '?' . http_build_query($params);
                ?>
                    <li class="page-item <?php echo ($i === $pagina_atual) ? 'active' : ''; ?>">
                        <a class="page-link" href="<?php echo htmlspecialchars($link_pagina); ?>"><?php echo $i; ?></a>
                    </li>
                <?php endfor; ?>

                <?php
                // Link próxima e última página
                if ($pagina_atual < $total_paginas):
                    $params['pagina'] = $pagina_atual + 1;
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

    <!-- Botão Voltar ao Menu -->
    <a href="/proj_foccus/index.php" class="btn btn-primary mt-3">Voltar -> Menu</a>
</div>
</body>
</html>
