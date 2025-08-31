<?php
require_once __DIR__ . '/../../models/conexao.php';

// Captura o nome pesquisado (se fornecido)
$nome = isset($_GET['nome']) ? $_GET['nome'] : '';

// Inicializa a variável $resultados como um array vazio
$resultados = [];

try {
    // Constrói a consulta SQL com filtro, incluindo a verificação do campo esc_inep
    $sql = "SELECT * FROM escola WHERE esc_inep IS NOT NULL AND esc_inep != ''";
    
    // Se houver um filtro de nome, adiciona à consulta
    if (!empty($nome)) {
        $sql .= " AND esc_razao_social LIKE :nome";
    }

    $sql .= " ORDER BY esc_razao_social";

    $lista = $conn->prepare($sql);
    
    // Se houver um nome, faz a ligação da variável à consulta
    if (!empty($nome)) {
        $lista->bindValue(':nome', '%' . $nome . '%');
    }
    
    // Executa a consulta
    $lista->execute();
    
    // Armazena os resultados
    $resultados = $lista->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    // Log ou exibição de erro (opcional)
    echo "Erro ao buscar escolas: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Relação de Escolas</title>
</head>
<body>
    <div class="container mt-4">
        <h2>Relação das Escolas</h2>
        
        <!-- Formulário de pesquisa -->
        <form method="GET" action="">
            <div class="input-group mb-3">
                <input type="text" name="nome" class="form-control" placeholder="Pesquisa por escola"
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
                    <th scope="col">CNPJ</th>
                    <th scope="col">Telefone</th>
                    <th scope="col">Email</th>                
                    <th scope="col">Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php if (count($resultados) > 0): ?>
                    <?php foreach ($resultados as $escola): ?>
                        <tr>
                            <td>#</td>
                            <td><?php echo htmlspecialchars($escola['esc_id']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_inep']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_razao_social']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_cnpj']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_telefone']); ?></td>
                            <td><?php echo htmlspecialchars($escola['esc_email'] ?? 'Não informado'); ?></td>
                            <td>
                                <div class="d-inline-flex gap-1">
                                    <!-- Botão Editar 
                                    <form action="/proj_foccus/views/forms/formulario-edt-escola.php" method="GET" class="d-inline">
                                        <input type="hidden" name="edit" value="<?php echo $escola['esc_id']; ?>">
                                        <button type="submit" class="btn btn-warning btn-sm">Editar</button>
                                    </form>
                    -->
                                    <!-- Botão Enturma Escola -->
                                   
                                    <form action="/proj_foccus/controller/imprime_eixo_aluno.php" method="GET" class="d-inline">
                                        <input type="hidden" name="nome" value="<?php echo $escola['esc_inep']; ?>">
                                        <button type="submit" class="btn btn-primary btn-sm">Alunos Matriculados</button>
                                    </form>

                                </div>
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
        <a href="/proj_foccus/index.php" class="btn btn-primary">Voltar ao Menu</a>
    </div>
</body>
</html>
