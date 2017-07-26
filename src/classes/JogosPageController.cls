public with sharing class JogosPageController {

	public JogosPageController(ApexPages.StandardController stdController) {}

	public JogosPageController() {}

	@remoteAction
	public static List<Jogo__c> buscarJogoPagina(){
		return [SELECT
					Id,
					Name,
					DataLancamento__c,
					Franquia__r.Name,
					Franquia__c,
					TAG__c,
					NotaGeral__c,
					Plataforma__r.Name,
					Plataforma__c,
					Produtora__c,
					Sinopse__c,
					URLImagem__c
				FROM
					Jogo__c
				WHERE
					Id = 'a1W6A000000IPZA'
		];
	}

	@remoteAction
	public static List<String> buscarVideos() {
		
		List<Jogo__c> lstJogos = new List<Jogo__c>();
		List<String> lstVideosURL = new List<String>();

		lstJogos = [SELECT
						Id,
						Videos__c
					FROM
						Jogo__c
					WHERE
						Id = 'a1W6A000000IPZA'
		];

		for(Jogo__c jogo : lstJogos) {
			
			lstVideosURL = jogo.Videos__c.replace('watch?v=','embed/').split(';');
		}
		return lstVideosURL;
	}

	@remoteAction
	public static List<String> buscarTAGs() {

		List<Jogo__c> lstJogos = new List<Jogo__c>();
		List<String> lstTags = new List<String>();

		lstJogos = [SELECT
						Id,
						TAG__c
					FROM
						Jogo__c
					WHERE
						Id = 'a1W6A000000IPZA'
		];

		for(Jogo__c jogo : lstJogos) {

			lstTags = jogo.TAG__c.split(';');
		}
		return lstTags;
	}
}