public class JogadorTriggerHandler extends TriggerHandler {
	
	protected override void beforeInsert() {
		JogadorBO.getInstance().validarRegistroJogador(trigger.new, (Map<Id, Jogador__c>)trigger.oldMap);
	}

	protected override void beforeUpdate() {
		JogadorBO.getInstance().validarRegistroJogador(trigger.new, (Map<Id, Jogador__c>)trigger.oldMap);
	}

	protected override void afterInsert() {

	}

	protected override void afterUpdate() {
		
	}
}