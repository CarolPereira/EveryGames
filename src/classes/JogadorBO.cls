public class JogadorBO {

	private static final JogadorBO instance = new JogadorBO();

	public static JogadorBO getInstance() {
		return instance;
	}

	private JogadorBO() { }

	// verifica alterações ou novos registros de jogador, e chama os outros metodos
	public void validarRegistroJogador(List<Jogador__c> lstJogadores, Map<Id, Jogador__c> mapOldJogadores) {

		//Garante instancia de mapOld
		if(mapOldJogadores == null)
			mapOldJogadores = new Map<Id, Jogador__c>();

		//Filtra jogadores novos ou alteração no cpf
		for(Jogador__c jogador : lstJogadores) {
			Jogador__c jogadorOld = mapOldJogadores.get(jogador.Id);

			if(jogadorOld != null && jogadorOld.CPF__c != jogador.CPF__c && jogador.CPF__c != null)
				if(!validarCPF(jogador.CPF__c))
					jogador.CPF__c.addError('O CPF informado não é válido.');
		}
	}

	// Valida CPF por digitos verificadores
	public Boolean validarCPF(String cpf) {
		// Monta lista de digitos com a string do parametro
		List<String> lstDigitos = cpf.replace('-','').replace('.','').split('');
		
		// valor é a variavel boolean para retornar e validaDigito define o digito que está verificando
		Boolean valor = false;
		Integer validaDigito = 0;
		
		// Vai rodar apenas duas vezes (0 e 1)
		while(validaDigito < 2) {
			
			// O contador é utilizado para multiplicar o digito e definir qual é o digito que está sendo verificado
			Integer cont = validaDigito;
			Integer soma = 0;
			validaDigito++;

			//Pega o digito da lista de digitos
			for(String digito : lstDigitos) {
				// O split pode dar alguns problemas com caracteres vazios, então filtrar esses valores é importante
				if(digito != null && digito != '') {

					if(cont<10){
						soma = soma + (cont * Integer.valueOf(digito));
						cont++;
					}
					else{
						// valida o valor do digito aqui
						if(math.mod(soma,11) == Integer.valueOf(digito) || (Integer.valueOf(digito) == 0 && math.mod(soma,11) == 10)){
							valor = true;
							cont++;
						}
						else{
							if(cont == 10){
								valor = false;
								return valor;
							}
						}
					}
				}
			}
		}
		return valor;
	}
}