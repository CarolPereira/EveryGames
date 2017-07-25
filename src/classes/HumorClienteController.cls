public class HumorClienteController {

	public HumorClienteController(ApexPages.StandardController stdController) {}

	public HumorClienteController() {}

	@remoteAction
	public static List<Case> buscarCasosCliente(Id casoId){
		
		Case caso = CasoDAO.getInstance().buscarCasoPorId(casoId);
		
		List<Case> lstCasos = new List<Case>();
		lstCasos = CasoDAO.getInstance().buscarCasosPorAccountId(caso.AccountId);
		return lstCasos;
	}

	@remoteAction
	public static List<Account> buscarInfoCliente(Id casoId){
		
		Case caso = CasoDAO.getInstance().buscarCasoPorId(casoId);
		
		List<Account> lstConta = new List<Account>();
		lstConta = AccountDAO.getInstance().buscarContaPorId(caso.AccountId);
		return lstConta;
	}

	@remoteAction
	public static List<String> buscarHistoricoConta(Id contaId){
		List<String> lstEnderecoAtualizado = new List<String>();
		List<AccountHistory> lstHistorico = new List<AccountHistory>();
		
		lstHistorico = AccountDAO.getInstance().buscarHistoricoPorEndereco(contaId);
		Datetime hoje = Date.Today();
		
		// Se não tiver registro no histórico está desatualizado
		if(lstHistorico.isEmpty()){
			lstEnderecoAtualizado.add('false');
			return lstEnderecoAtualizado;
		}
		
		// Faz três meses depois da última atualização do endereço?
		if(hoje >= lstHistorico[0].CreatedDate.addMonths(3)) {
			lstEnderecoAtualizado.add('false') ;
		}else{
			lstEnderecoAtualizado.add('true');
		}

		return lstEnderecoAtualizado;
	}
}