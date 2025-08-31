Para criar uma caixa de confirmação antes de redirecionar, podemos utilizar o JavaScript. Ao submeter o formulário e antes de redirecionar o usuário, você pode adicionar uma janela de confirmação (usando `confirm()` no JavaScript). Caso o usuário confirme, o redirecionamento é executado, caso contrário, a operação é cancelada.

Aqui está como você pode fazer isso:

1. **Adicione um script de confirmação na página do formulário** para capturar a submissão e mostrar a caixa de confirmação.
2. **Após a confirmação, o formulário será enviado** para o PHP, onde o redirecionamento ocorrerá.

### Passo 1: Alteração no código HTML/PHP

Você precisará de um pequeno script JavaScript no seu formulário que capture a submissão e mostre a caixa de confirmação.

Aqui está o código atualizado:

```php
<?php
require_once('../models/conexao.php');

// Verifica se o formulário foi submetido
if (isset($_POST['update'])) {
    // Captura os valores enviados pelo formulário
    $org_id = htmlspecialchars($_POST['org_id']);
    $inst_id = htmlspecialchars($_POST['inst_id']);

    // Verifica se os campos obrigatórios estão presentes
    if (!$org_id || !$inst_id) {
        echo "Erro: Campos obrigatórios não foram enviados.";
        exit;
    }

    try {
        // Atualiza o campo fk_org_inst_id com o valor de inst_id
        $query = "UPDATE orgao SET fk_org_inst_id = :inst_id WHERE org_id = :org_id";
        $stmt = $conn->prepare($query);

        // Faz a ligação dos parâmetros
        $stmt->bindParam(':inst_id', $inst_id, PDO::PARAM_INT);
        $stmt->bindParam(':org_id', $org_id, PDO::PARAM_INT);

        // Executa a atualização
        $stmt->execute();

        // Redireciona para a página de lista de órgãos após a atualização
        echo "<script type='text/javascript'>
                if (confirm('O órgão foi vinculado com sucesso! Deseja retornar à lista?')) {
                    window.location.href = '/proj_foccus/controller/imprime_orgao.php';
                } else {
                    window.location.href = '/proj_foccus/controller/imprime_orgao.php'; // Caso o usuário cancele, redireciona para a lista
                }
              </script>";
        exit;

    } catch (PDOException $e) {
        // Caso haja erro na execução
        echo "Erro ao atualizar o órgão: " . $e->getMessage();
        exit;
    }
} else {
    echo "Nenhum dado foi enviado para atualização.";
    exit;
}
?>
```

### Detalhes das mudanças:
1. **Uso do `confirm()`**: Quando a atualização é bem-sucedida, o código executa um script JavaScript que exibe uma caixa de confirmação com a mensagem "O órgão foi vinculado com sucesso! Deseja retornar à lista?".
   
2. **Redirecionamento condicionado**: 
   - Se o usuário clicar em "OK", o JavaScript redireciona para `imprime_orgao.php` (a lista de órgãos).
   - Se o usuário clicar em "Cancelar", o código também redireciona para `imprime_orgao.php`, mas você pode modificar esse comportamento caso queira algo diferente.

### Passo 2: Melhorando a interação do formulário

Você pode incluir essa lógica diretamente no formulário da seguinte maneira:

```html
<script type="text/javascript">
    // Função que confirma a submissão
    function confirmarVinculacao() {
        if (confirm('O órgão foi vinculado com sucesso! Deseja retornar à lista?')) {
            return true;  // O formulário será enviado se o usuário confirmar
        } else {
            return false; // Cancela o envio do formulário se o usuário cancelar
        }
    }
</script>
```

E no formulário, você pode associar essa função à ação de envio:

```php
<form action="/proj_foccus/models/update_inst_id.php" method="POST" onsubmit="return confirmarVinculacao();">
    <!-- Seu formulário aqui -->
</form>
```

### Resumo:

- **Confirmar com JavaScript**: Você está usando uma caixa de diálogo `confirm()` para verificar se o usuário deseja continuar com o redirecionamento após a atualização.
- **Redirecionamento após confirmação**: Dependendo da resposta do usuário, você redireciona para a página de lista de órgãos.