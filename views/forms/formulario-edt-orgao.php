<?php 
require_once __DIR__ . '/../../models/conexao.php';

if (isset($_GET['edit'])) {
    // Captura o valor do parâmetro
    $editId = htmlspecialchars($_GET['edit']);

    // Exibe ou usa o valor
    echo "O ID do órgão para edição é: " . $editId;

    // Aqui você pode buscar os dados do banco de dados usando o ID
    $query = "SELECT * FROM orgao WHERE org_id = :editId";  // Usando :editId como marcador de posição
    $stmt = $conn->prepare($query);  // Preparando a consulta com a conexão $conn

    // Passando o valor de $editId de forma segura para o parâmetro
    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);

    // Executando a consulta
    $stmt->execute();

    // Recuperando os resultados
    $resul_edit = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Processando os resultados
    foreach ($resul_edit as $row_campos) {
        $id_orgao           = htmlspecialchars($editId);
        $razao_social       = htmlspecialchars($row_campos['org_razaosocial']);
        $cnpj_org           = htmlspecialchars($row_campos['org_cnpj']);
        $endereco_org       = htmlspecialchars($row_campos['org_endereco']);
        $bairro_org         = htmlspecialchars($row_campos['org_bairro']);
        $municipio_org      = htmlspecialchars($row_campos['org_municipio']);
        $cep_org            = htmlspecialchars($row_campos['org_cep']);
        $uf_org             = htmlspecialchars($row_campos['org_uf']);
        $email_org          = htmlspecialchars($row_campos['org_email']);
        $tel1_org          = htmlspecialchars($row_campos['org_tel1']);
        $tel2_org          = htmlspecialchars($row_campos['org_tel2']);

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
          <link rel="stylesheet" href="/proj_foccus/public/css/edt_org.css"> 
    
</head>
<body>
    <div id="formulario-edt-orgao" class="formulario">
        <form action="/proj_foccus/models/save_edit_orgao.php" method="POST">
        <h2 class="text-center text-primary fw-bold mb-4">
        Atualiza Dados - Orgão </h2>
            <section>
            <div class="elemento">
                    <label for="org_id" class="form-label">Codigo do Orgão</label>
                    <input class="form-control" type="text" style="width: 50px;" name="org_id" id="org_id" size= "10" maxlength="10" value="<?php echo $editId?>" readonly />
                </div>


                <div class="mb-3">
                    <label for="desc_org" class="form-label">Razão Social</label>
                    <input class="form-control" type="text" name="desc_org" id="desc_org" value="<?php echo $razao_social?>" required />
                </div>
                <div class="mb-3">
                    <label for="cnpj_org" class="form-label">CNPJ</label>
                    <input class="form-control" type="text" name="cnpj_org" id="cnpj_org" value = "<?php echo $cnpj_org?>"placeholder='__.___.___/___-__' required />
                </div>
                <div class="mb-3">
                    <label for="endereco_org" class="form-label">Endereço</label>
                    <input class="form-control" type="text" name="endereco_org" id="endereco_org" value="<?php echo $endereco_org?>" placeholder='Digite seu endereço' required />
                </div>
                <div class="mb-3">
                    <label for="bairro_org" class="form-label">Bairro</label>
                    <input class="form-control" type="text" name="bairro_org" id="bairro_org" value="<?php echo $bairro_org?>"  required />
                </div>
                <div class="mb-3">
                    <label for="municipio_org" class="form-label">Município</label>
                    <input class="form-control" type="text" name="municipio_org" id="municipio_org" value="<?php echo $municipio_org?>"  required />
                </div>
                <div class="mb-3">
                    <label for="cep_org" class="form-label">CEP</label>
                    <input class="form-control" type="text" name="cep_org" id="cep_org" value="<?php echo $cep_org?>" placeholder='*****-***' required />
                </div>
                <div class="mb-3">
    <label for="uf_org" class="form-label">Estado</label>
    <select name="uf_org" id="uf_org" class="form-select" required>
        <option value="PE" <?php echo ($uf_org == 'PE') ? 'selected' : ''; ?>>PE</optio
        <option value="RO" <?php echo ($uf_org == 'RO') ? 'selected' : ''; ?>>RO</option>
        <option value="AC" <?php echo ($uf_org == 'AC') ? 'selected' : ''; ?>>AC</option>
        <option value="AM" <?php echo ($uf_org == 'AM') ? 'selected' : ''; ?>>AM</option>
        <option value="RR" <?php echo ($uf_org == 'RR') ? 'selected' : ''; ?>>RR</option>
        <option value="PA" <?php echo ($uf_org == 'PA') ? 'selected' : ''; ?>>PA</option>
        <option value="AP" <?php echo ($uf_org == 'AP') ? 'selected' : ''; ?>>AP</option>
        <option value="TO" <?php echo ($uf_org == 'TO') ? 'selected' : ''; ?>>TO</option>
        <option value="MA" <?php echo ($uf_org == 'MA') ? 'selected' : ''; ?>>MA</option>
        <option value="PI" <?php echo ($uf_org == 'PI') ? 'selected' : ''; ?>>PI</option>
        <option value="CE" <?php echo ($uf_org == 'CE') ? 'selected' : ''; ?>>CE</option>
        <option value="RN" <?php echo ($uf_org == 'RN') ? 'selected' : ''; ?>>RN</option>
        <option value="PB" <?php echo ($uf_org == 'PB') ? 'selected' : ''; ?>>PB</option>
        <option value="AL" <?php echo ($uf_org == 'AL') ? 'selected' : ''; ?>>AL</option>
        <option value="SE" <?php echo ($uf_org == 'SE') ? 'selected' : ''; ?>>SE</option>
        <option value="BA" <?php echo ($uf_org == 'BA') ? 'selected' : ''; ?>>BA</option>
        <option value="MG" <?php echo ($uf_org == 'MG') ? 'selected' : ''; ?>>MG</option>
        <option value="ES" <?php echo ($uf_org == 'ES') ? 'selected' : ''; ?>>ES</option>
        <option value="RJ" <?php echo ($uf_org == 'RJ') ? 'selected' : ''; ?>>RJ</option>
        <option value="SP" <?php echo ($uf_org == 'SP') ? 'selected' : ''; ?>>SP</option>
        <option value="PR" <?php echo ($uf_org == 'PR') ? 'selected' : ''; ?>>PR</option>
        <option value="SC" <?php echo ($uf_org == 'SC') ? 'selected' : ''; ?>>SC</option>
        <option value="RS" <?php echo ($uf_org == 'RS') ? 'selected' : ''; ?>>RS</option>
        <option value="MS" <?php echo ($uf_org == 'MS') ? 'selected' : ''; ?>>MS</option>
        <option value="MT" <?php echo ($uf_org == 'MT') ? 'selected' : ''; ?>>MT</option>
        <option value="GO" <?php echo ($uf_org == 'GO') ? 'selected' : ''; ?>>GO</option>
        <option value="DF" <?php echo ($uf_org == 'DF') ? 'selected' : ''; ?>>DF</option>
    </select>
</div>

                <div class="mb-3">
                    <label for="email_org" class="form-label">E-mail</label>
                    <input class="form-control" type="email" name="email_org" id="email_org" value="<?php echo $email_org?>"placeholder='Exemplo@email.com' required />
                </div>
                <div class="mb-3">
                    <label for="telefone_org" class="form-label">Telefone(01)</label>
                    <input class="form-control" type="text" name="telefone_org" id="telefone_org" value="<?php echo $tel1_org?>"placeholder='( * * ) * * * * * - * * * * ' required />
                </div>

                <div class="mb-3">
                    <label for="telefone2_org" class="form-label">Telefone 02</label>
                    <input class="form-control" type="text" name="telefone2_org" id="telefone2_org" value="<?php echo $tel2_org?>"placeholder='( * * ) * * * * * - * * * * ' required />
                </div>
                <div class="mb-3">
                    <?php
                    // Fetch data from the database
                    $stmt = $conn->prepare("SELECT inst_id, inst_razaosocial FROM instituicao AS inst 
                    INNER JOIN orgao AS org ON inst.inst_id = org.fk_org_inst_id 
                    WHERE org.org_id = :editId");
                    $stmt->bindParam(':editId', $editId, PDO::PARAM_INT);
                    $stmt->execute();
                    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

                   
                    ?>
                    <label for="inst_id" class="form-label">Instituição do Orgão</label>
                    <select name="inst_id" id="inst_id" class="form-select" required>
                        <?php foreach ($result as $row) { ?>
                            <option value="<?php echo htmlspecialchars($row['inst_id']); ?>">
                                <?php echo htmlspecialchars($row['inst_razaosocial']); ?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
            </section>
            <div class="text-center">
                <button class="btn btn-primary" type="submit" name="update" id = "update">Salvar alerações</button>
                <a href="/proj_foccus/controller/imprime_orgao.php" class="listar-link btn btn-primary btn-sm">Volta a lista</a>
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
            const cnpjInput = document.getElementById('cnpj_org');
            if (cnpjInput) aplicarMascara(cnpjInput, 'XX.XXX.XXX/XXXX-XX');

            const cepInput = document.getElementById('cep_org');
            if (cepInput) aplicarMascara(cepInput, 'XXXXX-XXX');

            const telefone1Input = document.getElementById('telefone_org');
            if (telefone1Input) aplicarMascara(telefone1Input, '(XX) XXXXX-XXXX');

            const telefone2Input = document.getElementById('telefone2_org');
            if (telefone2Input) aplicarMascara(telefone2Input, '(XX) XXXXX-XXXX');
        });
    </script>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF"></script>
</body>
</html>
