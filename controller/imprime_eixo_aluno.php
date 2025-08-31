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
$sql = "SELECT alu.alu_ra,alu.alu_nome_resp,alu.alu_id,alu.alu_inep,mat.fk_id_aluno, alu.alu_nome FROM 
aluno AS alu INNER JOIN matricula AS mat
ON alu.alu_id = mat.fk_id_aluno
 "; // Adicionando a condição WHERE para permitir a filtragem
if (!empty($nome)) {
    $sql .= "AND alu_inep LIKE :nome"; // Filtro para o nome do aluno
}
$sql .= " ORDER BY alu.alu_nome LIMIT :inicio, :quantidade";

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
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Relação de alunos</title>
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
                    
                            <td>
                                <form action="/proj_foccus/views/forms/formulario-eixos-geral.php" method="GET" style="display:inline;">
                                    <input type="hidden" name="cod_aluno" value="<?php echo $aluno['alu_id']; ?>">
                                    <button type="submit" class="btn btn-warning btn-sm">Cadastra Eixos</button>
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
                <a href="?pagina=1&nome=<?php echo urlencode($nome); ?>" class="btn btn-primary me-2">Primeira</a>
                <a href="?pagina=<?php echo $pagina_atual - 1; ?>&nome=<?php echo urlencode($nome); ?>" class="btn btn-primary me-2">Anterior</a>
            <?php endif; ?>

            <?php for ($i = 1; $i <= $total_paginas; $i++): ?>
                <a href="?pagina=<?php echo $i; ?>&nome=<?php echo urlencode($nome); ?>" class="btn btn-secondary me-2">
                    <?php echo $i; ?>
                </a>
            <?php endfor; ?>

            <?php if ($pagina_atual < $total_paginas): ?>
                <a href="?pagina=<?php echo $pagina_atual + 1; ?>&nome=<?php echo urlencode($nome); ?>" class="btn btn-primary me-2">Próxima</a>
                <a href="?pagina=<?php echo $total_paginas; ?>&nome=<?php echo urlencode($nome); ?>" class="btn btn-primary">Última</a>
            <?php endif; ?>
        </div>

        <a href="/proj_foccus/index.php" class="btn btn-primary mt-3">Voltar -> Menu</a>
    </div>
</body>
</html>

