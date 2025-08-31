

    <div id="formulario-cad-orgao" class="formulario">
        <form action="/proj_foccus/views/forms/incluir_orgao.php" method="POST">
            <h2>Cadastro de Orgão</h2>
            <section>
                <div class="elemento">
                    <div>
                        <label> Razão Social<br></br></label>
                        <input class="inputgeral" style="width: 100%;" type='text' name="desc_org" id="desc_org" placeholder='Digite o nome do orgão' autoComplete='off' required />
                    </div>
                </div>
                <div class="elemento">
                    <div>
                        <label> CNPJ <br></br></label>
                        <input class="inputgeral" style="width: 100%;" type='text' name="cnpj_org" id="cnpj_org" placeholder='__.___.___/___-__  ' autoComplete='off' required />
                    </div>
                </div>
                <div class="elemento">
                    <div>
                        <label> Endereço<br></br></label>
                        <input class="inputgeral" style="width: 100%;" type='text' name="endereco_org" id="endereco_org" placeholder='Digite seu endereço' autoComplete='off' required />
                    </div>
                </div>
                <div class="elemento">
                    <div>
                        <label> Bairro<br></br></label>
                        <input class="inputgeral" style="width: 100%;" type='text' name="bairro_org" id="bairro_org" placeholder='Digite seu bairro' autoComplete='off' required />
                    </div>
                </div>
                <div class="elemento">
                    <div>
                        <label> Município<br></br></label>
                        <input class="inputgeral" style="width: 100%;" type='text' name="municipio_org" id="municipio_org" placeholder='Digite seu bairro' autoComplete='off' required />
                    </div>
                </div>
                <div class="elemento">
                    <div>
                        <label> CEP <br></br></label>
                        <input class="inputgeral" style="width: 100%;" type='text' name="cep_org" id="cep_org" placeholder='*****-***' autoComplete='off' required />
                    </div>
                </div>
                <div class="elemento">
                    <div>
                        <label> Estado<br></br></label>
                        <select name="uf_org" id="uf_org" class="selectgeral" style="width: 100%;" autoComplete='off' required>
                            <option value="PE">PE</option>
                            <option value="RO">RO</option>
                            <option value="AC">AC</option>
                            <option value="AM">AM</option>
                            <option value="RR">RR</option>
                            <option value="PA">PA</option>
                            <option value="AP">AP</option>
                            <option value="TO">TO</option>
                            <option value="MA">MA</option>
                            <option value="PI">PI</option>
                            <option value="CE">CE</option>
                            <option value="RN">RN</option>
                            <option value="PB">PB</option>
                            <option value="AL">AL</option>
                            <option value="SE">SE</option>
                            <option value="BA">BA</option>
                            <option value="MG">MG</option>
                            <option value="ES">ES</option>
                            <option value="RJ">RJ</option>
                            <option value="SP">SP</option>
                            <option value="PR">PR</option>
                            <option value="SC">SC</option>
                            <option value="RS">RS</option>
                            <option value="MS">MS</option>
                            <option value="MT">MT</option>
                            <option value="GO">GO</option>
                            <option value="DF">DF</option>
                        </select>
                    </div>
                </div>
                <input class="inputgeral"
       style="width: 100%; height: 30px;"
       type="email"
       name="email_org"
       id="email_org"
       placeholder="Exemplo@email.com"
       autocomplete="off"
       required
       value="<?= isset($_POST['email_org']) ? htmlspecialchars($_POST['email_org']) : '' ?>"
       oninput="validarEmail(this)" />

                <div class="elemento">
                    <div>
                        </br>
                        <label> Telefone(01)<br></br></label>
                        <input class="inputgeral" style="width: 100%;" name="telefone_org" id="telefone_org" type='text' placeholder='( * * ) * * * * * - * * * * ' autoComplete='off'  required />
                    </div>

                    <div>
                        <label> Telefone(02)<br></br></label>
                        <input class="inputgeral" style="width: 100%;" name="tel02_org" id="tel02_org" type='text' placeholder='( * * ) * * * * * - * * * * ' autoComplete='off'  required />
                    </div>



                </div>
            </section>
            <div class="di button-container">
                <button class="submitbtn" type="submit" name="submit">Salvar</button>
                
                <button class="cancelbtn" id="fecharorgao">Cancelar</button>
                <a class="listarbtn" id="listarbtn" data-url="controller/imprime_orgao.php">Listar</a>
                </div>
                <div id="lista-container"></div>
            </div>
        </form>
    </div>

    <script> document.addEventListener('DOMContentLoaded', () => {
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

    const telefoneInput = document.getElementById('telefone_org');
    if (telefoneInput) aplicarMascara(telefoneInput, '(XX) XXXXX-XXXX');
});
</script>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF
