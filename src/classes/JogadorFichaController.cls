public with sharing class JogadorFichaController {
	@AuraEnabled
	public static List<Jogador__c> getJogadores() {
		return [SELECT Id, Name, CEP__c, CPF__c, Pais__c FROM Jogador__c];
	}
}