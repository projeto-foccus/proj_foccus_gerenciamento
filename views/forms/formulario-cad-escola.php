
<div id="formulario-cad-instituicao" class="formulario"> 
    <form action="views/forms/incluir_escola.php" method="POST">
        <h2>Cadastro de Escola</h2>
        <section>
        <div class="elemento">
        <div>
            <label>Inep da escola<br></br></label>
            <input class="inputgeral" name="esc_inep"  style="width: 100%;" type='text' id="esc_inep"  autoComplete='off' required/>
        </div>
        </div>        
        <div class="elemento">
        <div>
            <label>CNPJ<br></br></label>
            <input class="inputgeral" name="esc_cnpj"  id="esc_cnpj" style="width: 100%;" type='text' id="cnpj"  placeholder='__.____.____ / ______' autoComplete='off' required/>
        </div>
        </div>
        <div class="elemento">
        <div>
            <label>Nome da escola<br></br></label>
            <input class="inputgeral" name="esc_razao_social" id="esc_razao_social" style="width: 100%;" type='text' placeholder='Digite o nome da escola' autoComplete='off' required />
        </div>
        </div>
        <div class="elemento">
        <div>
            <label>Endereco<br></br></label>
            <input class="inputgeral" name="esc_endereco" id="esc_endereco" 
            style="width: 100%;" type='text' placeholder='Digite o endereco da escola'
             autoComplete='off' required />
        </div>
        </div>
        <div class="elemento">
        <div>
            <label>Bairro<br></br></label>
            <input class="inputgeral" name="esc_bairro" id="esc_bairro" style="width: 100%;" type='text' placeholder='Digite o bairro da escola' autoComplete='off' required/>
        </div>
        </div>

        <div class="elemento">
        <div>
            <label>Município<br></br></label>
            <input class="inputgeral" name="esc_municipio" id="esc_municipio"  style="width: 100%;" type='text' placeholder='Cidade' autoComplete='off' required/>
        </div>
        </div>
        <div class="elemento">
        <div>
            <label>CEP<br></br></label>
            <input class="inputgeral" name="esc_cep" id="esc_cep"  style="width: 100%;" id="cep" type='text' placeholder=' * *   * * * - * * * ' autoComplete='off' required/>
        </div>
        </div>
        <div class="elemento">
        <div>
            <label>Estado<br></br></label>
            <select class="selectgeral" name = "esc_uf" id="esc_uf" style="width: 100%;" autoComplete='off' required>
                <option value=""></option>
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
        <div class="elemento">
        <div>
            <label>Telefone da Escola<br></br></label>
            <input class="inputgeral" style="width: 100%;"name="esc_telefone" id="esc_telefone" type='text' placeholder='( * * ) * * * * * - * * * *' autoComplete='off' required/>
        </div>
        </div>
        <div class="elemento">
        <div>
            <label>Email da escola<br></br></label>
            <input class="inputgeral" style="width: 100%;" name="esc_email" id="esc_email"   type='text' placeholder='Digite o email da escola' autoComplete='off' required/>
        </div>
        </div>
  
          
            
        </section>
<div class="di button-container">
    <button class="submitbtn" type="submit" name="submit">Enviar</button> 
    <button class="cancelbtn" id="fecharintituicao">Cancelar</button> 
    <a class="listarbtn" id="listarbtn" data-url="controller/imprime_escola.php">Listar</a>
</div>
        

            <div id="lista-container"></div>
        </div>
    </form>
</div>
