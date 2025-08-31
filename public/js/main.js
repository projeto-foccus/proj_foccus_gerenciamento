document.addEventListener('DOMContentLoaded', () => {
    const nextButton = document.getElementById('nextButton');
    const submitButton = document.getElementById('submitButton');
    const form1 = document.getElementById('form1');
    const form2 = document.getElementById('form2');

    // Exibir o segundo formulário ao clicar no botão "Próximo"
    nextButton.addEventListener('click', () => {
        const name = document.getElementById('name').value.trim();
        const email = document.getElementById('email').value.trim();

        if (name && email) {
            form1.classList.add('hidden');
            form2.classList.remove('hidden');
        } else {
            alert('Por favor, preencha todos os campos!');
        }
    });

    // Mostrar os valores do formulário no console ao clicar em "Enviar"
    submitButton.addEventListener('click', () => {
        const age = document.getElementById('age').value.trim();
        const topic = document.getElementById('topic').value;

        if (age && topic) {
            console.log("Nome:", document.getElementById('name').value);
            console.log("E-mail:", document.getElementById('email').value);
            console.log("Idade:", age);
            console.log("Tópico:", topic);
            alert('Formulário enviado com sucesso!');
        } else {
            alert('Por favor, preencha todos os campos!');
        }
    });
});

