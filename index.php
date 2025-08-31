<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastros Dinâmicos</title>
    <link rel="stylesheet" href="public/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        .horizontal-bar {
            width: calc(100% - 270px);
            margin: 20px 20px;
            background-color: #d9e6f7;
            padding: 16px 20px;
            color: #49537e;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 10px;
            left: 260px;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .sidebar ul li a {
            color: #2b3687;
        }

        .sidebar ul li a:hover {
            color: #db7a19;
        }

        .sidebar h2 {
            text-align: center;
            width: 100%;
        }

        .horizontal-bar .logo {
            font-size: 18px;
            font-weight: bold;
        }

        .horizontal-bar .menu {
            display: flex;
            gap: 10px;
            margin-right: 35px;
        }

        .horizontal-bar .menu a {
            text-decoration: none;
            color: #49537e;
            font-size: 14px;
        }

        .horizontal-bar .menu a:hover {
            text-decoration: underline;
        }

        ::-webkit-scrollbar {
            width: 12px;
        }

        ::-webkit-scrollbar-track {
            background: #f0f0f0;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #d9e6f7;
            border-radius: 10px;
        }

        .menu-logo {
            text-align: center;
            margin-bottom: 10px;
        }

        .menu-logo img {
            width: 100px;
            height: auto;
        }
    </style>
</head>

<body>
    <!-- Barra horizontal superior -->
    <div class="horizontal-bar">
        <div class="logo">Supergando TEA</div>
        <div class="menu">
            <a href="http://127.0.0.1:8000/index"><i class="fa-regular fa-file-excel"></i> SAIR</a>
        </div>
    </div>

    <!-- Barra lateral -->
    <div class="sidebar">
        <div class="menu-logo">
            <img src="public/img/logo_sap.png" alt="Logo">
        </div>

        <h2>Menu</h2>

        <h2>Cadastros</h2>
        <ul>
            <li><a href="#" data-target="formulario-cad-instituicao"><i class="fa-solid fa-building-columns"></i> Instituição</a></li>
            <li><a href="#" data-target="formulario-cad-orgao"><i class="fa-solid fa-building"></i> Órgão</a></li>
            <li><a href="#" data-target="formulario-cad-escola"><i class="fa-solid fa-school"></i> Escola</a></li>
            <li><a href="#" data-target="formulario-cad-aluno"><i class="fa-solid fa-user-graduate"></i> Aluno</a></li>
            <li><a href="#" data-target="formulario-cad-funcionario"><i class="fa-solid fa-users"></i> Servidores</a></li>

            <li>
                <a href="#" data-target="Enturmacao"><i class="fa-regular fa-folder"></i> Matrículas ▼</a>
                <ul class="submenu_matriculas">
                    <li><a href="#" data-target="formulario-enturmar-escola">Enturmação</a></li>
                    <li><a href="/proj_foccus/views/forms/formulario-matricular-aluno.php"><span style="color: #BA68C8;"><i class="fa-solid fa-user-plus"></i> Matrículas - Alunos</span></a></li>
                </ul>
            </li>

            <!-- Corrigido: "Relatórios" dentro da lista -->
            <li>
                <a href="#"><i class="fa-regular fa-folder"></i> Relatórios ▼</a>
                <ul class="submenu_matriculas">
                    <li><a href="/proj_foccus/controller/relatorios/lista_escola_orgao.php">Lista escola por Órgão</a></li>
                    <li><a href="/proj_foccus/controller/relatorios/lista_modalidade_escola.php">Lista modalidades por Escola</a></li>
                    <li><a href="/proj_foccus/controller/relatorios/lista_funcionario_escola.php">Lista funcionários por Escola</a></li>
                    <li><a href="/proj_foccus/controller/relatorios/modalidade_por_escola.php">Modalidade por Escola</a></li>
                    <li><a href="/proj_foccus/controller/relatorios/relatorio_escola_professor_aluno_turma.php">Escola, Professores e Alunos por Turma</a></li>
                </ul>
            </li>
        </ul>

        <h2>Espaço Professor</h2>
        <ul>
            <li><a href="#" data-target="formulario-mig-download"><i class="fa-solid fa-shapes"></i> Download de material</a></li>
        </ul>

        <h2>Migrações</h2>
        <ul>
            <li><a href="#" data-target="formulario-mig-escola"><i class="fa-solid fa-code-branch"></i> Migrar Escola</a></li>
            <li><a href="#" data-target="formulario-mig-aluno"><i class="fa-solid fa-sitemap"></i> Migrar Aluno</a></li>
            <li><a href="#" data-target="formulario-mig-funcionario"><i class="fa-solid fa-sitemap"></i> Migrar Funcionário</a></li>
             <li><a href="#" data-target="formulario-mig-modalidade"><i class="fa-solid fa-sitemap"></i> Migrar Modalidade</a></li>
        </ul>

        <h2>Controles</h2>
        <ul>
            <li><a href="#" data-target="formulario-cad-usuarios"><i class="fa-solid fa-address-card"></i> Cadastro de usuários</a></li>
        </ul>
    </div>

    <!-- Container para conteúdo dinâmico -->
    <div id="formulario-container"></div>


    <!-- Script principal -->
    <script src="public/js/script.js"></script>
</body>
</html>
