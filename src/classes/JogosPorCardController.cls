public with sharing class JogosPorCardController {
	@AuraEnabled
	public static List<PossuiJogo__c> getJogos() {
		return [SELECT Id, Name, Status__c, Nota__c, Recomendaria__c,Jogo__c,Jogador__c, Comentarios__c FROM PossuiJogo__c];
	}
}