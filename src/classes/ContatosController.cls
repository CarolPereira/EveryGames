public with sharing class ContatosController {
	
	@AuraEnabled
	public static List<Contact> buscarContas(Id idConta) {
		return [SELECT
					Id,
					Name,
					Title,
					Email,
					Phone
				FROM
					Contact
				WHERE
					AccountId =: idConta
		];
	}

	public class ContaTO {

		public Account conta;
		public List<Contact> contatos;
		public List<Opportunity> oportunidades;
	}
}