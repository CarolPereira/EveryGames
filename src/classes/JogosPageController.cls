public with sharing class JogosPageController {

	public JogosPageController(ApexPages.StandardController stdController) {}

	public JogosPageController() {}

	@remoteAction
	public static List<Jogo__c> buscarJogoPagina(){
		return [SELECT
					Id,
					Name,
					DataLancamento__c,
					Franquia__c,
					Genero__c,
					NotaGeral__c,
					Plataforma__c,
					Produtora__c,
					Sinopse__c
				FROM
					Jogo__c
				WHERE
					Id = 'a1W6A000000IPZA'
		];
	}
}