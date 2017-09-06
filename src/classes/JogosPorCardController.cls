public with sharing class JogosPorCardController {
	@AuraEnabled
	public static List<PossuiJogo__c> getJogos(Id jogador) {
		return [SELECT Id, Name, Status__c, Nota__c, Recomendaria__c,Jogo__c,Jogador__c, Comentarios__c FROM PossuiJogo__c WHERE Jogador__c=: jogador];
	}
}