<?php 
require_once __DIR__ . '/../../models/conexao.php';

if (isset($_GET['edit'])) {
    // Captura o valor do parâmetro
    $editId = htmlspecialchars($_GET['edit']);

    // Exibe ou usa o valor
    // "O ID da instituicao para edição é: " . $editId;

    // Aqui você pode buscar os dados do banco de dados usando o ID
    $query = "SELECT * FROM instituicao WHERE inst_id = :editId";  // Usando :editId como marcador de posição
    $stmt = $conn->prepare($query);  // Preparando a consulta com a conexão $conn

    // Passando o valor de $editId de forma segura para o parâmetro
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);

    // Executando a consulta
    $stmt->execute();

    // Recuperando os resultados
    $resul_edit = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Processando os resultados
    foreach ($resul_edit as $row_campos) {
        $id_inst           = htmlspecialchars($editId);
        $razao_social       = htmlspecialchars($row_campos['inst_razaosocial']);
        $cnpj_inst          = htmlspecialchars($row_campos['inst_cnpj']);
        $endereco_inst       = htmlspecialchars($row_campos['inst_endereco']);
        $bairro_inst        = htmlspecialchars($row_campos['inst_bairro']);
        $municipio_inst     = htmlspecialchars($row_campos['inst_municipio']);
        $cep_inst            = htmlspecialchars($row_campos['inst_cep']);
        $uf_inst             = htmlspecialchars($row_campos['inst_uf']);
        $email_inst          = htmlspecialchars($row_campos['inst_email']);
        $tel1_inst          = htmlspecialchars($row_campos['inst_tel1']);
        $tel2_inst          = htmlspecialchars($row_campos['inst_tel2']);

    }
 
} else {
    echo "Nenhum ID de órgão foi fornecido para edição.";
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
          <link rel="stylesheet" href="/proj_foccus/public/css/edt_inst.css"> 
    <title>Cadastro de Instituição</title>
     
<!-- Estilização geral do formulário */-->
    
</head>
<body>
    <div id="formulario-edt-instituicao" class="formulario">
        <form action="/proj_foccus/models/save_edit_instituicao.php" method="POST">
        <h2 class="text-center text-primary fw-bold mb-4">
        Atualiza Dados - Instituição </h2>
            <section>
            <div class="elemento">
                    <label for="inst_id" class="form-label">Codigo da Instituicao</label>
                    <input class="form-control" type="text" style="width: 50px;" name="inst_id" id="inst_id" size= "10" maxlength="10" value="<?php echo $editId?>" readonly />
                </div>


                <div class="mb-3">
                    <label for="desc_inst" class="form-label">Razão Social</label>
                    <input class="form-control" type="text" name="desc_inst" id="desc_inst" value="<?php echo $razao_social?>" required />
                </div>
                <div class="mb-3">
                    <label for="cnpj_inst" class="form-label">CNPJ</label>
                    <input class="form-control" type="text" name="cnpj_inst" id="cnpj_inst" value = "<?php echo $cnpj_inst?>"placeholder='__.___.___/___-__' required />
                </div>
                <div class="mb-3">
                    <label for="endereco_inst" class="form-label">Endereço</label>
                    <input class="form-control" type="text" name="endereco_inst" id="endereco_inst" value="<?php echo $endereco_inst?>" placeholder='Digite seu endereço' required />
                </div>
                <div class="mb-3">
                    <label for="bairro_inst" class="form-label">Bairro</label>
                    <input class="form-control" type="text" name="bairro_inst" id="bairro_inst" value="<?php echo $bairro_inst?>"  required />
                </div>
                <div class="mb-3">
                    <label for="municipio_inst" class="form-label">Município</label>
                    <input class="form-control" type="text" name="municipio_inst" id="municipio_inst" value="<?php echo $municipio_inst?>"  required />
                </div>
                <div class="mb-3">
                    <label for="cep_inst" class="form-label">CEP</label>
                    <input class="form-control" type="text" name="cep_inst" id="cep_inst" value="<?php echo $cep_inst?>" placeholder='*****-***' required />
                </div>
                <div class="mb-3">
    <label for="uf_inst" class="form-label">Estado</label>
    <select name="uf_inst" id="uf_inst" class="form-select" required>
        <option value="PE" <?php echo ($uf_inst == 'PE') ? 'selected' : ''; ?>>PE</option>
        <option value="RO" <?php echo ($uf_inst == 'RO') ? 'selected' : ''; ?>>RO</option>
        <option value="AC" <?php echo ($uf_inst == 'AC') ? 'selected' : ''; ?>>AC</option>
        <option value="AM" <?php echo ($uf_inst == 'AM') ? 'selected' : ''; ?>>AM</option>
        <option value="RR" <?php echo ($uf_inst == 'RR') ? 'selected' : ''; ?>>RR</option>
        <option value="PA" <?php echo ($uf_inst == 'PA') ? 'selected' : ''; ?>>PA</option>
        <option value="AP" <?php echo ($uf_inst == 'AP') ? 'selected' : ''; ?>>AP</option>
        <option value="TO" <?php echo ($uf_inst == 'TO') ? 'selected' : ''; ?>>TO</option>
        <option value="MA" <?php echo ($uf_inst == 'MA') ? 'selected' : ''; ?>>MA</option>
        <option value="PI" <?php echo ($uf_inst == 'PI') ? 'selected' : ''; ?>>PI</option>
        <option value="CE" <?php echo ($uf_inst == 'CE') ? 'selected' : ''; ?>>CE</option>
        <option value="RN" <?php echo ($uf_inst == 'RN') ? 'selected' : ''; ?>>RN</option>
        <option value="PB" <?php echo ($uf_inst == 'PB') ? 'selected' : ''; ?>>PB</option>
        <option value="AL" <?php echo ($uf_inst == 'AL') ? 'selected' : ''; ?>>AL</option>
        <option value="SE" <?php echo ($uf_inst == 'SE') ? 'selected' : ''; ?>>SE</option>
        <option value="BA" <?php echo ($uf_inst == 'BA') ? 'selected' : ''; ?>>BA</option>
        <option value="MG" <?php echo ($uf_inst == 'MG') ? 'selected' : ''; ?>>MG</option>
        <option value="ES" <?php echo ($uf_inst == 'ES') ? 'selected' : ''; ?>>ES</option>
        <option value="RJ" <?php echo ($uf_inst == 'RJ') ? 'selected' : ''; ?>>RJ</option>
        <option value="SP" <?php echo ($uf_inst == 'SP') ? 'selected' : ''; ?>>SP</option>
        <option value="PR" <?php echo ($uf_inst == 'PR') ? 'selected' : ''; ?>>PR</option>
        <option value="SC" <?php echo ($uf_inst == 'SC') ? 'selected' : ''; ?>>SC</option>
        <option value="RS" <?php echo ($uf_inst == 'RS') ? 'selected' : ''; ?>>RS</option>
        <option value="MS" <?php echo ($uf_inst == 'MS') ? 'selected' : ''; ?>>MS</option>
        <option value="MT" <?php echo ($uf_inst == 'MT') ? 'selected' : ''; ?>>MT</option>
        <option value="GO" <?php echo ($uf_inst == 'GO') ? 'selected' : ''; ?>>GO</option>
        <option value="DF" <?php echo ($uf_inst == 'DF') ? 'selected' : ''; ?>>DF</option>
    </select>
</div>

                <div class="mb-3">
                    <label for="email_inst" class="form-label">E-mail</label>
                    <input class="form-control" type="email" name="email_inst" id="email_inst" value="<?php echo $email_inst?>"placeholder='Exemplo@email.com' required />
                </div>
                <div class="mb-3">
                    <label for="telefone_inst" class="form-label">Telefone</label>
                    <input class="form-control" type="text" name="telefone_inst" id="telefone_inst" value="<?php echo $tel1_inst?>"placeholder='( * * ) * * * * * - * * * * ' required />
                </div>
                <div class="mb-3">
                    <label for="telefone2_inst" class="form-label">Telefone 02</label>
                    <input class="form-control" type="text" name="telefone2_inst" id="telefone2_inst" value="<?php echo $tel2_inst?>"placeholder='( * * ) * * * * * - * * * * ' required />
                </div>
               
            </section>
            <div class="text-center">
                <button class="btn btn-primary" type="submit" name="update" id = "update">Salvar alerações</button>
                <a href="/proj_foccus/controller/imprime_instituicao.php" class="listar-link btn btn-primary btn-sm">Volta a lista</a>
            </div>
        </form>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', () => {
        function aplicarMascara(input, mascara) {
            input.addEventListener('input', (e) => {
                let valor = e.target.value.replace(/\D/g, '');
                let resultado = '';
                let indexMascara = 0;

                for (let i = 0; i < valor.length; i++) {
                    if (indexMascara >= mascara.length) break;

                    if (mascara[indexMascara] === 'X') {
                        resultado += valor[i];
                        indexMascara++;
                    } else {
                        resultado += mascara[indexMascara];
                        indexMascara++;
                        i--;
                    }
                }

                e.target.value = resultado;
            });
        }

        // Máscaras
        const cnpjInput = document.getElementById('cnpj_inst');
        if (cnpjInput) aplicarMascara(cnpjInput, 'XX.XXX.XXX/XXXX-XX');

        const cepInput = document.getElementById('cep_inst');
        if (cepInput) aplicarMascara(cepInput, 'XXXXX-XXX');

        const telefone1Input = document.getElementById('telefone_inst');
        if (telefone1Input) aplicarMascara(telefone1Input, '(XX) XXXXX-XXXX');

        const telefone2Input = document.getElementById('telefone2_inst');
        if (telefone2Input) aplicarMascara(telefone2Input, '(XX) XXXXX-XXXX');
    });
</script>


    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF"></script>
</body>
</html>
