<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulário Dinâmico</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 20px;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      display: block;
      font-size: 14px;
      margin-bottom: 5px;
      color: #555;
    }
    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 14px;
    }
    

    .form-container {
      max-width: 800px;
      background: #ffffff;
      padding: 20px;
      margin: auto;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }
    h1 {
      font-size: 24px;
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }
    .checkbox-group {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 10px;
    }
    .checkbox-group label {
      display: flex;
      align-items: center;
      font-size: 14px;
      background: #f7f7f7;
      padding: 8px;
      border-radius: 5px;
      box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    }
    .checkbox-group input {
      margin-right: 10px;
      transform: scale(1.2);
    }
    button {
      display: block;
      width: 100%;
      padding: 10px;
      background: #4CAF50;
      color: #fff;
      font-size: 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 20px;
    }
    button:hover {
      background: #45a049;
    }

    button#save-button {
  background-color: #007BFF; /* Azul primário */
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 18px;
  font-size: 13px;
  font-weight: bold;
  text-transform: uppercase;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
  margin-top: 10px; /* Espaço acima do botão */
}

button#save-button:hover {
  background-color: #0056b3; /* Azul mais escuro no hover */
  transform: translateY(-2px); /* Efeito de elevação */
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Sombra sutil */
}

button#save-button:active {
  background-color: #004080; /* Azul mais escuro no clique */
  transform: translateY(0); /* Remove elevação no clique */
  box-shadow: none; /* Remove sombra no clique */
}


  </style>
</head>
<body>

<div class="form-container">
  <!-- Título -->
  <h1>Eixo Interação Socioemocional</h1>

  <!-- Campo de seleção de tópico -->
  <div class="form-group">
    <label for="topic-select">Selecione um tópico:</label>
    <select id="topic-select" name="topic" required>
      <option value="" disabled selected>Escolha um tópico</option>
      <option value="INVENTÁRIO DAS HABILIDADES  EIXO COMUNICAÇÃO/LINGUAGEM">INVENTÁRIO DAS HABILIDADES  EIXO COMUNICAÇÃO/LINGUAGEM</option>
      <option value="INVENTÁRIO DAS HABILIDADES EIXO COMPORTAMENTO"> INVENTÁRIO DAS HABILIDADES EIXO COMPORTAMENTO</option>
      <option value="INVENTÁRIO DAS HABILIDADES  EIXO INTERAÇÃO SOCIOEMOCIONAL ">INVENTÁRIO DAS HABILIDADES  EIXO INTERAÇÃO SOCIOEMOCIONAL </option>
     
      <!-- Adicione mais tópicos aqui se necessário -->
    </select>
  </div>
  
  <!-- Formulário -->
  <form id="dynamic-form">
    <div class="checkbox-group">

      <label><input type="checkbox" name="question[1]"  value="1">Compartilha brinquedos e brincadeiras? </label>
      <label><input type="checkbox" name="question[2]"  value="2">Compartilha interesses? </label>
      <label><input type="checkbox" name="question[3]"  value="3">Controla suas emoções? (Autorregula-se) </label>
      <label><input type="checkbox" name="question[4]"  value="4">Coopera nas situações que envolvem a interação? </label>
      <label><input type="checkbox" name="question[5]"  value="5">Demonstra e compartilha afetos? </label>
      <label><input type="checkbox" name="question[6]" value="6">Demonstra interesse nas atividades propostas? </label>
      <label><input type="checkbox" name="question[7]" value="7">Expressa suas emoções?  </label>
      <label><input type="checkbox" name="question[8]" value="8">Identifica/ Reconhece a emoção do outro? </label>
      <label><input type="checkbox" name="question[9]"  value="9">Identifica/ Reconhece suas  emoções? </label>
      <label><input type="checkbox" name="question[10]"  value="10">Inicia e mantém interação em situações sociais? </label>
      <label><input type="checkbox" name="question[11]" value="11">Interage com o professor, seus colegas e outras pessoas de seu convívio escolar? </label>
      <label><input type="checkbox" name="question[12]" value="12">Interage fazendo contato visual? </label>
      <label><input type="checkbox" name="question[13]" value="13">Relaciona-se, estabelecendo vínculos?  </label>
      <label><input type="checkbox" name="question[14]"  value="14">Identifica/ Reconhece suas  emoções? </label>
      <label><input type="checkbox" name="question[15]"  value="15">Respeita as regras  em jogos e brincadeiras? </label>
      <label><input type="checkbox" name="question[16]" value="16">Respeita as regras sociais?  </label>
      <label><input type="checkbox" name="question[17]" value="17">Responde a interações?  </label>
      <label><input type="checkbox" name="question[18]" value="18">Solicita ajuda, quando necessária?</label>




    
     
    </div>

    <button type="submit">Enviar</button>
    <button type="button" id="save-button">Salvar</button>



  </form>
</div>

<script>
  const form = document.getElementById('dynamic-form');
  form.addEventListener('submit', (e) => {
    e.preventDefault(); // Evita o recarregamento da página

    alert('Formulário enviado com sucesso!');
    form.reset();
  });

  
  
  
  document.addEventListener('DOMContentLoaded', () => {
    const saveButton = document.getElementById('save-button');
    if (saveButton) {
      saveButton.addEventListener('click', () => {
        // Seleciona todas as caixas de seleção no formulário
        const checkboxes = document.querySelectorAll('#dynamic-form input[type="checkbox"]');
        // Desmarca todas as caixas de seleção
        checkboxes.forEach(checkbox => checkbox.checked = false);

        alert('Dados salvos (limpeza realizada nas caixas de seleção)!');
      });
    } else {
      console.error('Botão "Salvar" não encontrado no DOM.');
    }
  });





</script>

</body>
</html>
