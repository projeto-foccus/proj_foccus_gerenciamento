document.addEventListener('DOMContentLoaded', () => {
    // Função para configurar máscaras nos campos
    function configurarMascaras() {
        // Máscara para CNPJ
        document.querySelectorAll('input[name*="cnpj"], #cnpj').forEach(input => {
            input.addEventListener('input', (e) => {
                let validseq = e.target.value.replace(/\D/g, '').substring(0, 14); // Remove caracteres não numéricos
                let cnpjform = validseq.replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$/, '$1.$2.$3/$4-$5'); // Formata como CNPJ
                e.target.value = cnpjform;
            });
        });

        // Máscara para telefone
        document.querySelectorAll('input[name*="telefone"], #telefone-escola').forEach(input => {
            input.addEventListener('input', (e) => {
                let validtel = e.target.value.replace(/\D/g, '').substring(0, 11); // Remove caracteres não numéricos
                let telform = validtel.replace(/^(\d{2})(\d{5})(\d{4})$/, '($1) $2-$3'); // Formata como telefone
                e.target.value = telform;
            });
        });

        // Máscara para CEP
        document.querySelectorAll('input[name*="cep"], #cep').forEach(input => {
            input.addEventListener('input', (e) => {
                let validcep = e.target.value.replace(/\D/g, '').substring(0, 8); // Remove caracteres não numéricos
                let cepform = validcep.replace(/^(\d{5})(\d{3})$/, '$1-$2'); // Formata como CEP
                e.target.value = cepform;
            });
        });
    }

    // Função para configurar eventos nos formulários
    function configurarEventosFormulario() {
        const fileInput = document.getElementById('file');
        const fileChosen = document.getElementById('file-chosen');
        if (fileInput && fileChosen) {
            fileInput.addEventListener('change', () => {
                fileChosen.textContent = fileInput.files.length > 0 
                    ? fileInput.files[0].name 
                    : "Nenhum arquivo escolhido";
            });
        }
    }

    // Observa mudanças no contêiner onde os formulários são carregados dinamicamente
    const container = document.getElementById('formulario-container');
    if (container) {
        const observer = new MutationObserver(() => {
            configurarMascaras(); // Reaplica as máscaras ao conteúdo dinâmico
            configurarEventosFormulario(); // Reaplica eventos gerais
        });
        observer.observe(container, { childList: true });
    }

    // Configuração inicial para máscaras e eventos no carregamento da página
    configurarMascaras();

    // Carregamento dinâmico de formulários via AJAX
    function carregarFormulario(url, containerId) {
        const container = document.getElementById(containerId);
        fetch(url)
            .then(response => response.text())
            .then(html => {
                container.innerHTML = html; // Insere o HTML carregado no contêiner
                container.style.display = 'block';

                configurarMascaras(); // Reaplica as máscaras no novo conteúdo carregado

                // Adiciona evento de submit ao formulário de modalidade, se existir
                const formModalidade = container.querySelector('form[action*="migrar_modalidade.php"]');
                if (formModalidade) {
                    // Remove qualquer evento anterior
                    formModalidade.onsubmit = null;
                    formModalidade.addEventListener('submit', function(e) {
                        e.preventDefault();
                        const loadingMsg = formModalidade.querySelector('#loading-message');
                        const btn = formModalidade.querySelector('button[type="submit"]');
                        if (loadingMsg) loadingMsg.style.display = 'flex';
                        if (btn) btn.disabled = true;
                        const formData = new FormData(formModalidade);
                        fetch(formModalidade.action, {
                            method: 'POST',
                            body: formData
                        })
                        .then(response => response.text())
                        .then(text => {
                            // Extrai a mensagem do alert do PHP (caso venha dentro de <script>alert(...)</script>)
                            let msg = '';
                            const alertMatch = text.match(/alert\(['"]([\s\S]*?)['"]\)/);
                            if (alertMatch) {
                                msg = alertMatch[1].replace(/\\n/g, '\n');
                            } else {
                                msg = 'Processo concluído, mas não foi possível exibir detalhes.';
                            }
                            alert(msg);
                            window.location.href = '/proj_foccus/index.php';
                        })
                        .catch(err => {
                            alert('Erro ao processar o arquivo: ' + err);
                            if (loadingMsg) loadingMsg.style.display = 'none';
                            if (btn) btn.disabled = false;
                        });
                    });
                }

                const saveButton = container.querySelector('#save-button');
                if (saveButton) {
                    saveButton.addEventListener('click', () => {
                        const checkboxes = container.querySelectorAll('input[type="checkbox"]');
                        checkboxes.forEach(checkbox => checkbox.checked = false);
                        alert('Dados salvos (limpeza realizada nas caixas de seleção)!');
                    });
                }

                container.querySelectorAll('.cancelbtn').forEach(btn => {
                    btn.addEventListener('click', () => (container.style.display = 'none'));
                });
            })
            .catch(err => console.error('Erro ao carregar o formulário:', err));
    }

    document.querySelectorAll('[data-target]').forEach(item => {
        item.addEventListener('click', function (event) {
            event.preventDefault();
            const target = this.dataset.target;
            let url;
            if (target === 'migracao_modalidade') {
                url = 'views/migracao_modalidade.php';
            } else {
                url = `views/forms/${target}.php`;
            }
            carregarFormulario(url, 'formulario-container');
        });
    });

    const migracaoAlunoLink = document.querySelector('a[data-target="f_migracao_aluno.html"]');
    if (migracaoAlunoLink) {
        migracaoAlunoLink.addEventListener('click', (event) => {
            event.preventDefault();
            carregarFormulario('views/forms/f_migracao_aluno.html', 'formulario-container');
        });
    }
});
document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('formulario-container'); // Container onde os formulários são carregados

    // Função para carregar conteúdo dinamicamente
    function carregarConteudo(url) {
        fetch(url)
            .then(response => response.text())
            .then(html => {
                container.innerHTML = html; // Insere o HTML retornado no container
            })
            .catch(err => console.error('Erro ao carregar:', err));
    }

    // Clique no botão "Listar"
    container.addEventListener('click', function (e) {
        const target = e.target;

        // Verifica se o elemento clicado é o botão "Listar"
        if (target && target.classList.contains('listarbtn')) {
            e.preventDefault(); // Impede o comportamento padrão do link

            const url = target.getAttribute('data-url'); // Obtém a URL do atributo data-url
            if (url) {
                carregarConteudo(url); // Carrega o conteúdo dinamicamente
            }
        }
    });

    // Clique nos botões de paginação
    container.addEventListener('click', function (e) {
        if (e.target.classList.contains('paginacao-btn')) {
            e.preventDefault(); // Impede o redirecionamento padrão

            const url = e.target.getAttribute('data-url'); // Obtém a URL do botão de paginação
            if (url) {
                carregarConteudo(`controller/imprime_instituicao.php${url}`); // Carrega a página correspondente
            }
        }
    });

    // Submissão do formulário de pesquisa
    container.addEventListener('submit', function (e) {
        if (e.target.id === 'pesquisa-form') {
            e.preventDefault(); // Impede o envio padrão do formulário

            const formData = new FormData(e.target);
            const params = new URLSearchParams(formData).toString(); // Converte os dados do formulário em query string
            carregarConteudo(`controller/imprime_instituicao.php?${params}`); // Carrega os resultados da pesquisa dinamicamente
        }
    });
});
