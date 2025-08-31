<?php
session_start();

require_once __DIR__ . '/../../models/conexao.php';



$pesquisa_nome = isset($_GET['pesquisa_nome']) ? filter_var($_GET['pesquisa_nome'], FILTER_SANITIZE_STRING) : '';
$esc_inep = isset($_GET['enturmar_aluno']) ? filter_var($_GET['enturmar_aluno'], FILTER_SANITIZE_STRING) : '';
$modalidade_selecionada = isset($_GET['modalidade_selecionada']) ? filter_var($_GET['modalidade_selecionada'], FILTER_SANITIZE_NUMBER_INT) : '';

$escolas = [];
$resultados = [];
$modalidades_info = [];

try {
    // Mostra apenas escolas que estão em enturmacao (fk_id_escola) e turma (fk_inep)
    $sql_escolas = "SELECT esc_inep, esc_razao_social FROM escola ORDER BY esc_razao_social";
    $stmt_escolas = $conn->prepare($sql_escolas);
    $stmt_escolas->execute();
    $escolas = $stmt_escolas->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    error_log("Erro ao buscar escolas: " . $e->getMessage());
}

// DEBUG: Mostrar alunos por escola
try {
    $sql_debug = "SELECT e.esc_inep, e.esc_razao_social, a.alu_nome
                  FROM escola e
                  LEFT JOIN aluno a ON a.alu_inep = e.esc_inep
                  ORDER BY e.esc_inep, a.alu_nome";
    $stmt_debug = $conn->prepare($sql_debug);
    $stmt_debug->execute();
    $debug_alunos_por_escola = $stmt_debug->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $debug_alunos_por_escola = [];
    error_log('Erro ao buscar debug de alunos por escola: ' . $e->getMessage());
}

if (!empty($esc_inep)) {
    // 1. Verifica se existe funcionário autorizado (cargo 6,7,13) para o INEP da escola
    $func_autorizado = false;
    try {
        $sql_func = "SELECT 1 FROM funcionario WHERE inep = :esc_inep AND func_cod_funcao IN (6,7,13) LIMIT 1";
        $stmt_func = $conn->prepare($sql_func);
        $stmt_func->bindValue(':esc_inep', $esc_inep);
        $stmt_func->execute();
        $func_autorizado = (bool)$stmt_func->fetchColumn();
    } catch (PDOException $e) {
        error_log("Erro ao buscar funcionário autorizado: " . $e->getMessage());
    }
    
    // Buscar modalidades disponíveis na escola via tabela turma
    $modalidades_info = [];
    if (!empty($esc_inep)) {
        try {
            // Consulta corrigida para buscar apenas modalidades da escola selecionada
            $sql_modalidades = "SELECT m.id_modalidade, m.fk_id_modalidade, tm.desc_modalidade
                            FROM modalidade m
                            INNER JOIN tipo_modalidade tm ON m.fk_id_modalidade = tm.id_tipo_modalidade
                            WHERE m.inep_escola = :esc_inep
                            ORDER BY tm.desc_modalidade";
            $stmt_modalidades = $conn->prepare($sql_modalidades);
            $stmt_modalidades->bindValue(':esc_inep', $esc_inep, PDO::PARAM_STR);
            $stmt_modalidades->execute();
            $modalidades_info = $stmt_modalidades->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Erro ao buscar modalidades: " . $e->getMessage());
            $modalidades_info = [];
        }
    }

    // NOVO FLUXO: Buscar alunos assim que a escola for selecionada (independente da modalidade)

// DEBUG ABSOLUTO
if (isset($modalidades_info)) {
    echo '<pre style="background: #ffe; color: #222; border: 1px solid #ccc; padding: 8px; z-index:9999; position:relative;">';
    echo 'DEBUG $modalidades_info:' . PHP_EOL;
    print_r($modalidades_info);
    echo '</pre>';
}

    if (!empty($esc_inep)) {
        try {
            if (!empty($modalidade_selecionada)) {
                $sql_alunos = "SELECT a.*
                    FROM aluno a
                    WHERE a.alu_inep = :esc_inep
                    AND a.alu_id NOT IN (
                        SELECT m.fk_id_aluno FROM matricula m
                        WHERE m.fk_cod_mod = :modalidade_selecionada
                    )
                    ORDER BY a.alu_nome";
                $stmt_alunos = $conn->prepare($sql_alunos);
                $stmt_alunos->bindValue(':esc_inep', $esc_inep);
                $stmt_alunos->bindValue(':modalidade_selecionada', $modalidade_selecionada, PDO::PARAM_INT);
                $stmt_alunos->execute();
                $resultados = $stmt_alunos->fetchAll(PDO::FETCH_ASSOC);
            } else {
                $sql_alunos = "SELECT a.*
                    FROM aluno a
                    WHERE a.alu_inep = :esc_inep
                    ORDER BY a.alu_nome";
                $stmt_alunos = $conn->prepare($sql_alunos);
                $stmt_alunos->bindValue(':esc_inep', $esc_inep);
                $stmt_alunos->execute();
                $resultados = $stmt_alunos->fetchAll(PDO::FETCH_ASSOC);
            }
        } catch (PDOException $e) {
            error_log("Erro ao buscar alunos: " . $e->getMessage());
        }
    } else {
        $resultados = [];
        $_SESSION['mensagem'] = "Selecione a escola para listar os alunos.";
    }
} else {
    $resultados = [];
    $_SESSION['mensagem'] = "Selecione a escola para começar o processo de matrícula.";
}

?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Gerar Matrícula</title>
</head>
<body>

<div class="container mt-5">
    
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Matrícula de Alunos - Passo a Passo</h4>
        </div>
        <div class="card-body">
            <!-- Etapa 1: Escolha a Escola -->
            <form id="formMatricula" class="row g-3 align-items-end mb-3" autocomplete="off">
                <div class="col-md-6">
                    <label for="escolaSelect" class="form-label">1. Escolha a Escola</label>
                    <div class="input-group">
                        <select class="form-select" id="escolaSelect" name="enturmar_aluno" required>
                            <option value="">Selecione a Escola</option>
                            <?php foreach ($escolas as $escola): ?>
                                <option value="<?= htmlspecialchars($escola['esc_inep']); ?>">
                                    <?= htmlspecialchars($escola['esc_razao_social']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                        <span id="spinnerModalidade" class="spinner-border spinner-border-sm ms-2 d-none" role="status"></span>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="modalidade_selecionada" class="form-label">2. Escolha a Modalidade</label>
                    <div class="input-group">
                        <select class="form-select" name="modalidade_selecionada" id="modalidade_selecionada" required>

    <option value="">Selecione a Modalidade</option>
    <?php if (!empty($esc_inep) && !empty($modalidades_info)): ?>
        <?php foreach ($modalidades_info as $mod): ?>
            <option value="<?= htmlspecialchars($mod['fk_id_modalidade']) ?>" <?= ($modalidade_selecionada == $mod['fk_id_modalidade']) ? 'selected' : '' ?>>
                <?= htmlspecialchars($mod['desc_modalidade']) ?>
            </option>
        <?php endforeach; ?>
    <?php endif; ?>
</select>

<!-- DEBUG: Mostra o conteúdo de $modalidades_info -->
<?php if (!empty($modalidades_info)) {
    echo '<pre style="background: #ffe; color: #222; border: 1px solid #ccc; padding: 8px;">';
    echo 'DEBUG $modalidades_info:\n';
    print_r($modalidades_info);
    echo '</pre>';
}
?>
                        <span id="spinnerAlunos" class="spinner-border spinner-border-sm ms-2 d-none" role="status"></span>
                    </div>
                </div>
            </form>
            <!-- Etapa 3: Listar alunos da escola (NÃO matriculados na modalidade) -->
            <form method="POST" action="../../models/save_dados_matricula_aluno.php" id="formAlunos">
                <input type="hidden" name="cod_valor_turma" id="cod_valor_turma" value="">
                <input type="hidden" name="modalidade_selecionada" id="modalidade_selecionada_hidden" value="">
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="periodo" class="form-label">3. Período</label>
                        <select class="form-select" name="periodo" id="periodo" required>
                            <option value="">Selecione o Período</option>
                            <option value="Manhã">Manhã</option>
                            <option value="Tarde">Tarde</option>
                            <option value="Noite">Noite</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="serie_selecionada" class="form-label">4. Série</label>
                        <select class="form-select" name="serie_selecionada" id="serie_selecionada" required>
                            <option value="">Selecione a Série</option>
                            <!-- Opções preenchidas via JS -->
                        </select>
                    </div>
                    
                </div>
                <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const escolaSelect = document.getElementById('escolaSelect');
                    const modalidadeSelect = document.getElementById('modalidade_selecionada');
                    const serieSelect = document.getElementById('serie_selecionada');
                    const periodoSelect = document.getElementById('periodo');
                    // Removido campo de turma/professor responsável

                    // function carregarTurmas() {
                        const inep = escolaSelect.value;
                        const modalidade = modalidadeSelect.value;
                        const serie = serieSelect.value;
                        const periodo = periodoSelect.value;
                        turmaSelect.innerHTML = '<option value="">Carregando turmas...</option>';
                        turmaSelect.disabled = true;
                        if (!inep || !modalidade || !serie || !periodo) {
                            turmaSelect.innerHTML = '<option value="">Selecione a Turma</option>';
                            return;
                        }
                        fetch(`../../models/ajax_turmas.php?esc_inep=${encodeURIComponent(inep)}&modalidade=${encodeURIComponent(modalidade)}&serie=${encodeURIComponent(serie)}&periodo=${encodeURIComponent(periodo)}`)
                            .then(res => res.json())
                            .then(turmas => {
                                if (Array.isArray(turmas) && turmas.length > 0) {
                                    turmaSelect.innerHTML = '<option value="">Selecione a Turma</option>';
                                    turmas.forEach(t => {
                                        const opt = document.createElement('option');
                                        opt.value = t.id_turma;
                                        opt.textContent = `${t.cod_valor} - Prof: ${t.nome_professor}`;
                                        turmaSelect.appendChild(opt);
                                    });
                                    turmaSelect.disabled = false;
                                } else {
                                    turmaSelect.innerHTML = '<option value="">Nenhuma turma encontrada</option>';
                                    turmaSelect.disabled = true;
                                }
                            })
                            .catch(() => {
                                turmaSelect.innerHTML = '<option value="">Erro ao carregar turmas</option>';
                                turmaSelect.disabled = true;
                            });
                    }

                    serieSelect.addEventListener('change', carregarTurmas);
                    periodoSelect.addEventListener('change', carregarTurmas);
                    modalidadeSelect.addEventListener('change', function() {
                        turmaSelect.innerHTML = '<option value="">Selecione a Turma</option>';
                        turmaSelect.disabled = true;
                    });
                    escolaSelect.addEventListener('change', function() {
                        turmaSelect.innerHTML = '<option value="">Selecione a Turma</option>';
                        turmaSelect.disabled = true;
                    });
                });
                </script>
                <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const escolaSelect = document.getElementById('escolaSelect');
                    const modalidadeSelect = document.getElementById('modalidade_selecionada');
                    escolaSelect.addEventListener('change', function() {
                        const realOptions = Array.from(modalidadeSelect.options).filter(opt => opt.value !== '');
                        if (escolaSelect.value && realOptions.length > 0) {
                            modalidadeSelect.disabled = false;
                        } else {
                            modalidadeSelect.value = '';
                            modalidadeSelect.disabled = true;
                        }
                    });
                    // Rodar uma vez ao carregar a página (ex: ao voltar do POST)
                    escolaSelect.dispatchEvent(new Event('change'));
                });
                </script>
                <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const escolaSelect = document.getElementById('escolaSelect');
                    const modalidadeSelect = document.getElementById('modalidade_selecionada');
                    const serieSelect = document.getElementById('serie_selecionada');
                    const periodoSelect = document.getElementById('periodo');

                    function carregarSeries() {
                        const modalidade = modalidadeSelect.value;
                        const periodo = periodoSelect.value;
                        const escola = escolaSelect ? escolaSelect.value : '';

                        serieSelect.innerHTML = '<option value="">Carregando séries...</option>';
                        serieSelect.disabled = true;

                        if (!modalidade || !escola) {
                            serieSelect.innerHTML = '<option value="">Selecione a Série</option>';
                            serieSelect.disabled = true;
                            return;
                        }

                        console.log('AJAX série: modalidade=', modalidade, 'periodo=', periodo, 'escola=', escola);
                        const url = `../../models/ajax_serie.php?modalidade=${modalidade}&periodo=${encodeURIComponent(periodo)}&escola=${escola}`;
                        
                        fetch(url)
                            .then(res => {
                                if (!res.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return res.json();
                            })
                            .then(series => {
                                console.log('AJAX série retorno:', series);
                                if (Array.isArray(series) && series.length > 0) {
                                    serieSelect.innerHTML = '<option value="">Selecione a Série</option>';
                                    series.forEach(s => {
                                        const opt = document.createElement('option');
                                        opt.value = s.serie_id;
                                        opt.textContent = s.serie_desc + (s.periodo ? ` (${s.periodo})` : '');
                                        serieSelect.appendChild(opt);
                                    });
                                    serieSelect.disabled = false;
// Habilitar/desabilitar checkboxes de alunos conforme seleção dos campos
habilitarCheckboxesAlunos();
                                } else {
                                    serieSelect.innerHTML = '<option value="">Nenhuma série encontrada</option>';
                                    serieSelect.disabled = true;
                                }
                            })
                            .catch((error) => {
                                console.error('Erro no fetch:', error);
                                serieSelect.innerHTML = '<option value="">Erro ao carregar séries</option>';
                                serieSelect.disabled = true;
                            });
                    }

                    if(modalidadeSelect) modalidadeSelect.addEventListener('change', carregarSeries);
                    if(periodoSelect) periodoSelect.addEventListener('change', carregarSeries);
                });
                </script>
                <script>
                function habilitarCheckboxesAlunos() {
    const escola = document.getElementById('escolaSelect')?.value;
    const modalidade = document.getElementById('modalidade_selecionada')?.value;
    const periodo = document.getElementById('periodo')?.value;
    const serie = document.getElementById('serie_selecionada')?.value;
    const checkboxes = document.querySelectorAll('.aluno-checkbox');
    const podeHabilitar = escola && modalidade && periodo && serie;
    checkboxes.forEach(cb => {
        cb.disabled = !podeHabilitar;
        if (!podeHabilitar) cb.checked = false;
    });
}

// Dispara a checagem sempre que qualquer select relevante mudar
['escolaSelect','modalidade_selecionada','periodo','serie_selecionada'].forEach(id => {
    const el = document.getElementById(id);
    if (el) el.addEventListener('change', habilitarCheckboxesAlunos);
});
</script>
                <div class="table-responsive" style="max-height: 350px;">
                    <table class="table table-striped align-middle">
                        <thead class="table-light sticky-top">
                            <tr>
                                <th style="width:40px">#</th>
                                <th style="width:120px">RA do Aluno</th>
                                <th>Aluno</th>
                                <th style="width:110px">Selecionar</th>
                            </tr>
                        </thead>
                        <tbody id="tbodyAlunos">
                            <tr><td colspan="4" class="text-center text-secondary">Selecione a escola e modalidade para listar os alunos.</td></tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-12 mt-3 d-flex align-items-center">
                    <button type="submit" name="gerar_matricula" class="btn btn-success" id="btnMatricular" disabled>Gerar Matrícula</button>
                    <script>
                    document.addEventListener('DOMContentLoaded', function() {
                        const formAlunos = document.getElementById('formAlunos');
                        const btnMatricular = document.getElementById('btnMatricular');
                        const tbodyAlunos = document.getElementById('tbodyAlunos');
                        function checaCheckboxAluno() {
                            const checkboxes = tbodyAlunos.querySelectorAll('input.aluno-checkbox[type="checkbox"]:not([disabled])');
                            let algumMarcado = false;
                            checkboxes.forEach(cb => { if(cb.checked) algumMarcado = true; });
                            btnMatricular.disabled = !algumMarcado;
                        }
                        tbodyAlunos.addEventListener('change', function(e) {
                            if(e.target.classList.contains('aluno-checkbox')) checaCheckboxAluno();
                        });
                        // Checa ao carregar lista
                        checaCheckboxAluno();
                        if(formAlunos) {
                            formAlunos.addEventListener('submit', function(e) {
                                const checkboxes = tbodyAlunos.querySelectorAll('input.aluno-checkbox[type="checkbox"]:not([disabled])');
                                let algumMarcado = false;
                                checkboxes.forEach(cb => { if(cb.checked) algumMarcado = true; });
                                if(!algumMarcado) {
                                    e.preventDefault();
                                    alert('Selecione pelo menos um aluno para gerar a matrícula!');
                                }
                            });
                        }
                    });
                    </script>
                    <a href="../../index.php" class="btn btn-primary ms-2">&larr; Voltar ao Menu Anterior</a>
                    <a href="#" id="btnExportarPDF" class="btn btn-info ms-2" target="_blank"><i class="bi bi-file-earmark-pdf"></i> Exportar PDF</a>
                </div>
            </form>

            <script>
            document.addEventListener('DOMContentLoaded', function() {
                const btnExportarPDF = document.getElementById('btnExportarPDF');
                const escolaSelect = document.getElementById('escolaSelect');
                const modalidadeSelect = document.getElementById('modalidade_selecionada');
                btnExportarPDF.addEventListener('click', function(e) {
                    e.preventDefault();
                    const escola = escolaSelect.value;
                    const modalidade = modalidadeSelect.value;
                    if (!escola || !modalidade) {
                        alert('Selecione a escola e a modalidade para exportar o PDF.');
                        return;
                    }
                    const url = `../../controller/relatorios/exporta_matricula_alunos_pdf.php?escola=${encodeURIComponent(escola)}&modalidade=${encodeURIComponent(modalidade)}`;
                    window.open(url, '_blank');
                });
            });
            </script>

            <script>
            document.addEventListener('DOMContentLoaded', function() {
                const escolaSelect = document.getElementById('escolaSelect');
                const modalidadeSelect = document.getElementById('modalidade_selecionada');
                const spinnerModalidade = document.getElementById('spinnerModalidade');
                const spinnerAlunos = document.getElementById('spinnerAlunos');
                const tbodyAlunos = document.getElementById('tbodyAlunos');
                const btnMatricular = document.getElementById('btnMatricular');
                const codValorTurma = document.getElementById('cod_valor_turma');

                escolaSelect.addEventListener('change', function() {
                    const inep = escolaSelect.value;
                    modalidadeSelect.innerHTML = '<option value="">Selecione a Modalidade</option>';
                    modalidadeSelect.disabled = true;
                    tbodyAlunos.innerHTML = '<tr><td colspan="4" class="text-center text-secondary">Selecione a modalidade para listar os alunos.</td></tr>';
                    btnMatricular.disabled = true;
                    codValorTurma.value = '';
                    if (!inep) return;
                    spinnerModalidade.classList.remove('d-none');
                    fetch(`../../models/ajax_modalidades.php?esc_inep=${encodeURIComponent(inep)}`)
                        .then(res => res.json())
                        .then(data => {
                            spinnerModalidade.classList.add('d-none');
                            modalidadeSelect.disabled = false;
                            if (data.length > 0) {
                                data.forEach(m => {
                                    const opt = document.createElement('option');
                                    opt.value = m.id_modalidade;
                                    opt.textContent = m.desc_modalidade;
                                    opt.dataset.codValor = m.cod_valor;
                                    modalidadeSelect.appendChild(opt);
                                });
                            } else {
                                modalidadeSelect.innerHTML = '<option value="">Nenhuma modalidade encontrada</option>';
                                modalidadeSelect.disabled = true;
                            }
                        })
                        .catch(() => {
                            spinnerModalidade.classList.add('d-none');
                            modalidadeSelect.innerHTML = '<option value="">Erro ao carregar modalidades</option>';
                            modalidadeSelect.disabled = true;
                        });
                });

                modalidadeSelect.addEventListener('change', function() {
                    const inep = escolaSelect.value;
                    const modalidade = modalidadeSelect.value;
                    codValorTurma.value = '';
                    btnMatricular.disabled = true;
                    document.getElementById('modalidade_selecionada_hidden').value = modalidade; // Atualiza o valor do hidden
                    tbodyAlunos.innerHTML = '<tr><td colspan="4" class="text-center text-secondary">Carregando alunos...</td></tr>';
                    if (!inep || !modalidade) {
                        tbodyAlunos.innerHTML = '<tr><td colspan="4" class="text-center text-secondary">Selecione a modalidade para listar os alunos.</td></tr>';
                        return;
                    }
                    // Pega cod_valor_turma
                    const optSel = modalidadeSelect.options[modalidadeSelect.selectedIndex];
                    codValorTurma.value = optSel.dataset.codValor || '';
                    spinnerAlunos.classList.remove('d-none');
                    fetch(`../../models/ajax_alunos.php?esc_inep=${encodeURIComponent(inep)}&modalidade=${encodeURIComponent(modalidade)}`)
                        .then(res => res.json())
                        .then(data => {
                            spinnerAlunos.classList.add('d-none');
                            if (Array.isArray(data) && data.length > 0) {
                                let html = '';
                                data.forEach((aluno, i) => {
                                    if (aluno.matriculado) {
                                        html += `<tr class='bg-secondary text-white'>
                                            <td>${i+1}</td>
                                            <td>${aluno.alu_ra || ''}</td>
                                            <td>${aluno.alu_nome} <span class='badge bg-warning text-dark ms-2'>Matriculado</span></td>
                                            <td><input type='checkbox' class='form-check-input' disabled></td>
                                        </tr>`;
                                    } else {
                                        html += `<tr>
                                            <td>${i+1}</td>
                                            <td>${aluno.alu_ra || ''}</td>
                                            <td>${aluno.alu_nome}</td>
                                            <td><input type='checkbox' class='form-check-input aluno-checkbox' name='alunos_selecionados[]' value='${aluno.alu_id}' disabled></td>
                                        </tr>`;
                                    }
                                });
                                tbodyAlunos.innerHTML = html;
                                btnMatricular.disabled = false;
                            } else {
                                tbodyAlunos.innerHTML = '<tr><td colspan="4" class="text-center text-danger">Nenhum aluno disponível para matrícula nesta modalidade nesta escola.</td></tr>';
                                btnMatricular.disabled = true;
                            }
                        })
                        .catch(() => {
                            spinnerAlunos.classList.add('d-none');
                            tbodyAlunos.innerHTML = '<tr><td colspan="4" class="text-center text-danger">Erro ao carregar alunos.</td></tr>';
                            btnMatricular.disabled = true;
                        });
                });
            });
            </script>



            <!-- Etapa 3: Escolha o(s) Professor(es) -->
            <?php if (!empty($esc_inep) && !empty($modalidade_selecionada) && !empty($professores_responsaveis)): ?>
            <form method="GET" class="mb-3">
                <input type="hidden" name="enturmar_aluno" value="<?= htmlspecialchars($esc_inep); ?>">
                <input type="hidden" name="modalidade_selecionada" value="<?= htmlspecialchars($modalidade_selecionada); ?>">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <strong>3. Selecione o(s) Professor(es) responsável(is)</strong>
                    </div>
                    <div class="card-body">
                        <?php foreach ($professores_responsaveis as $prof): ?>
                            <label class="form-check form-check-inline mb-2">
                                <input type="checkbox" class="form-check-input" name="professores_selecionados[]" value="<?= htmlspecialchars($prof['func_nome']) ?>"
                                <?php if (!empty($_GET['professores_selecionados']) && in_array($prof['func_nome'], $_GET['professores_selecionados'])) echo 'checked'; ?>
                                >
                                <span class="form-check-label">
                                    <?= htmlspecialchars($prof['func_nome']) ?>
                                    <span class="badge bg-success ms-1">Professor da escola</span>
                                </span>
                            </label>
                        <?php endforeach; ?>
                        <button type="submit" class="btn btn-primary ms-3">Pesquisar Alunos</button>
                    </div>
                </div>
            </form>
            <?php endif; ?>
        </div>
    </div>
</div>
<!-- Fim do card de filtros -->

<!-- Bloco de mensagens guiadas do fluxo -->
<?php if (empty($esc_inep)): ?>
    <div class="alert alert-info mt-3">Passo 1: Selecione uma <strong>escola</strong> para começar o processo de matrícula.</div>
<?php elseif (empty($modalidade_selecionada)): ?>
    <div class="alert alert-info mt-3">Passo 2: Selecione uma <strong>modalidade</strong> para ver os professores disponíveis.</div>
<?php elseif (empty($professores_responsaveis)): ?>
    <div class="alert alert-warning mt-3">Nenhum professor está vinculado a esta modalidade e escola. Cadastre um professor em uma turma para continuar.</div>
<?php elseif (empty($_GET['professores_selecionados'])): ?>
    <div class="alert alert-info mt-3">Passo 3: Selecione pelo menos um <strong>professor</strong> para ver os alunos disponíveis para matrícula.</div>
<?php endif; ?>

</body>
</html>