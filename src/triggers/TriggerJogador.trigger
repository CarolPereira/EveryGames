trigger TriggerJogador on Jogador__c (before insert, before update, after insert, after update) {
	new JogadorTriggerHandler().run();
}